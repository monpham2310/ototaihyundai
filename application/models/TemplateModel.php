<?php
defined('BASEPATH') OR exit('');

class Templatemodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();         
    }    
       
    public function getTemplates(){
        $result = $this->db->query('select TempID,TempName,Filename,Status,Type,Meta
                          from templates
                          order by TempID desc');
        if($result->num_rows() > 0)
            return $result->result_array();
        return array();
    }
    
    public function getPages($data){
        $result = $this->db->query('select TempID,TempName,Meta
                                    from templates
                                    where Type = "'.$data['type'].'"
                                    order by TempID desc;');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
    
    public function updateTemplate($data){   
        $param = array(
            'TempName' => $data['TempName'],
            'Filename' => $data['Filename'],
            'Status' => $data['Status'],
            'Type' => $data['Type'],
            'Meta' => $data['Meta'],            
        );
        $this->db->where('TempID', $data['TempID']);        
        $result = $this->db->update('templates', $param);    
        if($result !== null){
            return true;            
        }
        else{
            return false;
        }
    }
    
    public function addTemplate($data){        
        $result = $this->db->insert('templates', $data);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
    
    public function deleteTemplate($id){
        $param = array(
            'TempID' => $id  
        );
        $result = $this->db->delete('templates', $param);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
    
    public function getTemplateOfView($meta){
        $result = $this->db->query('select a.TempId,Filename 
                                    from categories a inner join templates b on a.TempId = b.TempID 
                                    where CatMeta = "'.$meta.'";');
        if($result->num_rows() > 0){
            $row = $result->result();            
            return $row[0];
        }
        else{
            return null;
        }
    }
    
    public function getTempOfView($meta){
        $result = $this->db->query('select a.TempId,Filename 
                                    from articles a inner join templates b on a.TempId = b.TempID 
                                    where ArtMeta = "'.$meta.'";');
        if($result->num_rows() > 0){
            $row = $result->result();            
            return $row[0];
        }
        else{
            return null;
        }
    }
    
    public function getTempOfViewExtend($meta){
        $result = $this->db->query('select a.TempId,Filename 
                                    from navigates a inner join templates b on a.TempId = b.TempID 
                                    where NavMeta = "'.$meta.'";');
        if($result->num_rows() > 0){
            $row = $result->result();            
            return $row[0];
        }
        else{
            return null;
        }
    }
    
    public function search($text){
        $currentLang = $this->phpsession->getCookie('monpham_language');
        $result = $this->db->query('select CatID as ID,CatName as Name,CatMeta as Alias,CatDescribes as Describes
                                    from categories
                                    where (CatName like "%'.$text.'%" or CatDescribes like "%'.$text.'%") and CatLang = "'.$currentLang.'" 
                                    union
                                    select ArtID as ID,ArtName as Name,ArtMeta as Alias,ArtDescribes as Describes
                                    from articles
                                    where (ArtName like "%'.$text.'%" or ArtDescribes like "%'.$text.'%" or Content like "%'.$text.'%" or Estimate like "%'.$text.'%") and ArtLang = "'.$currentLang.'";');
        if($result->num_rows() > 0){
            return $result->result_array();
        }
        else{
            return array();
        }
    }
    
}

?>