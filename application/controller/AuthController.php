<?php


namespace application\controller;


use application\core\AppController;
use application\service\AccessTokenService;
use application\service\ApiClientService;
use application\service\AuthService;
use application\service\UserService;
use application\util\ControllerUtil;
use application\util\FilterUtils;
use application\util\i18next;
use application\util\SecurityUtil;
use application\util\SystemConstant;
use application\util\UploadUtil;

class AuthController extends AppController
{
    /**
     * @var UserService
     */
    private $userService;
    /**
     * @var AccessTokenService
     */
    private $accessTokenService;
    /**
     * @var AuthService
     */
    private $authService;
    /**
     * @var ApiClientService
     */
    private $apiClientService;

    public function __construct($databaseConnection)
    {
        $this->setDbConn($databaseConnection);
        $this->userService = new UserService($this->getDbConn());
        $this->authService = new AuthService($this->getDbConn());
        $this->accessTokenService = new AccessTokenService($this->getDbConn());
        $this->apiClientService = new ApiClientService($this->getDbConn());
    }

    public function signin()
    {
        $apiClientName = SecurityUtil::getReqHeaderByAtt(SystemConstant::API_NAME_ATT); //ไปถามหาว่า apiClient ใน Header มีค่าเป็นอะไร ในที่นี้มีค่าเป็น default แล้วเก็บค่าไว้ใน apiClientName
        if (!$apiClientName) { //ถ้าไม่มีให้แสดง error Api Client Not found
            jsonResponse([//แสดงผล error เป็น json 
                SystemConstant::SERVER_STATUS_ATT => false, //status:false
                SystemConstant::SERVER_MSG_ATT => 'Api Client Not found',//message:Api Client Not found
            ], 401);
        }

        $apiClient = $this->apiClientService->findByApiName($apiClientName);//ไปเช็คใน ตาราง api_client ว่า api_name มีตรงกันกับ api_name ที่ส่งไปไหม
        if (!$apiClient) {//ถ้าไม่มีให้แสดง error Api Client Not found
            jsonResponse([//แสดงผล error เป็น json 
                SystemConstant::SERVER_STATUS_ATT => false,//status:false
                SystemConstant::SERVER_MSG_ATT => 'Api Client Not found',//message:Api Client Not found
            ], 401);
        }

        $jsonData = $this->getJsonData();//past true for convert object class to objec array // แปลงข้อมูลจาก json มาเก็บใน $jsonData
        $data = $this->setResponseStatus([], false, i18next::getTranslation('error.err_username_or_passwd_notfound')); //เก็บ error ไว้รอเเสดงผลหากไม่เข้าเงื่อนไขด้านล่าง
        if ($jsonData) {//ถ้า jsondata มีข้อมูล
            $email = FilterUtils::filterVarString($jsonData->_u); //ตั้งรูปแบบข้อมูล _u ที่ได้รับจาก body.row ให้เป็น string แล้วเก็บค่าใน email
            $userpwd = FilterUtils::filterVarString($jsonData->_p);//ตั้งรูปแบบข้อมูล _p ที่ได้รับจาก body.row ให้เป็น string แล้วเก็บค่าใน userpwd

            $data = $this->authService->signin($email, $userpwd);//นำข้อมูลที่ได้้ไปทำการตรวจสอบด้วย mathod signin โดยแนบค่า email และ userpwd

            if ($data->status && $data->apiKey != null) { // ถ้า attribute status และ apiKey ใน object data ไม่เป็นค่า null
                $appuserData = $this->userService->findByEmail($email); //ให้ทำการเรียก mothod findByEmail พร้อมด้วย parameter email แล้วมาเก็บค่าใน appuserData
                if ($appuserData) {//ถ้าหาก appuserData มีข้อมูลแล้ว

                    $responseData = $this->userService->findUserDataById($appuserData->id); //ไปดึงข้อมูลของ user 
                    $responseData->apiKey = $this->accessTokenService->createNewToken($data->apiKey, $appuserData->id, $apiClient->id, $apiClient->api_token);//สร้าง api key
                      
                    $data->userData = $responseData; // เอาค่าใน responseDaata ไปเก็บใน object userData
                    unset($data->apiKey);// ทำลายค่า api key ที่ได้จาก service ทิ้ง
                }
            }
        }
        jsonResponse($data); //โชวข้อมูลที่อยู่ใน data ออกมาเป็น json 

    }

    public function userLogout()
    {
        $this->accessTokenService->logoutAction();
        jsonResponse([
            SystemConstant::SERVER_STATUS_ATT => true,
            SystemConstant::SERVER_MSG_ATT => i18next::getTranslation('error.logoutSuccess'),
        ]);
    }

    public function userCheckAuth()
    {
        $uid = SecurityUtil::getAppuserIdFromJwtPayload();
//        jsonResponse($this->userService->findUserDataById($uid));
        jsonResponse([
            SystemConstant::SERVER_STATUS_ATT => true,
            'userData' => $this->userService->findUserDataById($uid),
        ]);
    }

    public function changePwd()
    {
        $uid = SecurityUtil::getAppuserIdFromJwtPayload();
        $this->pushDataToView = $this->getDefaultResponse(false);
        $jsonData = $this->getJsonData();
        if (!empty($jsonData) && !empty($uid)) {

            //validate old pwd
            $user = $this->userService->findUserDataById($uid);
            $userpwd = FilterUtils::filterVarString($jsonData->oldPassword);

            $data = $this->authService->signin($user->email, $userpwd);
            if ($data->status && $data->apiKey != null) {

                $newPwd = FilterUtils::filterVarString($jsonData->_p);
                $randomSalt = ControllerUtil::getRadomSault();
                $effectRow = $this->userService->update([
                    'password' => ControllerUtil::genHashPassword($newPwd, $randomSalt),
                    'salt' => $randomSalt
                ], ['id' => $uid]);

                if ($effectRow) {
                    //logout device
                    if ($jsonData->logoutAll) {
                        $this->accessTokenService->logoutAllAction();
                    } else {
                        $this->accessTokenService->logoutAction();
                    }

                    $this->pushDataToView = $this->setResponseStatus([], true, i18next::getTranslation(('success.changePasswordOk')));
                } else {
                    $this->pushDataToView = $this->setResponseStatus([], false, i18next::getTranslation('error.error_something_wrong'));
                }
            }else{
                $this->pushDataToView = $this->setResponseStatus([], false, i18next::getTranslation('error.passwordCurrentWrong'));
            }
        }
        jsonResponse($this->pushDataToView);
    }
}