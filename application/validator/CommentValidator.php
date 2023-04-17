<?php
/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/
namespace application\validator;

use application\core\BaseValidator;
use application\model\Comment;
class CommentValidator extends BaseValidator
{
    public function __construct(Comment $comment)
    {
        //call parent construct
        parent::__construct();
        $this->objToValidate = $comment;
        $this->validateField('directory_id', self::VALIDATE_INT);
        $this->validateField('created_by', self::VALIDATE_INT);
        $this->validateField('created_date', self::VALIDATE_REQUIRED);
        $this->validateField('updated_by', self::VALIDATE_INT);

        //Custom Validate
        /*
        if($comment->getPrice < $comment->getDiscount){
          $this->addError('price', 'Price Can't Must than Discount');
        }
        */
    }
}