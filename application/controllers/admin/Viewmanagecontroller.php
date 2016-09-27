<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Viewmanagecontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->library('phpsession');
    }
    
    public function index(){
        $check_session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($check_session !== null)
            $this->load->view('admin/index.html');                
        else
            $this->load->view('admin/login.html'); 
    }
    
    public function loadView($view){
        $this->load->view('admin/'.$view.'.html');    
    }
    
}

?>