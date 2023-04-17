<?php

namespace application\service;

use application\core\BaseDatabaseSupport;
use application\model\User;
use application\serviceInterface\UserServiceInterface;
use application\util\UploadUtil;

class UserService extends BaseDatabaseSupport implements UserServiceInterface
{
    protected $tableName = 'user';

    public function __construct($dbConn)
    {
        $this->setDbh($dbConn);
    }

    public function findAll($perpage = 0, $q_parameter = array())
    {
        //if have param
        $data_bind_where = null;

        $query = "SELECT id, username, email, image, status, created_at ";

        $query .= "FROM user AS user ";

        //default where query
        $query .= " WHERE user.`id` IS NOT NULL ";
        //custom where query
        //$query .= "WHERE user.custom_field =:customParam ";

        //gen additional query and sort order
        $additionalParam = $this->genAdditionalParamAndWhereForListPageV2($q_parameter,new User());
        if (!empty($additionalParam)) {
            if (!empty($additionalParam['additional_query'])) {
                $query .= $additionalParam['additional_query'];
            }
            if (!empty($additionalParam['where_bind'])) {
                $data_bind_where = $additionalParam['where_bind'];
            }
        }

        //custom where paramiter
        // $data_bind_where['custom_field']=$paramValue;
        //end
        //paging buider
        if ($perpage > 0) {
            $query .= $this->pagingHelper($query, $perpage, $data_bind_where);
        }
        //regular query
        $this->query($query);

        //START BIND VALUE FOR REGULAR QUERY
        //$this->bind(":q_name", "%".$q_parameter['q_name']."%");//bind param for 'LIKE'
        //$this->bind(":q_name", $q_parameter['q_name']);//bind param for '='
        //END BIND VALUE FOR REGULAR QUERY
        //bind param for search param
        $this->genBindParamAndWhereForListPage($data_bind_where);
        $listTmp = $this->list();
        $list = [];
        if ($listTmp) {
            foreach ($listTmp AS $item) {
                $item->id = (int)$item->id;
                $item->picture = UploadUtil::getProfilePicApi($item->image, $item->created_at);
                $item->status = (bool)$item->status;
                $item->userRoles = $this->findUserRolesId($item->id);
                unset($item->image);
                array_push($list, $item);
            }
        }
        return $list;
    }
    public function findAlladmin($perpage = 0, $q_parameter = array())
    {
        //if have param
        $data_bind_where = null;

        $query = "SELECT id, username, email, image, status, created_at ";

        $query .= "FROM user AS user ";

        //default where query
        $query .= " WHERE user.`id` IS NOT NULL AND user.`stucode` = ''";
        //custom where query
        //$query .= "WHERE user.custom_field =:customParam ";

        //gen additional query and sort order
        $additionalParam = $this->genAdditionalParamAndWhereForListPageV2($q_parameter,new User());
        if (!empty($additionalParam)) {
            if (!empty($additionalParam['additional_query'])) {
                $query .= $additionalParam['additional_query'];
            }
            if (!empty($additionalParam['where_bind'])) {
                $data_bind_where = $additionalParam['where_bind'];
            }
        }

        //custom where paramiter
        // $data_bind_where['custom_field']=$paramValue;
        //end
        //paging buider
        if ($perpage > 0) {
            $query .= $this->pagingHelper($query, $perpage, $data_bind_where);
        }
        //regular query
        $this->query($query);

        //START BIND VALUE FOR REGULAR QUERY
        //$this->bind(":q_name", "%".$q_parameter['q_name']."%");//bind param for 'LIKE'
        //$this->bind(":q_name", $q_parameter['q_name']);//bind param for '='
        //END BIND VALUE FOR REGULAR QUERY
        //bind param for search param
        $this->genBindParamAndWhereForListPage($data_bind_where);
        $listTmp = $this->list();
        $list = [];
        if ($listTmp) {
            foreach ($listTmp AS $item) {
                $item->id = (int)$item->id;
                $item->picture = UploadUtil::getProfilePicApi($item->image, $item->created_at);
                $item->status = (bool)$item->status;
                $item->userRoles = $this->findUserRolesId($item->id);
                unset($item->image);
                array_push($list, $item);
            }
        }
        return $list;
    }

