<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Visitorcontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('VisitorModel');
    }
            
    public function addNew(){        
        $ip = '';
        $ip = $this->input->ip_address();                
        $this->VisitorModel->addNew($ip);
    }
    
    public function getVisitorList(){
        $result = $this->VisitorModel->getVisitorList();
        $json = '';
        if($result === null){
            $error = array(
                'message' => 'Lỗi khi lấy dữ liệu:getVisitorList'
            );
            $json = json_encode($error);            
        }
        else{
            $json = json_encode($result);
        }
        
        echo $json;
    }
    
    public function visitorStatistic(){
        $result = $this->VisitorModel->visitorStatistic();
        $json = '';
        if($result === null){
            $error = array(
                'message' => 'Lỗi khi lấy dữ liệu:visitorStatistic'
            );
            $json = json_encode($error);            
        }
        else{
            $json = json_encode($result);
        }
        
        echo $json;
    }
}

?>