<?php
/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/
namespace application\validator;

use application\core\BaseValidator;
use application\model\Yearbook;
class YearbookValidator extends BaseValidator
{
    public function __construct(Yearbook $yearbook)
    {
        //call parent construct
        parent::__construct();
        $this->objToValidate = $yearbook;
        $this->validateField('created_by', self::VALIDATE_INT);
        $this->validateField('created_date', self::VALIDATE_REQUIRED);

        //Custom Validate
        /*
        if($yearbook->getPrice < $yearbook->getDiscount){
          $this->addError('price', 'Price Can't Must than Discount');
        }
        */
    }
}