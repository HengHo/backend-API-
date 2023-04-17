<?php
/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/
/**
 * Created by Bekaku Php Back End System.
 * Date: 2023-03-24 03:55:20
 */

namespace application\controller;

use application\core\AppController;
use application\util\FilterUtils;
use application\util\i18next;
use application\util\SystemConstant;
use application\util\SecurityUtil;
use application\service\UserService;
use application\model\Comment;
use application\service\CommentService ;
use application\controller\UtilController;
use Directory;

class CommentController extends  AppController
{
    /**
    * @var CommentService
    */
    private $commentService;
    private $userService;
    private $util;
    
    public function __construct($databaseConnection)
    {
        $this->setDbConn($databaseConnection);
        $this->commentService = new CommentService($this->getDbConn());
        $this->userService = new UserService($this->getDbConn());
        $this->util = new UtilController($this->getDbConn());

    }
    public function __destruct()
    {
        $this->setDbConn(null);
        unset($this->commentService);
    }
    public function crudList()
    {
        $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) > 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
        $this->setRowPerPage($perPage);
        $q_parameter = $this->initSearchParam(new Comment());

        $this->pushDataToView = $this->getDefaultResponse();
        $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->commentService->findAll($this->getRowPerPage(), $q_parameter);
        $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->commentService->getTotalPaging();
        jsonResponse($this->pushDataToView);
    }
    public function crudAdd()
    {
        $uid = SecurityUtil::getAppuserIdFromJwtPayload();
        $jsonData = $this->getJsonData(false);
        $this->pushDataToView = $this->getDefaultResponse(false);

        if(!empty($jsonData) && !empty($uid)) {
           $entity = new Comment($jsonData, $uid, false);
               $lastInsertId = $this->commentService->createByObject($entity);
               if ($lastInsertId) {
                    $this->pushDataToView = $this->setResponseStatus([SystemConstant::ENTITY_ATT => $this->commentService->findById($lastInsertId)], true, i18next::getTranslation(('success.insert_succesfull')));
                }
        }
        jsonResponse($this->pushDataToView);

    }
    public function crudReadSingle()
    {
        $id = FilterUtils::filterGetInt(SystemConstant::ID_PARAM);
        $this->pushDataToView = $this->getDefaultResponse(false);
        $item = null;
        if ($id > 0) {
            $item = $this->commentService->findById($id);
            if ($item) {
                $this->pushDataToView = $this->getDefaultResponse(true);
            }
        }
        $this->pushDataToView[SystemConstant::ENTITY_ATT] = $item;
        jsonResponse($this->pushDataToView);
    }
    public function crudEdit()
    {
        $uid = SecurityUtil::getAppuserIdFromJwtPayload();
        $jsonData = $this->getJsonData(false);
        $this->pushDataToView = $this->getDefaultResponse(false);
		$tabel = "comment";
        if(!empty($jsonData) && !empty($uid)) {
           $comment = new Comment($jsonData, $uid, true);
                if (isset($comment->id)) {
                   $effectRow = $this->commentService->updateByObject($comment, array('id' => $comment->id));
                   $dell = $this->util->dellImg($comment->$id,$tabel);
                   if ($effectRow) {
                       $this->pushDataToView = $this->setResponseStatus($this->pushDataToView, true, i18next::getTranslation(('success.update_succesfull')));
                   }
               }
       }
        jsonResponse($this->pushDataToView);
    }
    public function crudDelete()
    {
        $this->pushDataToView = $this->setResponseStatus($this->pushDataToView, true, i18next::getTranslation('success.delete_succesfull'));
        $idParams = FilterUtils::filterGetString(SystemConstant::ID_PARAMS);//paramiter format : idOfNo1_idOfNo2_idOfNo3_idOfNo4 ...
        $idArray = explode(SystemConstant::UNDER_SCORE, $idParams);
        if (count($idArray) > 0) {
            foreach ($idArray AS $id) {
                $entity = $this->commentService->findById($id);
                if ($entity) {
                    $effectRow = $this->commentService->deleteById($id);
                    if (!$effectRow) {
                        $this->pushDataToView = $this->setResponseStatus($this->pushDataToView, false, i18next::getTranslation('error.error_something_wrong'));
                        break;
                    }
                }
            }
        }
        jsonResponse($this->pushDataToView);
    }

    public function listbydirectory()
    {
        $idDir = FilterUtils::filterGetInt(SystemConstant::ID_PARAM);
        $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT)> 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
        $this->setRowPerPage($perPage);
        $q_parameter = $this->initSearchParam(new Comment());
        
        $this->pushDataToView = $this->getDefaultResponse();
        // $this->pushDataToView[SystemConstant::DATA_LIST_ATT]= $this->commentService->findByIdDirectory($idDir,$this->getRowPerPage(),$q_parameter);
        // $this->userService->findById($this->pushDataToView->created_by);
        $user =  $this->commentService->findByIdDirectory($idDir,$this->getRowPerPage(),$q_parameter);
        $userAbout = array();
        foreach($user as $item){
             
                $item->userabout = $this->userService->findById($item->created_by);
                unset($item->userabout->password);
                unset($item->userabout->status);
                unset($item->userabout->created_at);
                unset($item->userabout->updated_at);
                unset($item->userabout->created_user);
                unset($item->userabout->updated_user);

            //    jsonResponse($item->userabout);
                array_push($userAbout, $item);
                 
        }
        $this->pushDataToView[SystemConstant::DATA_LIST_ATT]=$userAbout;
        $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->commentService->getTotalPaging();
        jsonResponse($this->pushDataToView);
        // jsonResponse($this->pushDataToView);

    }

}