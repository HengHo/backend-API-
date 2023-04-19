<?php

/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/

namespace application\service;

use application\core\BaseDatabaseSupport;
use application\serviceInterface\DirectoryServiceInterface;
use application\model\Directory;
use application\util\UploadUtil;

class DirectoryService extends BaseDatabaseSupport implements DirectoryServiceInterface
{
    protected $tableName = 'directory';

    public function __construct($dbConn)
    {
        $this->setDbh($dbConn);
    }
    public function   findAll($perpage = 0, $q_parameter = array())
    {
        //if have param
        $data_bind_where = null;

        $query = "SELECT *  ";

        $query .= "FROM directory AS directory ";

        //default where query
        $query .= " WHERE directory.`id` IS NOT NULL ";
        //custom where query
        //$query .= "WHERE directory.custom_field =:customParam ";

        //gen additional query and sort order
        $additionalParam = $this->genAdditionalParamAndWhereForListPageV2($q_parameter, new Directory());
        if (!empty($additionalParam)) {
            if (!empty($additionalParam['additional_query'])) {
                $query .= $additionalParam['additional_query'];
            }
            if (!empty($additionalParam['where_bind'])) {
                $data_bind_where = $additionalParam['where_bind'];
            }
        }

        //custom where paramiter
        // $data_bind_where['custom_field']=$paramValue;
        //end
        //paging buider
        if ($perpage > 0) {
            $query .= $this->pagingHelper($query, $perpage, $data_bind_where);
        }
        //regular query
        $this->query($query);

        //START BIND VALUE FOR REGULAR QUERY
        //$this->bind(":q_name", "%".$q_parameter['q_name']."%");//bind param for 'LIKE'
        //$this->bind(":q_name", $q_parameter['q_name']);//bind param for '='
        //END BIND VALUE FOR REGULAR QUERY

        //bind param for search param
        $this->genBindParamAndWhereForListPage($data_bind_where);

        return  $this->list();
    }

    public function findIdByStatus($status, $perpage = 0, $q_parameter = array())
    {
        //if have param
        $data_bind_where = null;

        $query = "SELECT id,created_by,yearbook_id  ";

        $query .= "FROM directory AS directory ";

        //default where query
        $query .= " WHERE directory.status=:status AND directory.`id` IS NOT NULL ";
        //custom where query
        //$query .= "WHERE directory.custom_field =:customParam ";

        //gen additional query and sort order
        $additionalParam = $this->genAdditionalParamAndWhereForListPageV2($q_parameter, new Directory());
        if (!empty($additionalParam)) {
            if (!empty($additionalParam['additional_query'])) {
                $query .= $additionalParam['additional_query'];
            }
            if (!empty($additionalParam['where_bind'])) {
                $data_bind_where = $additionalParam['where_bind'];
            }
        }

        //custom where paramiter
        // $data_bind_where['custom_field']=$paramValue;
        //end
        //paging buider
        if ($perpage > 0) {
            $query .= $this->pagingHelper($query, $perpage, $data_bind_where);
        }
        //regular query
        $this->query($query);
        $this->bind(":status", $status);
        //START BIND VALUE FOR REGULAR QUERY
        //$this->bind(":q_name", "%".$q_parameter['q_name']."%");//bind param for 'LIKE'
        //$this->bind(":q_name", $q_parameter['q_name']);//bind param for '='
        //END BIND VALUE FOR REGULAR QUERY

        //bind param for search param
        $this->genBindParamAndWhereForListPage($data_bind_where);

        return  $this->list();
    }

    public function findById($id)
    {
        $query = "SELECT *  ";

        $query .= "FROM directory AS directory ";
        $query .= "WHERE directory.`id`=:id ";

        $this->query($query);
        $this->bind(":id", (int)$id);
        // return  $this->single();
        $data = $this->single();
        $data->picture = UploadUtil::getImageApi($data->img, null);
        return $data;
    }
    public function findByIduser($id)
    {
        $query = "SELECT *  ";

        $query .= "FROM directory AS directory ";
        $query .= "WHERE directory.`created_by`=:id ";

        $this->query($query);
        $this->bind(":id", (int)$id);
        return  $this->single();
        // $data = $this->single();
        // $data->picture = UploadUtil::getImageApi($data->img,null);
        // return $data;

    }

    public function findByIdYearbook($id)
    {
        $query = "SELECT *  ";

        $query .= "FROM directory AS directory ";
        $query .= "WHERE directory.`yearbook_id`=:id ";

        $this->query($query);
        $this->bind(":id", (int)$id);

        $data = $this->list();
        $list = [];
        if ($data) {
            foreach ($data as $item) {
                $item->picture = UploadUtil::getImageApi($item->img, null);
                // $item->img = $item->path_img;
                // unset($item->image);
                array_push($list, $item);
            }
        }

        return $list;
    }

    public function deleteById($id)
    {
        $query = "DELETE FROM " . $this->tableName . " WHERE id=:id";
        $this->query($query);
        $this->bind(":id", (int)$id);
        return $this->execute();
    }
    public function createByArray($data_array)
    {
        return $this->insertHelper($this->tableName, $data_array);
    }
    public function createByObject($oject)
    {
        return $this->insertObjectHelper($oject);
    }
    public function update($data_array, $where_array, $whereType = 'AND')
    {
        return $this->updateHelper($this->tableName, $data_array, $where_array, $whereType);
    }
    public function updateByObject($object, $where_array, $whereType = 'AND')
    {
        return $this->updateObjectHelper($object, $where_array, $whereType);
    }
}
