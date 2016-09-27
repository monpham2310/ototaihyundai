<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Templatecontroller extends CI_Controller {
	    
    public function __construct(){   
        parent::__construct();
        $this->load->helper('url');  
        $this->load->library('phpsession');
        $this->load->model('TemplateModel');        
    }
        
    public function getAllTemplates(){                
        $result = $this->TemplateModel->getTemplates();        
        $json = json_encode($result);
        echo $json;
    }
    
    public function getPages(){
        $request = $this->input->post('data');
        $result = $this->TemplateModel->getPages($request);
        echo json_encode($result);
    }
    
    public function updateTemplate(){
        $request = $this->input->post('data');
                                 
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->TemplateModel->updateTemplate($request);            
            $json = json_encode($result);
            echo $json;    
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            $json = json_encode($not_login);
            echo $json;
        }                
    }
    
    public function addTemplate(){
        $request = $this->input->post('data');                
                        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->TemplateModel->addTemplate($request);            
            $json = json_encode($result);
            echo $json;    
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            $json = json_encode($not_login);
            echo $json;
        }
    }
    
    public function deleteTemplate(){
        $request = $this->input->post('data');
        $id = $request['ID'];
        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->TemplateModel->deleteTemplate($id);
            $json = json_encode($result);
            echo $json;
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            $json = json_encode($not_login);
            echo $json;
        }            
    }
                        
}

?>