<?php
defined('BASEPATH') OR exit('');

class Categorymodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }    
        
    public function getAllCategories($type, $dataType){
        $result = array();        
        switch ($type){
            case 'admin':
                $result = $this->db->query('select CatID,CatName,CatMeta,CatDescribes,TempId,(select CatName from categories where CatID = a.CatParent) as ParentName,Type,CatParent,CatImg
                from categories a                                               
                order by CatID desc;');                                
                break;
            default:
                $result = $this->db->query('select CatID,CatName,CatMeta,CatDescribes,TempId,Type,CatParent,CatImg
                                            from categories
                                            where Type = '.$dataType.'
                                            order by CatID desc;');
                break;
        }
        if($result->num_rows() > 0){
            return $result->result_array();            
        }
        else{
            return array();
        }
    }
    
    public function getCategories($type, $dataType){
        $result = array();        
        switch ($type){
            case 'admin':                
                $result = $this->db->query('select CatID,CatName,CatMeta,CatDescribes,TempId,(select CatName from categories where CatID = a.CatParent) as ParentName,Type,CatParent,CatImg
                from categories a   
                where Type = '.$dataType.'
                order by CatID desc;');                        
                break;
            default:
                $result = $this->db->query('select CatID,CatName,CatMeta,CatDescribes,TempId,Type,CatParent,CatImg
                                            from categories                                            
                                            order by CatID desc;');
                break;
        }
        if($result->num_rows() > 0){
            return $result->result_array();            
        }
        else{
            return array();
        }
    }
    
    public function updateCategory($data){
        $query = $this->db->query('select CatMeta from categories where CatID = "'.$data['CatID'].'";');
        $row = $query->result();
        $oldMeta = $row[0]->CatMeta;
        $this->db->where('CatID', $data['CatID']);
        $result = $this->db->update('categories', $data);
        $this->db->query('update navigates
                          set NavMeta = "'.$data['CatMeta'].'"
                          where NavMeta = "'.$oldMeta.'";');
        if($result !== null){
            return true;            
        }
        else{
            return false;
        }
    }
    
    public function addCategory($data){
        $result = $this->db->insert('categories', $data);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
    
    public function deleteCategory($cateId){
        $param = array(
            'CatID' => $cateId  
        );
        $result = $this->db->delete('categories', $param);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
      
    public function getSiteMap($meta){                
        $result = $this->db->query('select CatID,CatName,CatDescribes,CatMeta,(select CatName 
                                            from categories 
                                            where CatID = (select CatParent from categories where CatMeta = "'.$meta.'")) as ParentName,(select CatMeta 
                                            from categories 
                                            where CatID = (select CatParent from categories where CatMeta = "'.$meta.'")) as ParentMeta
                                            ,CatImg
                                    from categories 
                                    where CatMeta = "'.$meta.'";');
        $category = $result->result_array();
        $listCate = $this->db->query('select ArtID,ArtName,ArtDescribes,ArtMeta,Image,DateCreated,a.CatId,CatName,Author,Username,PhoneContact as Phone,ViewCount,Price,Discount,Manufacture,Video
            from articles a left join categories b on a.CatId = b.CatID join users c on a.Author = c.UserID
            where a.CatId = '.$category[0]['CatID'].' and a.Status = 1;');
        $category[0]['CateList'] = $listCate->result_array();
        return ($result->num_rows() > 0)? $category : array();
    }
                
}

?>