<?php
/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/
/**
 * Created by Bekaku Php Back End System.
 * Date: 2023-03-23 10:38:03
 */

namespace application\controller;

use application\core\AppController;
use application\util\FilterUtils;
use application\util\i18next;
use application\util\SystemConstant;
use application\util\SecurityUtil;
use application\util\UploadUtil;
use application\service\UserService;
use application\service\YearbookService;
use application\model\Directory;
use application\service\DirectoryService;
use application\controller\UtilController;

class DirectoryController extends  AppController
{
    /**
    * @var DirectoryService
    */
    private $directoryService;
    private $userService;
    private $yearbookService;
    private $util;

    public function __construct($databaseConnection)
    {
        $this->setDbConn($databaseConnection);
        $this->directoryService = new DirectoryService($this->getDbConn());
        $this->userService = new UserService($this->getDbConn());
        $this->yearbookService = new YearbookService($this->getDbConn());
        $this->util = new UtilController($this->getDbConn());
        
    }
    public function __destruct()
    {
        $this->setDbConn(null);
        unset($this->directoryService);
    }
    public function crudList()
    {
        $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) > 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
        $this->setRowPerPage($perPage);
        $q_parameter = $this->initSearchParam(new Directory());

        $this->pushDataToView = $this->getDefaultResponse();
        $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->directoryService->findAll($this->getRowPerPage(), $q_parameter);
        $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->directoryService->getTotalPaging();
        jsonResponse($this->pushDataToView);
    }
    public function crudAdd()
    {
        $uid = SecurityUtil::getAppuserIdFromJwtPayload();
        $jsonData = $this->getJsonData(false);
        $this->pushDataToView = $this->getDefaultResponse(false);

        if(!empty($jsonData) && !empty($uid)) {
            // $InDb = $this->directoryService->findByIdYearbook($jsonData->yearbook_id);

            //     // jsonResponse($majorclassInDb);
            // if (!empty($InDb)) {
            //     jsonResponse([
            //         'error'=>i18next::getTranslation('error.duplicateMajorClass',['data'=>$jsonData->major." ".$jsonData->class])
            //     ]);
            // }

           $entity = new Directory($jsonData, $uid, false);
               $lastInsertId = $this->directoryService->createByObject($entity);
               if ($lastInsertId) {
                    $this->pushDataToView = $this->setResponseStatus([SystemConstant::ENTITY_ATT => $this->directoryService->findById($lastInsertId)], true, i18next::getTranslation(('success.insert_succesfull')));
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
            $item = $this->directoryService->findById($id);
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
		
        if(!empty($jsonData) && !empty($uid)) {
           $directory = new Directory($jsonData, $uid, true);
           $tabel = "directory";
            $this->util->dellImg($directory->id,$tabel);

                if (isset($directory->id)) {
                   $effectRow = $this->directoryService->updateByObject($directory, array('id' => $directory->id));
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
                $entity = $this->directoryService->findById($id);
                if ($entity) {
                    $effectRow = $this->directoryService->deleteById($id);
                    if (!$effectRow) {
                        $this->pushDataToView = $this->setResponseStatus($this->pushDataToView, false, i18next::getTranslation('error.error_something_wrong'));
                        break;
                    }
                }
            }
        }
        jsonResponse($this->pushDataToView);
    }
    public function ListYearbook()
    {   $yearbook = FilterUtils::filterGetInt(SystemConstant::ID_PARAM);
        $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT)> 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
        $this->setRowPerPage($perPage);
        $q_parameter = $this->initSearchParam(new Directory());

        $this->pushDataToView = $this->getDefaultResponse();
        $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->directoryService->findByIdYearbook($yearbook,$this->getRowPerPage(),$q_parameter);
        $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->directoryService->getTotalPaging();
        jsonResponse($this->pushDataToView);
    }
    public function directoryConfirm()
    {
        $this->pushDataToView = $this->getDefaultResponse(false);
        $idParam = FilterUtils::filterGetString(SystemConstant::ID_PARAM);
        if($entity = $this->directoryService->findById($idParam)){
            if($entity){
                // jsonResponse($entity);
                if($entity->status === "confirm"){
                    $confirm = "onhold";
                }else{
                    $confirm = 1;
                }
                $effect = $this->directoryService->update([
                
                'status'=> $confirm   
                ],['id'=>$entity->id]);
            if($effect){
                // $this->pushDataToView = $this->setResponseStatus($this->pushDataToView, false, i18next::getTranslation('error.error_something_wrong'));
                $this->pushDataToView = $this->getDefaultResponse();
            }
                
            }
        }
        jsonResponse($this->pushDataToView);
    }

    public function notify()
    {
        $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT)> 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
        $this->setRowPerPage($perPage);
        $q_parameter = $this->initSearchParam(new Directory());
        
        $this->pushDataToView = $this->getDefaultResponse();
        // $this->pushDataToView[SystemConstant::DATA_LIST_ATT]= $this->commentService->findByIdDirectory($idDir,$this->getRowPerPage(),$q_parameter);
        // $this->userService->findById($this->pushDataToView->created_by);
        $user =  $this->directoryService->findIdByStatus("onhold",$this->getRowPerPage(),$q_parameter);
        $userAbout = array();
        foreach($user as $item){
             
                $item->userabout = $this->userService->findById($item->created_by);
                unset($item->userabout->password);
                unset($item->userabout->salt);
                unset($item->userabout->status);
                unset($item->userabout->created_at);
                unset($item->userabout->updated_at);
                unset($item->userabout->created_user);
                unset($item->userabout->updated_user);
                $item->yearbook = $this->yearbookService->findById($item->yearbook_id);
                

            //    jsonResponse($item->userabout);
                array_push($userAbout, $item);
                 
        }
        $this->pushDataToView[SystemConstant::DATA_LIST_ATT]=$userAbout;
        $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->directoryService->getTotalPaging();
        jsonResponse($this->pushDataToView);
        // jsonResponse($item);

    }
       // public function imageUpload()
    // {
    //     $uid = SecurityUtil::getAppuserIdFromJwtPayload();
    //     $this->pushDataToView = $this->getDefaultResponse(false);
    //     if(isset($_FILES['filename']) && is_uploaded_file($_FILES['filename']['tmp_name'])){
    //         $newname = UploadUtil::getUploadFileName($uid);
    //         $imagename = UploadUtil::uploadImgFiles($_FILES['filename'],null,0,$newname);
    //         // $this->pushDataToView = $this->setResponseStatus([], true, i18next::getTranslation(('success.success')));
    //     }
    //     // jsonResponse($this->pushDataToView.$imagename);
    //     jsonResponse($imagename);
    // }
    

   


    public function validation()
    {
        $uid = SecurityUtil::getAppuserIdFromJwtPayload();
        $y = $_GET['year'];
        (string) $sum = $y+543;
        $sub = substr($sum,2);
        $check = $this->directoryService->findByIduser($uid);
        $result = [];
        if(!$check){
            // $result=>true;
            $this->pushDataToView["status"] = true;
            $this->pushDataToView["year"] = $sub;
        }
        $this->pushDataToView["status"] = false;
            $this->pushDataToView["year"] = $sub;
        jsonResponse($this->pushDataToView);
    
    }
}

// ini_set("memory_limit","2024M");