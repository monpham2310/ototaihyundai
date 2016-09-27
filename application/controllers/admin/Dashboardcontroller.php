<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboardcontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('Dashboardmodel');        
    }
                    
    public function dashboardStatistic(){   
        $request = $this->input->post('data');
        $user = $request['UserId'];
        $result = $this->Dashboardmodel->dashboardStatistic($user);
        $json = '';
        if($result === null){
            $error = array(
                'message' => 'Lỗi khi lấy dữ liệu: getNumOfMem'
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