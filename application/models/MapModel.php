<?php
defined('BASEPATH') OR exit('');

class Mapmodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }  
    
    public function getMapList(){
        $result = $this->db->query('select MapID,Address,Lattitude,Longitude,Phone
                                    from map');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
    
    public function updateMarker($data){        
        $this->db->where('MapID', $data['MapID']);
        $result = $this->db->update('map', $data);
        if($result !== null)
            return true;
        return false;
    }
    
    public function addNewMarker($data){              
        $result = $this->db->insert('map', $data);
        if($result !== null)
            return true;
        return false;
    }
    
    public function deleteMarker($id){        
        $this->db->where('MapID', $id);
        $result = $this->db->delete('map');
        if($result !== null)
            return true;
        return false;
    }
}
?>