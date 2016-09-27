<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class ResourceCateModel extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }
    
    public function getResourceCate($type, $resType){                
        if($type === 'admin'){            
            $result = $this->db->query('select ID,Name,Type
                                        from resourcecate
                                        where Type = '.$resType.'
                                        order by ID desc;');                        
        }
        else{
            $result = $this->db->query('select ID,Name,Type
                                        from resourcecate
                                        where Type = '.$resType.'
                                        order by ID desc;');
        }
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
    
    public function addResourceCat($data){        
        $result = $this->db->insert('resourcecate', $data);
        return ($result !== null)? true : false;
    }
    
    public function updateResourceCat($data){        
        $this->db->where('ID', $data['ID']);
        $result = $this->db->update('resourcecate', $data);
        return ($result !== null)? true : false;
    }
    
    public function delResourceCat($id){
        $this->db->where('ID', $id);
        $result = $this->db->delete('resourcecate');
        return ($result !== null)? true : false;
    }
}
?>