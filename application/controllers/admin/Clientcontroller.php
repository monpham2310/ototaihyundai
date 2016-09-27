<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Clientcontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');
        $this->load->model('ClientModel');
    }
                    
    public function getClients(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $result = $this->ClientModel->getAllClients($type);                
        $json = json_encode($result);                            
        echo $json;
    }
    
    public function updateClient(){
        $request = $this->input->post('data');
                                       
        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ClientModel->updateClient($request);            
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
    
    public function addClient(){
        $request = $this->input->post('data');                                
                
        //$session = $this->session->has_userdata('remember_me');   
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ClientModel->addClient($request);            
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
    
    public function deleteClient(){
        $request = $this->input->post('data');
        $Id = $request['ID'];
        
        //$session = $this->session->has_userdata('remember_me');
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ClientModel->deleteClient($Id);
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