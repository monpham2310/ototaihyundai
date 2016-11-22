<?php
defined('BASEPATH') OR exit('');

class Usermodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();
    }
    
    public function RegisterActiveKey($data){        
        $result = $this->db->insert('userkey', $data);
        return ($result !== null)? true : false;
    }
    
    public function CheckActiveKeyOfUser($data){
        $dataOfUser = null;
        $this->db->select('ActiveKey');
        $this->db->select('PhoneNumber');
        $this->db->select('Version');
        $this->db->from('userkey');
        $this->db->where('PhoneNumber', $data['PhoneNumber']);
        $this->db->where('ActiveKey', $data['ActiveKey']);
        $result = $this->db->get();
        if($result->num_rows() > 0){
            $dataOfUser = $result->result();
            $dataOfUser = $dataOfUser[0];
        }
        return $dataOfUser;
    }
}
?>