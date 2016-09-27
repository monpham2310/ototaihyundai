<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mailcontactcontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');
        $this->load->model('MailContactModel');
    }
                    
    public function getMailList(){
        $request = $this->input->post('data');        
        $result = $this->MailContactModel->getMailList();                
        $json = json_encode($result);                            
        echo $json;
    }
            
    public function addMail(){
        $request = $this->input->post('data');                                
        $name = $request['Name'];
        $email = $request['Email'];
        $sub = $request['Subject'];
        $content = $request['Content'];
        $date = $request['DateSent'];
        $phone = $request['Phone'];                
        $result = $this->MailContactModel->addMail($name, $email, $sub, $content, $date, $phone);            
        $json = json_encode($result);
        echo $json;            
    }
    
    public function deleteMail(){
        $request = $this->input->post('data');
        $Id = $request['ID'];
        $result = $this->MailContactModel->deleteMail($Id);
        $json = json_encode($result);
        echo $json;                    
    }
    
}

?>