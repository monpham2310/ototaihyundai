<?php
defined('BASEPATH') OR exit('');

class Clientmodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }    
    
    public function getAllClients($type){        
        if($type === 'admin'){             
            $result = $this->db->query('select ID,Name,Estimate,Image,Address,Phone
                                        from myclient;');                        
        }
        else{
            $result = $this->db->query('select ID,Name,Estimate,Image,Address,Phone
                                        from myclient
                                        ;');
        }
        if($result->num_rows() > 0)
            return $result->result_array();                            
        return array();
        
    }
    
    public function updateClient($data){              
        $this->db->where('ID', $data['ID']);        
        $result = $this->db->update('myclient', $data);    
        if($result !== null)
            return true;       
        return false;
    }
    
    public function addClient($data){        
        $result = $this->db->insert('myclient', $data);
        if($result !== null)
            return true;       
        return false;        
    }
    
    public function deleteClient($Id){
        $param = array(
            'ID' => $Id  
        );
        $result = $this->db->delete('myclient', $param);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
        
}

?>