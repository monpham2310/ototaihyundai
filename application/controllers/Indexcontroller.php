<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Indexcontroller extends CI_Controller {
	    
    public function __construct(){   
        parent::__construct();
        $this->load->helper('url');  
        $this->load->library('phpsession');
        $this->load->model('TemplateModel');
        $this->load->model('UrlModel');
    }
        
    public function index(){           
        $this->load->view('index'.'.html');
    }
               
    public function notfound(){
        $this->load->view('client/home.html');
//        $this->load->view('client/404.php');
    }
            
    public function loadView($view){                
        $this->load->view('client/'.$view.'.html');        
    }
            
    public function loadTemplate(){
        $meta = $this->input->get('meta');        
        $filename = $this->TemplateModel->getTemplateOfView($meta);              
        if($filename !== null){
            $view = 'client/'.$filename->Filename;
            if($view !== 'client/')
                $this->load->view($view.'.html'); 
            else{
//                    $this->load->view('client/404.php'); 
                $this->load->view('client/home.html'); 
            }
        }
        else{
            $filename = $this->TemplateModel->getTempOfView($meta);
            if($filename !== null){
                $view = 'client/'.$filename->Filename;
                if($view !== 'client/')
                    $this->load->view($view.'.html'); 
                else{
//                        $this->load->view('client/404.php'); 
                    $this->load->view('client/home.html'); 
                }
            }
            else{
                $filename = $this->TemplateModel->getTempOfViewExtend($meta);
                if($filename !== null){
                    $view = 'client/'.$filename->Filename;
                    if($view !== 'client/')
                        $this->load->view($view.'.html'); 
                    else{
//                        $this->load->view('client/404.php'); 
                        $this->load->view('client/home.html'); 
                    }
                }
                else{
                    //$this->load->view('client/404.php'); 
                    $this->load->view('client/home.html');
                }
            }
        }        
    }
    
    public function sitemap(){ 
        $data['urlsList'] = $this->UrlModel->getURLS();
        $this->load->view('sitemap_view.php',$data);
    }
    
    public function search(){
        $request = $this->input->post('data');
        $text = $request['search'];
        $result = $this->TemplateModel->search($text);
        $json = '';
        $json = json_encode($result);
        echo $json;
    }
                        
}

?>