<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Servicecontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');
        $this->load->model('ServiceModel');
    }
                    
    public function getServices(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $result = $this->ServiceModel->getAllServices($type);                
        $json = json_encode($result);                            
        echo $json;
    }
    
    public function updateService(){
        $request = $this->input->post('data');        
                               
        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ServiceModel->updateService($request);            
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
    
    public function addService(){
        $request = $this->input->post('data');                                
                
        //$session = $this->session->has_userdata('remember_me');   
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ServiceModel->addService($request);            
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
    
    public function deleteService(){
        $request = $this->input->post('data');
        $Id = $request['ID'];
        
        //$session = $this->session->has_userdata('remember_me');
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ServiceModel->deleteService($Id);
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