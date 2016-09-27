<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Widgetcontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');        
        $this->load->model('Widgetmodel');
    }
    
    public function getAllWidgets(){
        $request = $this->input->post('data');
        $result = $this->Widgetmodel->getAllWidgets($request);
        echo json_encode($result);
    }
    
    public function getInformation(){
        $request = $this->input->post('data');        
        $type = $request['type'];
        $result = $this->Widgetmodel->getInformation($type);
        echo json_encode($result);        
    }
    
    public function getHeader(){
        $result = $this->Widgetmodel->getHeader();
        echo json_encode($result);        
    }
    
    public function updateHeader(){
        $request = $this->input->post('data');
        $session = $this->phpsession->get(null, 'ototaihyundai_user');        
        if($session !== null){
            $result = $this->Widgetmodel->updateHeader($request);
            echo json_encode($result);
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            echo json_encode($not_login);            
        }
    }
    
    public function updateInform(){
        $request = $this->input->post('data');
        $session = $this->phpsession->get(null, 'ototaihyundai_user');        
        if($session !== null){
            $result = $this->Widgetmodel->updateInformation($request);
            echo json_encode($result);
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            echo json_encode($not_login);            
        }
    }
    
    public function sortableWidget(){
        $request = $this->input->post('data'); 
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            for($i = 0; $i < count($request); $i++){
                $this->Widgetmodel->updatePosition($request[$i], $i + 1);
            }
            echo json_encode(true);
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            echo json_encode($not_login);
        }
    }
    
    public function updateWidget(){
        $request = $this->input->post('data');                
        $session = $this->phpsession->get(null, 'ototaihyundai_user');        
        if($session !== null){                      
            $result = $this->Widgetmodel->updateWidget($request);
            echo json_encode($result);
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            $json = json_encode($not_login);
            echo $json;
        }
    }
    
    public function addWidget(){
        $request = $this->input->post('data');                
        $session = $this->phpsession->get(null, 'ototaihyundai_user');        
        if($session !== null){                      
            $result = $this->Widgetmodel->addWidget($request);
            echo json_encode($result);
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            $json = json_encode($not_login);
            echo $json;
        }
    }
    
    public function delWidget(){
        $request = $this->input->post('data');  
        $id = $request['ID'];
        $session = $this->phpsession->get(null, 'ototaihyundai_user');        
        if($session !== null){                      
            $result = $this->Widgetmodel->delWidget($id);
            echo json_encode($result);
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