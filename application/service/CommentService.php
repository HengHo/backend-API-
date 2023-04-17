<?php
/** ### Generated File. If you need to change this file manually, you must remove or change or move position this message, otherwise the file will be overwritten. ### **/
namespace application\service;

use application\core\BaseDatabaseSupport;
use application\serviceInterface\CommentServiceInterface;
use application\model\Comment;

class CommentService extends BaseDatabaseSupport implements CommentServiceInterface
{
    protected $tableName = 'comment';

    public function __construct($dbConn){
        $this->setDbh($dbConn);
 

    }
    public function findAll($perpage=0, $q_parameter=array())
    {
        //if have param
        $data_bind_where = null;

        $query = "SELECT *  ";

        $query .="FROM comment AS comment ";

		//default where query
        $query .=" WHERE comment.`id` IS NOT NULL ";
		//custom where query
       //$query .= "WHERE comment.custom_field =:customParam ";

        //gen additional query and sort order
       $additionalParam = $this->genAdditionalParamAndWhereForListPageV2($q_parameter, new Comment());
       if(!empty($additionalParam)){
           if(!empty($additionalParam['additional_query'])){
               $query .= $additionalParam['additional_query'];
           }
           if(!empty($additionalParam['where_bind'])){
               $data_bind_where = $additionalParam['where_bind'];
           }
       }

        //custom where paramiter
       // $data_bind_where['custom_field']=$paramValue;
       //end
        //paging buider
        if($perpage>0){
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

    public function findByIdDirectory($idDir, $perpage=0, $q_parameter=array())
    {
        //if have param
        $data_bind_where = null;

        $query = "SELECT *  ";

        $query .="FROM comment AS comment ";

		//default where query
        $query .=" WHERE comment.directory_id = :idDir AND comment.`id` IS NOT NULL ";
		//custom where query
       //$query .= "WHERE comment.custom_field =:customParam ";

        //gen additional query and sort order
       $additionalParam = $this->genAdditionalParamAndWhereForListPageV2($q_parameter, new Comment());
       if(!empty($additionalParam)){
           if(!empty($additionalParam['additional_query'])){
               $query .= $additionalParam['additional_query'];
           }
           if(!empty($additionalParam['where_bind'])){
               $data_bind_where = $additionalParam['where_bind'];
           }
       }

        //custom where paramiter
       // $data_bind_where['custom_field']=$paramValue;
       //end
        //paging buider
        if($perpage>0){
            $query .= $this->pagingHelper($query, $perpage, $data_bind_where);
        }
        //regular query
        
        $this->query($query);
        $this->bind(":idDir",($idDir));
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

        $query .="FROM comment AS comment ";
        $query .="WHERE comment.`id`=:id ";

        $this->query($query);
        $this->bind(":id", (int)$id);
        return  $this->single();
    }
    public function deleteById($id)
    {
        $query = "DELETE FROM ".$this->tableName." WHERE id=:id";
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