<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Userkeycontroller extends CI_Controller {
    public function __construct(){   
        parent::__construct();
        $this->load->helper('url');          
        $this->load->model('Userkeymodel');        
    }
    
    public function checkRegisterKey($request){
        //$request = $this->intput->post('data');
        $isValid = false;
        //$result = false;
        if($request['Version'] === 'V1'){            
            $isValid = $this->checkKey($request['ActiveKey']);
        }
        else if($request['Version'] === 'V2'){
            $isValid = $this->checkKeyV2($request['ActiveKey']);
        }
        else{
            $isValid = $this->checkKeyV3($request['ActiveKey']);
        }
//        if($isValid)
//            $result = $this->Userkeymodel->RegisterActiveKey($request);
//        echo json_encode($result);
        return $isValid;
    }
    
    public function checkActiveOfUser(){        
        $data = $this->input->post('data');
        $keyDefault = '';
        if($data['Version'] === 'V1'){
            $keyDefault = 'ED3-67A-EO2';
        }
        else if($data['Version'] === 'V2'){
            $keyDefault = 'AD5-BT8-OZ2';
        }
        else{
            $keyDefault = 'AT5-ZT8-OK3';
        }
        $dataOfUser = $this->Userkeymodel->CheckActiveKeyOfUser($data);        
        if($dataOfUser === null){
            $dataOfUser = array(
                'PhoneNumber' => $data['PhoneNumber'],
                'ActiveKey' => $keyDefault,
                'Version' => $data['Version']
            );
            $result = $this->Userkeymodel->RegisterActiveKey($dataOfUser);
        }
        else{
            $result = $this->checkRegisterKey($dataOfUser);            
        }
        echo json_encode($result);
    }
    
    function checkKey($request){
		$keyDefault = 'ED3-67A-EO2';
		//$request = $this->input->get('key');
		if($request === $keyDefault)
			return true;
		else
			return false;
    }
	
	function checkKeyV2($request){
		$keyDefault = 'AD5-BT8-OZ2';
		//$request = $this->input->get('key');
		if($request === $keyDefault)
			return true;
		else
			return false;
    }
	
	function checkKeyV3($request){
		$keyDefault = 'AT5-ZT8-OK3';
		//$request = $this->input->get('key');
		if($request === $keyDefault)
			return true;
		else
			return false;
    }
}
?>