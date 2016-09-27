<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usercontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');        
        $this->load->library('phpsession');
        $this->load->model('Usermodel');
    }
            
    public function actionLogin(){
        $request = $this->input->post('data');
        $email = $request['email'];
        $password = $request['password'];  
        $rememberMe = $request['isRemember'];
                           
        $result = $this->Usermodel->loginAccount($email, $password);   
                    
        if($result === null){
            $error = array(
                'message' => 'Email và mật khẩu không đúng!'
            );
            $json = json_encode($error);
            echo $json;
        }
        else{            
            $session_user = array(
                'IdUser' => $result[0]['UserID'],
                'Username' => $result[0]['UserName'],                
                'Phone' => $result[0]['Phone'],
                'Email' => $result[0]['Email'],                
                'Level' => $result[0]['Permission'],
                'Avatar' => $result[0]['Avatar'],                
                'Remember' => $rememberMe
            );                            
            $this->phpsession->save(null, $session_user, 'ototaihyundai_user');
            $success = array(
                'link' => base_url().'admin'
            );
            $json = json_encode($success);
            echo $json;               
        }
    }
    
    public function actionLogout(){        
        $this->phpsession->clear(null, 'ototaihyundai_user');
        echo 'Success!';
    }
    
    public function getCurrentUser(){                
        $session = $this->phpsession->get(null, 'ototaihyundai_user');        
        if($session !== null){
            $json = json_encode($session); 
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
    
    public function destroySession(){
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $isRemember = $session['Remember'];
            if($isRemember === 'false'){
                $this->phpsession->clear(null, 'ototaihyundai_user');
            }
        }
    }
    
    public function loadUsers(){
        $request = $this->input->post('data');
        $type = isset($request['type'])? $request['type'] : '';
        $result = $this->Usermodel->getAllUsers($type);
        $json = '';        
        $json = json_encode($result);            
                
        echo $json;
    }
    
    public function updateUser(){
        $request = $this->input->post('data');
              
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = array();
            $result = $this->Usermodel->updateUser($request);  
            
            $userCurr = $session['IdUser'];
            if($request['UserID'] === $userCurr){
                $remember = $session['Remember'];
                $session_user = array(
                    'IdUser' => $result[0]['UserID'],
                    'Username' => $result[0]['UserName'],
                    'Phone' => $result[0]['Phone'],
                    'Email' => $result[0]['Email'],                    
                    'Level' => $result[0]['Permission'],
                    'Avatar' => $result[0]['Avatar'],                    
                    'Remember' => $remember
                );               
                $this->phpsession->clear(null, 'ototaihyundai_user');
                $this->phpsession->save(null, $session_user, 'ototaihyundai_user');
            }            
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
    
    public function addUser(){
        $request = $this->input->post('data');                
            
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Usermodel->addUser($request);            
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
    
    public function deleteUser(){
        $request = $this->input->post('data');
        $userId = $request['userId'];
                
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Usermodel->deleteUser($userId);
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
    
    public function checkEmail(){
        $request = $this->input->post('data');
        $email = $request['email'];
        $json = '';
        $result = $this->Usermodel->checkEmail($email);
        $json = json_encode($result);
        echo $json;
    }
}

?>