    public function findById($id)
    {
        $query = "SELECT *  ";
        $query .= "FROM user AS user ";
        $query .= "WHERE user.`id`=:id ";

        $this->query($query);
        $this->bind(":id", (int)$id);
        $item = $this->single();
        if ($item) {
            $item->id = (int)$item->id;
            $item->picture = UploadUtil::getProfilePicApi($item->image, $item->created_at);
            $item->status = (bool)$item->status;
            $item->userRoles = $this->findUserRolesId($item->id);
            return $item;
        }
        return null;
    }

    public function findUserDataById($id)
    {
        $query = "SELECT user.id,stucode, username, email, image, created_at, user.status, GROUP_CONCAT(r.name) AS rolesText  FROM `user`
         LEFT JOIN user_role ur ON user.`id` = ur.user 
         LEFT JOIN role r ON r.`id` = ur.role
         WHERE user.`id`=:id ";
        $this->query($query);
        $this->bind(":id", (int)$id);
        $data = $this->single();
        if ($data) {
            $data->picture = UploadUtil::getProfilePicApi($data->image, $data->created_at);
            $data->status = (bool)$data->status;
            $data->userRoles = $this->findUserRolesId($data->id);
            $data->major = substr($data->stucode,2,-4);
            $data->year = substr($data->stucode,0,-9);
            return $data;
        }
        return null;
    }

    public function findByStuCode($StuCode)
    {
        $query = "SELECT *  ";
        $query .= "FROM user AS user ";
        $query .= "WHERE user.`stucode`=:stu_code ";
        $this->query($query);
        $this->bind(":stu_code", (string)$StuCode);
        return $this->single();
    } 
    public function findByadmin($val)
    {
        $query = "SELECT *  ";
        $query .= "FROM user AS user ";
        $query .= "WHERE user.`stucode`='' AND user.username LIKE :name ";
        $this->query($query);
        // $this->bind(":stu_code", (string)$val);
        $this->bind(":name", '%'.$val.'%');
        return $this->list();
    }
    public function findByUsername($username,)
    {
        $query = "SELECT *  ";
        $query .= "FROM user AS user ";
        $query .= "WHERE user.`username`LIKE :username ";
        $this->query($query);
        $this->bind(":username", '%'.$username.'%');
        return $this->list();
    }

    public function findByEmail($email)
    {
        $query = "SELECT *  ";
        $query .= "FROM user AS user ";
        $query .= "WHERE user.`email`=:email ";
        $this->query($query);
        $this->bind(":email", (string)$email);
        return $this->single();
    }

    public function findForAuthenByEmail($email) //-----------------------------------------------------mothod ค้นหา email ของเจ้าของ
    {
        $query = "SELECT *  ";                                          //                                            \
        $query .= "FROM user AS user ";                                 //                                             \
        $query .= "WHERE user.`email`=:email AND user.status IS TRUE";  //                                              > มันคือการ ใช้คำสั่ง sql ในการ query ข้อมูล user ที่มี email ตรงกับที่ส่งมา
        $this->query($query);  //สั่ง query                                                                       //     /
        $this->bind(":email", (string)$email);// bind ตัวแปรแบบ pdo คือการเอาค่าใน $email มาให้กับ :email            //    /
        return $this->single(); // ส่งข้อมูลเเบบ row เดียวกลับไป
    }

    public function deleteById($id)
    {
        //delete reference table
        $query = "DELETE FROM user_role WHERE user=:id;";
        $query .= "DELETE FROM user_login_log WHERE user=:id;";
        $query .= "DELETE FROM user_login_attempts WHERE user=:id;";
        $query .= "DELETE FROM " . $this->tableName . " WHERE id=:id;";
        $this->query($query);
        $this->bind(":id", (int)$id);
        return $this->execute();
    }

    public function createByArray($data_array)
    {
        return $this->insertHelper($this->tableName, $data_array);
    }

    public function createByObject($oject)
    {
        return $this->insertObjectHelper($oject);
    }

    public function update($data_array, $where_array, $whereType = 'AND')
    {
        return $this->updateHelper($this->tableName, $data_array, $where_array, $whereType);
    }

    public function updateByObject($object, $where_array, $whereType = 'AND')
    {
        return $this->updateObjectHelper($object, $where_array, $whereType);
    }

    public function findUserRolesId($userId)
    {
        $query = "SELECT role FROM user_role WHERE user=:user";
        $this->query($query);
        $this->bind(":user", $userId);
        $listTmp = $this->list();
        $list = [];
        if ($listTmp) {
            foreach ($listTmp AS $item) {
                array_push($list, $item->role);
            }
        }
        return $list;
    }
    // public function subID($id)
    // {
        
    // }
}