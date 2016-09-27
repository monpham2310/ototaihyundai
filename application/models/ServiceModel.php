<?php
defined('BASEPATH') OR exit('');

class Servicemodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }    
    
    public function getAllServices($type){        
        if($type === 'admin'){             
            $result = $this->db->query('select ID,Name,Describes,Image
                                        from services
                                        order by ID desc;');                        
        }
        else{
            $result = $this->db->query('select ID,Name,Describes,Image
                                        from services
                                        order by ID desc;');
        }
        if($result->num_rows() > 0)
            return $result->result_array();                            
        return array();
        
    }
    
    public function updateService($data){              
        $this->db->where('ID', $data['ID']);        
        $result = $this->db->update('services', $data);    
        if($result !== null)
            return true;       
        return false;
    }
    
    public function addService($data){        
        $result = $this->db->insert('services', $data);
        if($result !== null)
            return true;       
        return false;        
    }
    
    public function deleteService($Id){
        $param = array(
            'ID' => $Id  
        );
        $result = $this->db->delete('services', $param);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
        
}

?>