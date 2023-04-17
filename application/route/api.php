<?php

/**
 * Created by PhpStorm.
 * User: Bekaku
 * Date: 24/12/2015
 * Time: 3:21 PM
 */

use application\core\Route as Route;
use application\model\Role;

/*
 * param => middleware, url,Controller name, action in controller, permission if require
 */
/*
|--------------------------------------------------------------------------------------------------------------------หน้านี้เป็นเพียงหน้าที่กำหนดค่า url แต่การทำงานจริงคือ นำค่าในนี้ส่งไปที่ core\Route ตามmethod ต่างๆ
| IndexController
|--------------------------------------------------------------------------
*/

Route::get([], "index", "IndexController", "index");
/*
|--------------------------------------------------------------------------
| AppTableController
|--------------------------------------------------------------------------
*/
Route::get([], "generateStarter", "AppTableController", "crudAdd");
Route::get([], "generateStarter", "AppTableController", "crudAdd");
Route::post([], "generateStarter", "AppTableController", "crudAddProcess");
Route::post([], "generateStarterApi", "AppTableController", "addApi");
/*
|--------------------------------------------------------------------------
| PermissionController
|--------------------------------------------------------------------------
*/
Route::get(['AuthApi', 'PermissionGrant'], "permission", "PermissionController", "crudList", "permission_list");
Route::get(['AuthApi'], "findAllPermissionByPaging", "PermissionController", "findAllByPaging");

Route::post(['AuthApi', 'PermissionGrant'], "permission", "PermissionController", "crudAdd", "permission_add");
Route::get(['AuthApi', 'PermissionGrant'], "permissionReadSingle", "PermissionController", "crudReadSingle", "permission_view");
Route::put(['AuthApi', 'PermissionGrant'], "permission", "PermissionController", "crudEdit", "permission_edit");
Route::delete(['AuthApi', 'PermissionGrant'], "permission", "PermissionController", "crudDelete", "permission_delete");
Route::get([], "permissionsCrudtbl", "PermissionController", "permissionsCrudtbl");
/*
|--------------------------------------------------------------------------
| RoleController
|--------------------------------------------------------------------------
*/
Route::get(['AuthApi', 'PermissionGrant'], "role", "RoleController", "crudList", "role_list");
Route::post(['AuthApi', 'PermissionGrant'], "role", "RoleController", "crudAdd", "role_add");
Route::get(['AuthApi', 'PermissionGrant'], "roleReadSingle", "RoleController", "crudReadSingle", "role_view");
Route::put(['AuthApi', 'PermissionGrant'], "role", "RoleController", "crudEdit", "role_edit");
Route::delete(['AuthApi', 'PermissionGrant'], "role", "RoleController", "crudDelete", "role_delete");
/*
|--------------------------------------------------------------------------
| ApiClientController
|--------------------------------------------------------------------------
*/
Route::get(['AuthApi', 'PermissionGrant'], "apiClient", "ApiClientController", "crudList", "api_client_list");
Route::post(['AuthApi', 'PermissionGrant'], "apiClient", "ApiClientController", "crudAdd", "api_client_add");
Route::get(['AuthApi', 'PermissionGrant'], "apiClientReadSingle", "ApiClientController", "crudReadSingle", "api_client_view");
Route::put(['AuthApi', 'PermissionGrant'], "apiClient", "ApiClientController", "crudEdit", "api_client_edit");
Route::put(['AuthApi', 'PermissionGrant'], "apiClientRefreshToken", "ApiClientController", "refreshToken", "api_client_edit");
Route::delete(['AuthApi', 'PermissionGrant'], "apiClient", "ApiClientController", "crudDelete", "api_client_delete");
/*
|--------------------------------------------------------------------------
| ApiClientIpController
|--------------------------------------------------------------------------
*/
Route::get(['AuthApi', 'PermissionGrant'], "apiClientIp", "ApiClientIpController", "crudList", "api_client_ip_list");
Route::post(['AuthApi', 'PermissionGrant'], "apiClientIp", "ApiClientIpController", "crudAdd", "api_client_ip_add");
Route::get(['AuthApi', 'PermissionGrant'], "apiClientIpReadSingle", "ApiClientIpController", "crudReadSingle", "api_client_ip_view");
Route::put(['AuthApi', 'PermissionGrant'], "apiClientIp", "ApiClientIpController", "crudEdit", "api_client_ip_edit");
Route::delete(['AuthApi', 'PermissionGrant'], "apiClientIp", "ApiClientIpController", "crudDelete", "api_client_ip_delete");
/*
|---------------------------------------------- ----------------------------
| UserController
|--------------------------------------------------------------------------
*/
Route::get(['AuthApi', 'PermissionGrant'], "user", "UserController", "crudList", "user_list");
Route::get(['AuthApi', 'PermissionGrant'], "admin", "UserController", "crudList", "crudListadmin");
Route::post(['AuthApi', 'PermissionGrant'], "userSignUp", "UserController", "crudAdd", "user_add");
Route::get(['AuthApi', 'PermissionGrant'], "userReadSingle", "UserController", "crudReadSingle", "user_view");
Route::put(['AuthApi', 'PermissionGrant'], "user", "UserController", "crudEdit", "user_edit");
Route::put(['AuthApi', 'PermissionGrant'], "resetUserPassword", "UserController", "resetPassword", "user_edit");
Route::delete(['AuthApi', 'PermissionGrant'], "user", "UserController", "crudDelete", "user_delete");
Route::put(['AuthApi'], "userBlock", "UserController", "blockUser");
Route::post(['AuthApi'], "changeAvatar", "UserController", "changeAvatar");
/*
|--------------------------------------------------------------------------
| AuthController
|--------------------------------------------------------------------------
*/
Route::post([], "signin", "AuthController", "signin");
Route::post(['AuthApi'], "userLogout", "AuthController", "userLogout");
Route::get(['AuthApi'], "userCheckAuth", "AuthController", "userCheckAuth");
Route::post(['AuthApi'], "userChangePwd", "AuthController", "changePwd");
Route::post(['AuthApi'], "userCheckAuth", "AuthController", "userCheckAuth");


