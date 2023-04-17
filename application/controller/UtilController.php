<?php
/**
 * Created by PhpStorm.
 * User: Bekaku
 * Date: 29/12/2015
 * Time: 10:30 AM
 */

namespace application\controller;

use application\core\AppController;
use application\util\AppUtil;
use application\util\ControllerUtil;
use application\util\DateUtils;
use application\util\FilterUtils;
use application\util\UploadUtil;
use application\util\SecurityUtil;
use application\util\SystemConstant;
use application\service\UserService;
use application\controller\DirectoryController;
use application\service\CommentService ;
use application\service\YearbookService ;
use application\service\DirectoryService ;
use application\service\MajorService ;



class UtilController extends AppController
{
    private $userService;
    private $directoryController;
    private $commentService;
    private $yearbookService;
    private $majorService;
    private $directoryService;
    public function __construct($databaseConnection)
    {
        $this->setDbConn($databaseConnection);
        $this->commentService = new CommentService($this->getDbConn());
        $this->yearbookService = new yearbookService($this->getDbConn());
        $this->userService = new UserService($this->getDbConn());
        $this->directoryService = new DirectoryService($this->getDbConn());
        $this->majorService = new MajorService($this->getDbConn());
        // $this->directoryController = new DirectoryController($this->getDbConn());
    }
    public function __destruct()
    {
    }

    public function jsonGetServerDateAndTime()
    {
        jsonResponse(['currentDatetime' => DateUtils::getDateNow(true)]);
    }

    public function jsonGetUniqeToken()
    {
        jsonResponse(['uniqeTokenCookie' => ControllerUtil::getUniqeTokenCookie()]);
    }
    public function getSiteMetadata()
    {
        jsonResponse(AppUtil::getSiteMetaData(FilterUtils::filterGetString('uri')));
    }
    public function imageUpload()
    {
        $uid = SecurityUtil::getAppuserIdFromJwtPayload();
        $this->pushDataToView = $this->getDefaultResponse(false);
        if(isset($_FILES['filename']) && is_uploaded_file($_FILES['filename']['tmp_name'])){
            $newname = UploadUtil::getUploadFileName($uid); 
            $imagename = UploadUtil::uploadImgFiles($_FILES['filename'],null,0,$newname);
            // $this->pushDataToView = $this->setResponseStatus([], true, i18next::getTranslation(('success.success')));
        }
        // jsonResponse($this->pushDataToView.$imagename);
        jsonResponse($imagename);
    }
    public function dellImg($id,$tabel)
    {
        // jsonResponse($id.$tabel);

        if($tabel === "yearbook"){
            $img = $this->yearbookService->findById($id);
            UploadUtil::delImgfileFromYearMonthFolder($img->path_img, null);
        }
        if($tabel === "directory"){
            $img = $this->directoryService->findById($id);
            // jsonResponse($img->img);
            UploadUtil::delImgfileFromYearMonthFolder($img->img, null);
        }
        if($tabel === "user"){
            $img = $this->userService->findById($id);
            UploadUtil::delImgfileFromYearMonthFolder($img->image, null);
        }
        // jsonResponse()
    }
    
    public function search()
    {   
        $tb = $_GET['info'];
        $val = $_GET['val'];
        // $yearbook = FilterUtils::filterGetInt(SystemConstant::ID_PARAM);
        // $perPage = FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT)> 0 ? FilterUtils::filterGetInt(SystemConstant::PER_PAGE_ATT) : 0;
        // $this->setRowPerPage($perPage);
        // $q_parameter = $this->initSearchParam(new Directory());
        if($tb === "user"){
        $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->userService->findByUsername($val);
        }elseif($tb === "admin"){
        $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->userService->findByadmin($val);
        }

        // $this->pushDataToView = $this->getDefaultResponse();
        // $this->pushDataToView[SystemConstant::DATA_LIST_ATT] = $this->directoryService->findByIdYearbook($yearbook,$this->getRowPerPage(),$q_parameter);
        // $this->pushDataToView[SystemConstant::APP_PAGINATION_ATT] = $this->directoryService->getTotalPaging();
        jsonResponse($this->pushDataToView);
    }
}