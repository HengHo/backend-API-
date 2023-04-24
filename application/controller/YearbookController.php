<?php

/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/
/**
 * Created by Bekaku Php Back End System.
 * Date: 2023-03-23 08:12:11
 */

namespace application\controller;

use application\core\AppController;
use application\util\FilterUtils;
use application\util\i18next;
use application\util\SystemConstant;
use application\util\SecurityUtil;
use application\service\MajorService;
use application\model\Yearbook;
use application\service\YearbookService;
use application\controller\UtilController;
use application\util\UploadUtil;


class YearbookController extends  AppController
{
    /**
     * @var YearbookService
     */
    private $yearbookService;
    private $majorService;
    private $util;

    public function __construct($databaseConnection)
    {
        $this->setDbConn($databaseConnection);
        $this->yearbookService = new YearbookService($this->getDbConn());
        $this->majorService = new MajorService($this->getDbConn());
        $this->util = new UtilController($this->getDbConn());
    }
    public function __destruct()
    {
        $this->setDbConn(null);
        unset($this->yearbookService);
    }
    public function crudList()
    {
        $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) > 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
        $this->setRowPerPage($perPage);
        $q_parameter = $this->initSearchParam(new Yearbook());

        $this->pushDataToView = $this->getDefaultResponse();
        $data = $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->yearbookService->findAll($this->getRowPerPage(), $q_parameter);
        $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->yearbookService->getTotalPaging();
        // $this->pushDataToView["image"] = $data->image;
        //     // 'image' => $imagName,
        //     // 'picture' => UploadUtil::getProfilePicApi($imagName, $user->created_at)

        jsonResponse($this->pushDataToView);
    }
    public function crudAdd()
    {
        $uid = SecurityUtil::getAppuserIdFromJwtPayload();
        $jsonData = $this->getJsonData(false);
        $this->pushDataToView = $this->getDefaultResponse(false);
        $majorclassInDb = $this->yearbookService->findBymajorclass($jsonData->major, $jsonData->class);

        if(!empty($jsonData) && !empty($uid)) {

                    // jsonResponse($majorclassInDb);
                if (!empty($majorclassInDb)) {
                    jsonResponse([
                        'error'=>i18next::getTranslation('error.duplicateMajorClass',['data'=>$jsonData->major." ".$jsonData->class])
                    ]);
                }



           $entity = new Yearbook($jsonData, $uid, false);
               $lastInsertId = $this->yearbookService->createByObject($entity);
               if ($lastInsertId) {
                    $this->pushDataToView = $this->setResponseStatus([SystemConstant::ENTITY_ATT => $this->yearbookService->findById($lastInsertId)], true, i18next::getTranslation(('success.insert_succesfull')));
                }

        }
        jsonResponse($this->pushDataToView); 
        // jsonResponse($this->$majorclassInDb);
    }
    public function crudReadSingle()
    {
        $id = FilterUtils::filterGetInt(SystemConstant::ID_PARAM);
        $this->pushDataToView = $this->getDefaultResponse(false);
        $item = null;
        if ($id > 0) {
            $item = $this->yearbookService->findById($id);
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
        $old = $this->yearbookService->findById($jsonData->id);

        if (!empty($jsonData) && !empty($uid)) {
            if ($old->class != $jsonData->class) {
                $majorclassInDb = $this->yearbookService->findBymajorclass($jsonData->major, $jsonData->class);
                if (!empty($majorclassInDb) && $jsonData->class == $majorclassInDb->class && $jsonData->major == $majorclassInDb->major) {
                    jsonResponse([
                        'error' => i18next::getTranslation('error.duplicateMajorClass', ['data' => $jsonData->major . " " . $jsonData->class])
                    ]);
                }
            }
            // jsonResponse($majorclassInDb->class.$jsonData->class);
            $yearbook = new Yearbook($jsonData, $uid, true);
            if (isset($yearbook->id)) {
                $tabel = "yearbook";
                $this->util->dellImg($yearbook->id, $tabel, $yearbook->image);
                $effectRow = $this->yearbookService->updateByObject($yearbook, array('id' => $yearbook->id));


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
        $idParams = FilterUtils::filterGetString(SystemConstant::ID_PARAMS); //paramiter format : idOfNo1_idOfNo2_idOfNo3_idOfNo4 ...
        $idArray = explode(SystemConstant::UNDER_SCORE, $idParams);
        if (count($idArray) > 0) {
            foreach ($idArray as $id) {
                $entity = $this->yearbookService->findById($id);
                if ($entity) {
                    $effectRow = $this->yearbookService->deleteById($id);
                    if (!$effectRow) {
                        $this->pushDataToView = $this->setResponseStatus($this->pushDataToView, false, i18next::getTranslation('error.error_something_wrong'));
                        break;
                    }
                }
            }
        }
        jsonResponse($this->pushDataToView);
    }
    public function ListByYear()
    {
        $year = FilterUtils::filterGetInt(SystemConstant::YEAR_PARAM);
        $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) > 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
        $this->setRowPerPage($perPage);
        $q_parameter = $this->initSearchParam(new Yearbook());

        $this->pushDataToView = $this->getDefaultResponse();
        // $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->yearbookService->findByYear($year,$this->getRowPerPage(),$q_parameter);
        $bymajor = $this->pushDataToView['dataList'] = $this->majorService->findAll($this->getRowPerPage(), $q_parameter);
        // $this->yearbookService->findBymajor( $this->pushDataToView['dataList']->name);
        $classle = array();
        foreach ($bymajor as $item) {
            $item->classle = $this->yearbookService->findBymajor($year, $item->id);
            if(!$item->classle){$item->classle = "null";}


            array_push($classle, $item);
        }
        $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->yearbookService->getTotalPaging();
        jsonResponse($this->pushDataToView);
        // jsonResponse($item);
    }
    public function Listyear()
    {
        $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->yearbookService->findYear();
        jsonResponse($this->pushDataToView);
    }
    // public function ListAll()
    // {
    //     $year = FilterUtils::filterGetInt(SystemConstant::YEAR_PARAM);
    //     $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) > 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
    //     $this->setRowPerPage($perPage);
    //     $q_parameter = $this->initSearchParam(new Yearbook());

    //     $this->pushDataToView = $this->getDefaultResponse();
    //     // $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->yearbookService->findByYear($year,$this->getRowPerPage(),$q_parameter);
    //     $bymajor = $this->pushDataToView['dataList'] = $this->majorService->findAll($this->getRowPerPage(), $q_parameter);
    //     // $this->yearbookService->findBymajor( $this->pushDataToView['dataList']->name);
    //     $classle = array();
    //     foreach ($bymajor as $item) {
    //         $item->classle = $this->yearbookService->findBymajor($year, $item->id);


    //         array_push($classle, $item);
    //     }
    //     $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->yearbookService->getTotalPaging();
    //     jsonResponse($this->pushDataToView);
    //     // jsonResponse($item);
    // }
}
