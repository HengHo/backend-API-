<?php
/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/

namespace application\model;

use application\core\BaseModel;
class Comment extends BaseModel
{
    public static $tableName = 'comment';
    public $id;
    public $directory_id;
    public $comment_directory;
    public $created_user;
    public $created_date;
    public $updated_user;
    public $updated_date;
    public function __construct(\stdClass $jsonData = null, $uid = null, $isUpdate = false)
    { 
       //not use audit info 
        $this->setAuditInfo(false); 

        /* init data type for field*/
        $this->setTableField(array(
            'id' => self::TYPE_AUTO_INCREMENT,
            'directory_id' => self::TYPE_INTEGER,
            'comment_directory' => self::TYPE_STRING,
            'created_user' => self::TYPE_INTEGER,
            'created_date' => self::TYPE_STRING,
            'updated_user' => self::TYPE_INTEGER,
            'updated_date' => self::TYPE_STRING,
        )); 
 
        /* init data type for field use in update mode*/
        $this->setTableFieldForEdit(array(
            'directory_id' => self::TYPE_INTEGER,
            'comment_directory' => self::TYPE_STRING,
            'created_user' => self::TYPE_INTEGER,
            'created_date' => self::TYPE_DATE_TIME,
            'updated_user' => self::TYPE_INTEGER,
            'updated_date' => self::TYPE_DATE_TIME,
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