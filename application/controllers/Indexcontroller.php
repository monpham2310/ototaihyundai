<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Indexcontroller extends CI_Controller {
	    
    public function __construct(){   
        parent::__construct();
        $this->load->helper('url');          
        $this->load->model('Templatemodel');
        $this->load->model('Urlmodel');
    }
        
    public function index(){   
        $this->output->cache(240); //240 minutes
        $this->load->view('index'.'.html');
    }
               
    public function notfound(){
        $this->output->cache(240); //240 minutes        
        $this->load->view('client/404.html');
    }
            
    public function loadView($view){ 
        $this->output->cache(240); //240 minutes
        $this->load->view('client/'.$view.'.html');        
    }
            
    public function loadTemplate(){        
        $meta = $this->input->get('meta');        
        $filename = $this->Templatemodel->getTemplateOfView($meta);        
        
        if($filename !== null){
            $view = 'client/'.$filename->Filename;
            if($view !== 'client/'){                
                $this->load->view($view.'.html'); 
            }
            else{                
                $this->load->view('client/404.html');                 
            }
        }
        else{
            $filename = $this->Templatemodel->getTempOfView($meta);            

            if($filename !== null){
                $view = 'client/'.$filename->Filename;
                if($view !== 'client/'){                    
                    $this->load->view($view.'.html'); 
                }
                else{                    
                    $this->load->view('client/404.html');                      
                }
            }
            else{
                $filename = $this->Templatemodel->getTempOfViewExtend($meta);
                if($filename !== null){
                    $view = 'client/'.$filename->Filename;
                    if($view !== 'client/'){
                        $this->load->view($view.'.html'); 
                    }
                    else{
                        $this->load->view('client/404.html');  
                    }
                }
                else{
                    $this->load->view('client/404.html'); 
                }
            }
        }      
        
    }
    
    public function sitemap(){ 
        $this->output->cache(240); //240 minutes
        $data['urlsList'] = $this->Urlmodel->getURLS();
        $this->load->view('sitemap_view.php',$data);
    }
    
    public function robots(){ 
        $this->output->cache(240); //240 minutes
        $this->load->view('robots.txt');
    }
    
    /* Test search xem có trả ra kết quả đã gửi lên không */
    public function search(){        
        $request = $this->input->post('data');
        $text = $request['search'];
        $result = $this->Templatemodel->search($text);
        $json = '';
        $json = json_encode($result);
        echo $json;
    }
    
    public function checkKey(){
		$keyDefault = 'ED3-67A-EO2';
		$request = $this->input->get('key');
		if($request === $keyDefault)
			echo $request;
		else
			echo 'invalid';
    }
	
	public function checkKeyV2(){
		$keyDefault = 'AD5-BT8-OZ2';
		$request = $this->input->get('key');
		if($request === $keyDefault)
			echo $request;
		else
			echo 'invalid';
    }
	
	public function checkKeyV3(){
		$keyDefault = 'AT5-ZT8-OK3';
		$request = $this->input->get('key');
		if($request === $keyDefault)
			echo $request;
		else
			echo 'invalid';
    }
}

?>