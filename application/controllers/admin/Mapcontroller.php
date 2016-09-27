<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Mapcontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('Mapmodel');
        $this->load->library('phpsession');
    }
    
    public function getMapList(){
        $result = $this->Mapmodel->getMapList();
        $json = json_encode($result);
        echo $json;
    }
    
    public function updateMarker(){
        $request = $this->input->post('data');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Mapmodel->updateMarker($request);
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
    
    public function addNewMarker(){
        $request = $this->input->post('data');                
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Mapmodel->addNewMarker($request);
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
    
    public function deleteMarker(){
        $request = $this->input->post('data');
        $id = $request['MapID'];        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Mapmodel->deleteMarker($id);
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