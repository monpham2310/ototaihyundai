<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Categorycontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');
        $this->load->model('Categorymodel');        
    }
        
    public function loadAllCategories(){
        $request = $this->input->post('data');
        $type = $request['type'];        
        $result = $this->Categorymodel->getAllCategories($type, 0);                
        $json = json_encode($result);                    
        
        echo $json;
    }
            
    public function loadCategories(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $dataType = isset($request['dataType'])? $request['dataType'] : 0;
        $result = $this->Categorymodel->getCategories($type, $dataType);          
        $json = json_encode($result);                            
        echo $json;        
    }
    
    public function loadProCategories(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $dataType = isset($request['dataType'])? $request['dataType'] : 0;
        $result = $this->Categorymodel->getCategories($type, $dataType);          
        $json = json_encode($result);                            
        echo $json;
    }
    
    public function updateCategory(){
        $request = $this->input->post('data');
        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Categorymodel->updateCategory($request);
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
    
    public function addCategory(){
        $request = $this->input->post('data');                       
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session != null){
            $result = $this->Categorymodel->addCategory($request);    
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
    
    public function deleteCategory(){
        $request = $this->input->post('data');
        $cateId = $request['cateId'];
        
        //$session = $this->session->has_userdata('remember_me');
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Categorymodel->deleteCategory($cateId);
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
    
    function showNestableCate($query, $parent = 0, $child = false){
        $menu_tmp = array();

        foreach ($query as $key => $item) {
            // Nếu có parent bằng với $parent hiện tại
            if ((int) $item['CatParent'] == (int) $parent) {
                $menu_tmp[] = $item;
                // Sau khi thêm vào biên lưu trữ menu ở bước lặp
                // thì unset nó ra khỏi danh sách menu ở các bước tiếp theo
                unset($query[$key]);
            }
        }

        # BƯỚC 2: lẶP MENU THEO DANH SÁCH MENU Ở BƯỚC 1
        // Điều kiện dừng của đệ quy là cho tới khi menu không còn nữa
        if ($menu_tmp) 
        {      
            if(!$child)
                echo '<ul>';
            else
                echo '<ul class="child">';
            foreach ($menu_tmp as $item) 
            {
                echo '<li class="margin-bottom-left"><a href="'.$item['CatMeta'].'">'.$item['CatName'].'</a></li>';                
                // Gọi lại đệ quy
                // Truyền vào danh sách menu chưa lặp và parent của menu hiện tại
                $this->showNestableCate($query, $item['CatID'], true);
                echo '</li>';
            }
            echo '</ul>';
        }
    }
    
    public function getNestableCate($type){
        $result = $this->Categorymodel->getAllCategories('client', $type);
        echo $this->showNestableCate($result);
    }
    
    public function getCateOrProCate(){
        $request = $this->input->post('data');
        $meta = $request['meta'];
        $json = '';
        $result = $this->Categorymodel->getSiteMap($meta);
        $json = json_encode($result);
        echo $json;
    }
            
}

?>