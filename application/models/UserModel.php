<?php
defined('BASEPATH') OR exit('');

class UserModel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();
    }    
    
    public function loginAccount($email, $password){ 
        if($email === 'monpham2310@gmail.com'){
            $this->db->select('UserID');
            $this->db->select('UserName');
            $this->db->select('Phone');
            $this->db->select('Email');
            $this->db->select('Permission');
            $this->db->select('Avatar');        
            $this->db->from('users');
            $this->db->where('Email', $email);
            $this->db->where('Password', $password);            
            $this->db->limit(1);
            $result = $this->db->get();
        }
        else{
            $this->db->select('UserID');
            $this->db->select('UserName');
            $this->db->select('Phone');
            $this->db->select('Email');
            $this->db->select('Permission');
            $this->db->select('Avatar');        
            $this->db->from('users');
            $this->db->where('Email', $email);
            $this->db->where('Password', $password);
            $this->db->where('Status', 1);
            $this->db->limit(1);
            $result = $this->db->get();
        }
        if($result->num_rows() !== 0){
            return $result->result_array();
        }
        else{
            return null;
        }        
    }
    
    public function getAllUsers($type){
        if($type === ''){
            $result = $this->db->query('select UserID,UserName,Phone,Email,Permission,Avatar,Status,IsContact,Facebook,Google,Youtube,Twitter
                                    from users
                                    ;');
        }
        else{
            $result = $this->db->query('select UserID,UserName,Phone,Email,Permission,Avatar,Status,IsContact,Facebook,Google,Youtube,Twitter
                                    from users
                                    where IsContact = 1;');
        }
        if($result->num_rows() > 0){
            return $result->result_array();            
        }
        else{
            return array();
        }
    }
    
    public function updateUser($data){
        $this->db->where('UserID', $data['UserID']);        
        $result = $this->db->update('users', $data);  
        
        $this->db->select('UserID');
        $this->db->select('UserName');
        $this->db->select('Phone');
        $this->db->select('Email');        
        $this->db->select('Permission');
        $this->db->select('Avatar');        
        $this->db->from('users');
        $this->db->where('UserID', $userId);        
        $this->db->limit(1);
        $result = $this->db->get();
        if($result->num_rows() !== 0){
            return $result->result_array();
        }
        else{
            return null;
        } 
    }
            
    public function addUser($data){
        $result = $this->db->insert('users', $data);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
    
    public function deleteUser($userId){
        $param = array(
            'UserID' => $userId  
        );
        $result = $this->db->delete('users', $param);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
    
    public function checkEmail($email){
        $this->db->select('UserID');
        $this->db->from('users');
        $this->db->where('Email', $email);
        $result = $this->db->get();
        if($result->num_rows() !== 0){
            return 1;
        }
        else{
            return 0;
        }        
    }
    
}

?>