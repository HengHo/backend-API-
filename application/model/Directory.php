<?php
/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/

namespace application\model;

use application\core\BaseModel;
class Directory extends BaseModel
{
    public static $tableName = 'directory';
    public function __construct(\stdClass $jsonData = null, $uid = null, $isUpdate = false)
    { 
       //not use audit info 
        $this->setAuditInfo(false); 
 
        /* init data type for field*/
        $this->setTableField(array(
            'id' => self::TYPE_AUTO_INCREMENT,
            'yearbook_id' => self::TYPE_INTEGER,
            'birth' => self::TYPE_DATE,
            'nickname' => self::TYPE_STRING,
            'fullname' => self::TYPE_STRING,
            'motto' => self::TYPE_STRING,
            'img' => self::TYPE_STRING,
            'admission' => self::TYPE_DATE,
            'graduation' => self::TYPE_DATE,
            'phone' => self::TYPE_INTEGER,
            'facebook' => self::TYPE_STRING,
            'instagram' => self::TYPE_STRING,
            'created_user' => self::TYPE_INTEGER,
            'created_at' => self::TYPE_STRING,
            'updated_user' => self::TYPE_INTEGER,
            'updated_at' => self::TYPE_STRING,
            'status' => self::TYPE_BOOLEAN,
        )); 
 
        /* init data type for field use in update mode*/
        $this->setTableFieldForEdit(array(
            // 'yearbook_id' => self::TYPE_INTEGER,
            'birth' => self::TYPE_DATE,
            'nickname' => self::TYPE_STRING,
            'fullname' => self::TYPE_STRING,
            'motto' => self::TYPE_STRING,
            'img' => self::TYPE_STRING,
            'admission' => self::TYPE_DATE,
            'graduation' => self::TYPE_DATE,
            'phone' => self::TYPE_INTEGER,
            'facebook' => self::TYPE_STRING,
            'instagram' => self::TYPE_STRING,
            // 'created_user' => self::TYPE_INTEGER,
            // 'created_at' => self::TYPE_STRING,
            'updated_user' => self::TYPE_INTEGER,
            'updated_at' => self::TYPE_STRING,
            'status' => self::TYPE_BOOLEAN,
        ));

        /* init optional field*/
        $this->setTableOptionalField(array(
            //'field_name_option',
        ));

        $this->populate($jsonData, $this, $uid, $isUpdate);
    }

    public static function getTableName()
    {
        return self::$tableName;
    }

}