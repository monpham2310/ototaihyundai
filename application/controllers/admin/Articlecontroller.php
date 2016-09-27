<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Articlecontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');        
        $this->load->model('Articlemodel');
    }
         
    public function loadAllArticles(){
        $request = $this->input->post('data');
        $type = $request['type'];        
        $result = $this->Articlemodel->getAllArticles($type);        
        $json = json_encode($result);            
               
        echo $json;
    }
     
    public function loadArticles(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $dataType = $request['dataType'];
        $result = $this->Articlemodel->getArticles($type, $dataType);        
        $json = json_encode($result);             
               
        echo $json;
    }
    
    public function updateArticle(){
        $request = $this->input->post('data');

        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){            
            $result = $this->Articlemodel->updateArticle($request);
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
    
    public function newProduct(){
        $result = $this->Articlemodel->getNewArtOrPro(2);
        $json = json_encode($result);
        echo $json;
    }
    
    public function newArticle(){
        $result = $this->Articlemodel->getNewArtOrPro(1);
        $json = json_encode($result);
        echo $json;
    }
    
    public function addArticle(){
        $request = $this->input->post('data');                        

        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Articlemodel->addArticle($request);
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
    
    public function deleteArticle(){
        $request = $this->input->post('data');
        $Id = $request['id'];
        $user = $request['user'];
        
        //$session = $this->session->has_userdata('remember_me');
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Articlemodel->deleteArticle($Id, $user);
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
       
    public function editArticle($artId){
        $result = $this->Articlemodel->editArticle($artId);
        $json = json_encode($result);
        echo $json;
    }
    
    public function viewArtOrPro(){
        $request = $this->input->post('data');
        $meta = $request['meta'];
        $result = $this->Articlemodel->getArtOrPro($meta);
        $json = json_encode($result);
        echo $json;
    }
            
    public function getFeaturedPro($type){
        $result = $this->Articlemodel->getFeaturedPro($type);
        $json = json_encode($result);
        echo $json;
    }
}

?>