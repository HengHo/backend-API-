<?php
/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/
namespace application\validator;

use application\core\BaseValidator;
use application\model\Directory;
class DirectoryValidator extends BaseValidator
{
    public function __construct(Directory $directory)
    {
        //call parent construct
        parent::__construct();
        $this->objToValidate = $directory;
        $this->validateField('yearbook_id', self::VALIDATE_INT);
        $this->validateField('birth', self::VALIDATE_DATE);
        $this->validateField('admission', self::VALIDATE_DATE);
        $this->validateField('graduation', self::VALIDATE_DATE);
        $this->validateField('phone', self::VALIDATE_INT);
        $this->validateField('created_by', self::VALIDATE_INT);
        $this->validateField('updated_by', self::VALIDATE_INT);
        $this->validateField('updated_date', self::VALIDATE_REQUIRED);

        //Custom Validate
        /*
        if($directory->getPrice < $directory->getDiscount){
          $this->addError('price', 'Price Can't Must than Discount');
        }
        */
    }
}