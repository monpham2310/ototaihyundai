<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Articlecontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');        
        $this->load->model('ArticleModel');
    }
         
    public function loadAllArticles(){
        $request = $this->input->post('data');
        $type = $request['type'];        
        $result = $this->ArticleModel->getAllArticles($type);        
        $json = json_encode($result);            
               
        echo $json;
    }
     
    public function loadArticles(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $dataType = $request['dataType'];
        $result = $this->ArticleModel->getArticles($type, $dataType);        
        $json = json_encode($result);             
               
        echo $json;
    }
    
    public function updateArticle(){
        $request = $this->input->post('data');

        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){            
            $result = $this->ArticleModel->updateArticle($request);
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
        $result = $this->ArticleModel->getNewArtOrPro(2);
        $json = json_encode($result);
        echo $json;
    }
    
    public function newArticle(){
        $result = $this->ArticleModel->getNewArtOrPro(1);
        $json = json_encode($result);
        echo $json;
    }
    
    public function addArticle(){
        $request = $this->input->post('data');                        

        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ArticleModel->addArticle($request);
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
            $result = $this->ArticleModel->deleteArticle($Id, $user);
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
        $result = $this->ArticleModel->editArticle($artId);
        $json = json_encode($result);
        echo $json;
    }
    
    public function viewArtOrPro(){
        $request = $this->input->post('data');
        $meta = $request['meta'];
        $result = $this->ArticleModel->getArtOrPro($meta);
        $json = json_encode($result);
        echo $json;
    }
            
    public function getFeaturedPro($type){
        $result = $this->ArticleModel->getFeaturedPro($type);
        $json = json_encode($result);
        echo $json;
    }
}

?>