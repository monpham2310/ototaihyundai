<?php
defined('BASEPATH') OR exit('');

class MailContactModel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }    
    
    public function getMailList(){        
        $result = $this->db->query('select ID,Name,Email,Subject,Content,DateSent,Phone
                                    from mailcontact;');            
        if($result->num_rows() > 0)
            return $result->result_array();                            
        return array();
        
    }
            
    public function addMail($name, $email, $sub, $content, $date, $phone){
        $param = array(            
            'Name' => $name,
            'Email' => $email,            
            'Subject' => $sub,                        
            'Content' => $content,
            'DateSent' => $date,
            'Phone' => $phone
        );  
        $result = $this->db->insert('mailcontact', $param);
        if($result !== null)
            return true;       
        return false;        
    }
    
    public function deleteMail($Id){
        $param = array(
            'ID' => $Id  
        );
        $result = $this->db->delete('mailcontact', $param);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
        
}

?>