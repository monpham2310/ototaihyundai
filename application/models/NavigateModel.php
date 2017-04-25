<?php
defined('BASEPATH') OR exit('');

class Navigatemodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();         
    }    
            
    public function getNavigates($type){
        $result = array();        
        if($type === 'admin'){            
            $result = $this->db->query('select NavID,NavName,NavMeta,ParentId,Status,Position,Type
                                        from navigates
                                        order by Position;');                        
        }
        else{
            $result = $this->db->query('select NavID,NavName,NavMeta,ParentId,Status,Position,Type
                                            from navigates
                                            where Status = 1
                                            order by Position;');
        }
        if($result->num_rows() > 0)
            return $result->result_array();
        return array();
    }
    
    public function addNavigate($name, $meta, $type = 0){
        $query = $this->db->query('select max(NavID) as result from navigates where ParentId = 0;');
        $row = $query->result();
        $pos = $row[0];
        $param = array(            
            'NavName' => $name,
            'NavMeta' => $meta,            
            'Position' => (int)($pos->result) + 1,
            'Type' => $type            
        );
        $result = $this->db->insert('navigates', $param);        
        if($result !== null){
            return true;
        }        
        return false;        
    }
    
    public function updateNavigate($data){
        $this->db->where('NavID', $data['NavID']);
        $result = $this->db->update('navigates', $data);
        if($result !== null){
            return true;
        }
        return false;
    }
    
    public function deleteNavigate($id, $parent, $pos){
        //update lại parentid con khi xóa menu cha
        $param = array(
            'ParentId' => $parent,
            'Position' => $pos
        );
        $this->db->where('ParentId', $id);
        $this->db->update('navigates', $param);
        //xóa menu
        $this->db->where('NavID', $id);
        $result = $this->db->delete('navigates');
        if($result !== null)
            return true;
        return false;
    }
    
    public function updatePosition($id, $newPos, $parent){
        $param = array(
            'ParentId' => $parent,
            'Position' => $newPos
        );
        $this->db->where('NavID', $id);
        $this->db->update('navigates', $param);
    }
            
}

?>