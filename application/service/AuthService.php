<?php


namespace application\service;


use application\core\BaseDatabaseSupport;
use application\util\AppUtil;
use application\util\ControllerUtil;
use application\util\DateUtils;
use application\util\FilterUtils;
use application\util\i18next;
use stdClass;

class AuthService extends BaseDatabaseSupport
{

    /**
     * @var UserService
     */
    private $userService;

    public function __construct($dbConn)
    {
        $this->setDbh($dbConn);
        $this->userService = new UserService($this->getDbh());

    }

    public function signin($email, $password, $newSalt = false)
    {

        $result = new stdClass(); // เป็นการประกาศให้ตัวแปล result เป็น Object แบบ Standard ไว้เบื่องต้นหากเกิด error จะนำไปแสดงเลย
        $result->status = false; //กำหนดค่าให้ result->status มีค่าเป็น false
        $result->apiKey = null; // กำหนดค่าให้ result->apiKey มีค่า null
        $result->message = i18next::getTranslation('error.err_username_or_passwd_notfound'); // กำหนดค่า result->message เป็น error.err_username_or_passwd_notfound และสามารถแปลภาษาได้ 

        $loginKeyHash = null;
//        $query = "SELECT id, username, login_password, salt
//					  FROM user WHERE username=:username LIMIT 1";
//        $this->query($query);
//        $this->bind(":username", $userName);

        $userData = $this->userService->findForAuthenByEmail($email); // ตรวจว่า email นี้มีในตาราง user หรือไม่ แล้วนำข้อมูลทั้งหมดใน row ที่ตรงกันมาเก็บในตัวแปร  userData

        if ($this->userService->rowCount() == 1) { //ทำการเรียกใช้ mathod rowCount นับ row ของข้อมูลที่ทำการตรวจสอบในคำสั่งข้างบน
            $userIdInDb = $userData->id; // นำข้อมูลใน obj userData ใน Attribute ที่มีชื่อว่า id ไปเก็บไว้ใน userIdInDb
            $userSaltInDb = $userData->salt; // นำข้อมูลใน obj userData ใน Attribute ที่มีชื่อว่า salt ไปเก็บไว้ใน userSaltInDb
            $hashPasswordInDb = $userData->password; // นำข้อมูลใน obj userData ใน Attribute ที่มีชื่อว่า password ไปเก็บไว้ใน hashPasswordInDb

            if ($this->checkBrute($userIdInDb) == true) { // ส่ง userIdInDb ไปทำการตรวจการพยายามเข้ารหัสในmathod checkBrute ถ้าหากมันเป็นจริงให้แสดง error
                $result->message = i18next::getTranslation('error.accountLocked'); //เก็บข้อความ error ไว้ใน $result->message รอทำการส่งกลับ
            } else { //และเมื่อมันเป็นเท็จจะให้
                $inputHashPassword = ControllerUtil::genHashPassword($password, $userSaltInDb);// ทำการสร้าง Hashpassword เรียกเข้าใจง่ายว่ารหัสผสม โดยส่ง passwordที่รับมา และ userSaltInDbหรือค่าเกลือที่สุ่มขึ้นมาแล้วเก็บไว้ในฐานข้อมูล ไปที่ mathod ControllerUtil::genHashPassword

                // Check if the password in the database matches the password the user submitted.
                if ($inputHashPassword == $hashPasswordInDb) { // ถ้ารหัสที่รับมาตรงกับรหัสในฐานข้อมูล 
                    //update user logined to db
                    $this->updateUserLogin($userIdInDb); // ให้ไปเพิ่มข้อมูลใน ตาราง user_login_log
                    //generate new salt if required
                    if ($newSalt) {
                        $this->userUpdateSalt($password, $userIdInDb);
                    }
                    // Get the user-agent string of the user. for apiKey
                    $hashUserDescription = ControllerUtil::genHashPassword(FilterUtils::filterServer('HTTP_USER_AGENT'), $userIdInDb . DateUtils::getTimeNow()); // ส่งค่า สักอย่าง และ idUser และเวลาปัจจุบัน ไปทำการเข้ารหัสแล้วมาเก็บค่าใน hashUserDescription
                    $result->apiKey = ControllerUtil::genHashPassword(ControllerUtil::getRadomSault(), $hashUserDescription);// ส่งค่าเกลือที่ทำการสุ่มใหม่ และ ค่า hashUserDescription ไปทำการเข้ารหัสอีกครั้งเพื่อเก็บเป็น apiKey ในอยู่ใน object result
                    $result->message = i18next::getTranslation('success.loginSuccess'); //เก็บ ผลที่สามารถแปลภาษาได้ ว่า สำเร็จ ไว้ใน massage ใน object massage
                    $result->status = true; // เก็บ true ไว้ใน status 

                } else { //ถ้ารหัสไม่ถูก
                    $this->updateLoginFail($userIdInDb);//ให้ทำการเพิ่มขอมูลใน ตาราง user_login_attempts
                }
            }
        }

        return $result; // ส่งผล result กลับ
    }

    private function userUpdateSalt($loginPwd, $userId)
    {
        $randomSalt = ControllerUtil::getRadomSault();
        $pwdHash = ControllerUtil::genHashPassword($loginPwd, $randomSalt);
        $status = $this->updateHelper(
            'user',
            ['salt' => $randomSalt, 'password' => $pwdHash],
            ['id' => $userId],
            'AND');
        if ($status) {
            return $pwdHash;
        }
        return null;
    }

    private function checkBrute($user_id)
    {

        // Get timestamp of current time
        $now = time();
        // All login attempts are counted from the past 2 hours.
        $valid_attempts = $now - (2 * 60 * 60);
        $query = "SELECT `time` FROM user_login_attempts WHERE `user` = :id AND `time` > '$valid_attempts'";
        $this->query($query);
        $this->bind(":id", $user_id);
        $this->execute();
        if ($this->rowCount() > 5) {
            return true;
        } else {
            return false;
        }
    }

    private function updateUserLogin($userIdInDb)
    {

        //insert to app_user_login
        $query = "INSERT INTO user_login_log (loged_in_date, loged_ip, `user` )
                              VALUES (:loged_in_date, :loged_ip, :app_user)";
        $this->query($query);
        $this->bind(":loged_in_date", DateUtils::getDateNow());
        $this->bind(":loged_ip", AppUtil::getRealIpAddr());
        $this->bind(":app_user", $userIdInDb);
        $this->execute();
    }

    private function updateLoginFail($userIdInDb)
    {
        // Password is not correct
        // We record this attempt in the database
        $query = "INSERT INTO user_login_attempts (`user`, `time`, ip_address, created_date )
                              VALUES (:app_user, :timeNow, :ip_address,  :created_date)";
        $this->query($query);
        $this->bind(":app_user", $userIdInDb);
        $this->bind(":timeNow", DateUtils::getTimeNow());
        $this->bind(":ip_address", AppUtil::getRealIpAddr());
        $this->bind(":created_date", DateUtils::getDateNow());
        $this->execute();
    }
}