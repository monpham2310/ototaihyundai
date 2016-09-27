<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Resourcecontroller extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->library('phpsession');
        $this->load->model('ResourceModel');
        $this->load->model('ResourceCateModel');
        $this->load->model('ResourceTypeModel');
    }
    
    public function getResourceCate(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $resType = $request['resourceType'];
        $result = $this->ResourceCateModel->getResourceCate($type, $resType);
        $json = json_encode($result);
        echo $json;
    }
    
    public function getResourceType(){
        $result = $this->ResourceTypeModel->getResourceType();
        $json = json_encode($result);
        echo $json;
    }
    
    public function getResources(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $resCate = isset($request['resourceCate'])? $request['resourceCate'] : 0;
        $result = $this->ResourceModel->getResources($type, $resCate);         
        $json = json_encode($result);
        echo $json;
    }
    
    public function addResource(){
        $request = $this->input->post('data');   
        $data = array(            
            'ResName' => $request['ResName'],
            'ResCate' => $request['ResCate'],
            'CateLink' => $request['CateLink'],
            'ProLink' => $request['ProLink'],
            'Image' => isset($request['Image'])? $request['Image'] : '',
            'Frame' => isset($request['Image'])? $request['Frame'] : '',
            'File' => isset($request['Image'])? $request['File'] : '',
            'Describes' => isset($request['Image'])? $request['Describes'] : '',
        );
        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ResourceModel->addResource($data);
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
    
    public function updateResource(){
        $request = $this->input->post('data');
        $data = array(
            'ResID' => $request['ResID'],
            'ResName' => $request['ResName'],
            'ResCate' => $request['ResCate'],
            'CateLink' => $request['CateLink'],
            'ProLink' => $request['ProLink'],
            'Image' => isset($request['Image'])? $request['Image'] : '',
            'Frame' => isset($request['Image'])? $request['Frame'] : '',
            'File' => isset($request['Image'])? $request['File'] : '',
            'Describes' => isset($request['Image'])? $request['Describes'] : '',
        );
        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ResourceModel->updateResource($data);
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
    
    public function delResource(){
        $request = $this->input->post('data');
        $resId = $request['ResID'];
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ResourceModel->delResource($resId);
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
    
    public function addResourceCat(){
        $request = $this->input->post('data');
                
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ResourceCateModel->addResourceCat($request);
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
    
    public function updateResourceCat(){
        $request = $this->input->post('data');
                
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ResourceCateModel->updateResourceCat($request);
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
    
    public function delResourceCat(){
        $request = $this->input->post('data');
        $Id = $request['ID'];
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->ResourceCateModel->delResourceCat($Id);
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
        
}
?>