//Application

/*
|--------------------------------------------------------------------------
| UtilController
|--------------------------------------------------------------------------
*/
Route::get([], "jsonGetServerDateAndTime", "UtilController", "jsonGetServerDateAndTime");
Route::get([], "jsongetuniqetoken", "UtilController", "jsonGetUniqeToken");
Route::get([], "getSiteMetadata", "UtilController", "getSiteMetadata");

/* TestContronller*/
Route::get([], "test", "TestController", "index");
Route::get(['AuthApi'], "test-uri", "TestController", "index");
Route::post(['AuthApi'], "test", "TestController", "index");
// -----------------------------------------------------------------------------------------
// yearbook
//------------------------------------------------------------------------------------------
Route::get(['AuthApi'], 'yearbook', 'YearbookController', 'crudList', null);
Route::get(['AuthApi'], 'yearbookYear', 'YearbookController', 'ListYear', null);
Route::get(['AuthApi'], 'yearbookByYear', 'YearbookController', 'ListByYear', null);
Route::post(['AuthApi'], 'yearbook', 'YearbookController', 'crudAdd', null);
Route::get(['AuthApi'], 'yearbookReadSingle', 'YearbookController', 'crudReadSingle', null);
Route::put(['AuthApi'], 'yearbook', 'YearbookController', 'crudEdit', null);
Route::delete(['AuthApi'], 'yearbook', 'YearbookController', 'crudDelete', null);
/*
|--------------------------------------------------------------------------
| directory
|--------------------------------------------------------------------------
*/
Route::get(['AuthApi'], 'directoryListYearbook', 'DirectoryController', 'ListYearbook', null);
Route::get(['AuthApi'], 'directory', 'DirectoryController', 'crudList', null);
Route::post(['AuthApi'], 'directory', 'DirectoryController', 'crudAdd', null);
Route::get(['AuthApi'], 'directoryReadSingle', 'DirectoryController', 'crudReadSingle', null);
Route::put(['AuthApi'], 'directory', 'DirectoryController', 'crudEdit', null);
Route::put(['AuthApi'], 'directoryConfirm', 'DirectoryController', 'directoryConfirm', null);
Route::delete(['AuthApi'], 'directory', 'DirectoryController', 'crudDelete', null);

Route::get(['AuthApi'], 'directoryNotify', 'DirectoryController', 'notify', null);
/*
|--------------------------------------------------------------------------
| comment
|--------------------------------------------------------------------------
*/
Route::get(['AuthApi'], 'commentlistbydirectory', 'CommentController', 'listbydirectory', null);
Route::get(['AuthApi'], 'comment', 'CommentController', 'crudList', null);
Route::post(['AuthApi'], 'comment', 'CommentController', 'crudAdd', null);
Route::get(['AuthApi'], 'commentReadSingle', 'CommentController', 'crudReadSingle', null);
Route::put(['AuthApi'], 'comment', 'CommentController', 'crudEdit', null);
Route::delete(['AuthApi'], 'comment', 'CommentController', 'crudDelete', null);
/*
|--------------------------------------------------------------------------
| major
|--------------------------------------------------------------------------
*/
Route::get(['AuthApi'], 'major', 'MajorController', 'crudList', null);
Route::post(['AuthApi'], 'major', 'MajorController', 'crudAdd', null);
Route::get(['AuthApi'], 'majorReadSingle', 'MajorController', 'crudReadSingle', null);
Route::put(['AuthApi'], 'major', 'MajorController', 'crudEdit', null);
Route::delete(['AuthApi'], 'major', 'MajorController', 'crudDelete', null);

//test
Route::post(['AuthApi'], 'img', 'UtilController', 'imageUpload', null);
Route::get(['AuthApi'], 'search', 'UtilController', 'search', null);

 