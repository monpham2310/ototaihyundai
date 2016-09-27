<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Slidecontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');
        $this->load->model('Slidemodel');
    }
                    
    public function getSlides(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $result = $this->Slidemodel->getAllSlides($type);                
        $json = json_encode($result);                            
        echo $json;
    }
    
    public function updateSlide(){
        $request = $this->input->post('data');
        $data = array(
            'ID' => $request['ID'],
            'Image' => $request['Image'],
            'Describes' => isset($request['Describes'])? $request['Describes'] : '',
            'ProLink' => $request['ProLink'],
            'CateLink' => $request['CateLink'],
            'Title' => isset($request['Title'])? $request['Title'] : ''
        );
                                       
        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Slidemodel->updateSlide($data);            
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
    
    public function addSlide(){
        $request = $this->input->post('data'); 
        $data = array(            
            'Image' => $request['Image'],
            'Describes' => isset($request['Describes'])? $request['Describes'] : '',
            'ProLink' => $request['ProLink'],
            'CateLink' => $request['CateLink'],
            'Title' => isset($request['Title'])? $request['Title'] : ''
        );
            
        //$session = $this->session->has_userdata('remember_me');   
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Slidemodel->addSlide($data);            
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
    
    public function deleteSlide(){
        $request = $this->input->post('data');
        $Id = $request['ID'];
        
        //$session = $this->session->has_userdata('remember_me');
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Slidemodel->deleteSlide($Id);
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
    
    public function changeSlidePosition(){
        $request = $this->input->post('data');        
        for($i = 0; $i < count($request); $i++){
            $this->Slidemodel->changeSlidePosition($request[$i]['id'], $request[$i]['pos']);
        }        
    }
    
}

?>