<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Navigatecontroller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
        //$this->load->library('session');
        $this->load->library('phpsession');
        $this->load->model('Navigatemodel');
    }
    
    
    
    function showMenuNested($menus, $parent = 0){
        # BƯỚC 1: LỌC DANH SÁCH MENU VÀ CHỌN RA NHỮNG MENU CÓ PARENT = $parent
        // Biến lưu menu lặp ở bước đệ quy này
        $menu_tmp = array();

        foreach ($menus as $key => $item) {
            // Nếu có parent bằng với $parent hiện tại
            if ((int) $item['ParentId'] === (int) $parent) {
                $menu_tmp[] = $item;
                // Sau khi thêm vào biên lưu trữ menu ở bước lặp
                // thì unset nó ra khỏi danh sách menu ở các bước tiếp theo
                unset($menus[$key]);
            }
        }

        # BƯỚC 2: lẶP MENU THEO DANH SÁCH MENU Ở BƯỚC 1
        // Điều kiện dừng của đệ quy là cho tới khi menu không còn nữa
        if ($menu_tmp) 
        {         
            echo '<ol class="dd-list">';            
            foreach ($menu_tmp as $item) 
            {
                echo '<li class="dd-item" data-id="'.$item['NavID'].'">';
                echo '<button data-action="collapse" type="button">Collapse</button>
                      <button style="display: none;" data-action="expand" type="button">Expand</button>';
                echo '<span id="bt-'.$item['NavID'].'" class="right span-caret-menu" type="button" ng-click="event.slide('.$item['NavID'].')"><i class="fa fa-caret-down"></i></span>';
                echo '<div class="dd-handle">                        
                            '.$item['NavName'].'                                                                             
                      </div>                      
                        <form id="form-'.$item['NavID'].'" class="panel panel-default panel-body margin-bottom-0 none-display" role="form" ng-submit="event.update('.$item['NavID'].',selectedNav.NavName'.$item['NavID'].',selectedNav.Status'.$item['NavID'].', selectedNav.NavMeta'.$item['NavID'].')">  
                            <div class="form-group row">
                                <div class="col-sm-2">
                                <label>Tên<span class="text-danger">&nbsp;(*)</span></label>
                                </div>
                                <div class="col-sm-10">
                                    <input class="form-control" placeholder="Navigate name" type="text" ng-model="selectedNav.NavName'.$item['NavID'].'" ng-init="selectedNav.NavName'.$item['NavID'].' = '."'".$item['NavName']."'".'" required />
                                </div>
                            </div> 
                            <div class="form-group row" ng-if="'.$item['Type'].' !== 0">
                                <div class="col-sm-2">
                                    <label>Đường dẫn<span class="text-danger">&nbsp;(*)</span></label>
                                </div>
                                <div class="col-sm-10">
                                    <input class="form-control" placeholder="Navigate name" type="text" ng-model="selectedNav.NavMeta'.$item['NavID'].'" ng-init="selectedNav.NavMeta'.$item['NavID'].' = '."'".$item['NavMeta']."'".'" required />
                                </div>
                            </div>                                                        
                            <div class="form-group row">                                        
                                <div class="col-sm-2">
                                    <label>Status</label>
                                </div>
                                <div class="col-sm-10">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" ng-model="selectedNav.Status'.$item['NavID'].'" ng-init="selectedNav.Status'.$item['NavID'].'='.$item['Status'].'" ng-true-value="1" ng-false-value="0" />
                                        <label class="onoffswitch-label" for="myonoffswitch">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>                                            
                            </div>                                    
                            <div class="modal-footer no-border margin-bottom-0">
                                <button type="submit" class="btn btn-primary fa fa-save"></button>
                                <button type="button" class="btn btn-danger fa fa-trash" ng-click="event.delete('.$item['NavID'].','.$item['ParentId'].','.$item['Position'].')"></button>
                            </div>                                    
                        </form>';
                // Gọi lại đệ quy
                // Truyền vào danh sách menu chưa lặp và parent của menu hiện tại
                $this->showMenuNested($menus, $item['NavID']);
                echo '</li>';
            }
            echo '</ol>';
        }
    }
    
    function showMenuOnClient($menus, $parent = 0, $class = false){
        # BƯỚC 1: LỌC DANH SÁCH MENU VÀ CHỌN RA NHỮNG MENU CÓ PARENT = $parent
        // Biến lưu menu lặp ở bước đệ quy này
        $menu_tmp = array();

        foreach ($menus as $key => $item) {
            // Nếu có parent bằng với $parent hiện tại
            if ((int) $item['ParentId'] == (int) $parent) {
                $menu_tmp[] = $item;
                // Sau khi thêm vào biên lưu trữ menu ở bước lặp
                // thì unset nó ra khỏi danh sách menu ở các bước tiếp theo
                unset($menus[$key]);
            }
        }

        # BƯỚC 2: lẶP MENU THEO DANH SÁCH MENU Ở BƯỚC 1
        // Điều kiện dừng của đệ quy là cho tới khi menu không còn nữa
        if ($menu_tmp) 
        {      
            if(!$class)
                echo '<ul id="nav" class="menu">';
            else
                echo '<ul class="sub-menu">';
            foreach ($menu_tmp as $item) 
            {                
                echo '<li id="menu-item-'.$item['NavID'].'" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-383">';
                $url = explode("/",$item['NavMeta']);
                if($url[0] === 'http:' || $url[0] === 'https:')
                    echo '<a href="' . $item['NavMeta'] . '" aria-haspopup="true" aria-expanded="true" target="_blank">' . $item['NavName'] . '</a>';
                else
                    echo '<a href="' . $item['NavMeta'] . '" role="button" aria-haspopup="true" aria-expanded="false">' . $item['NavName'] . '</a>';
                // Gọi lại đệ quy
                // Truyền vào danh sách menu chưa lặp và parent của menu hiện tại
                $this->showMenuOnClient($menus, $item['NavID'], true);
                echo '</li>';
            }
            echo '</ul>';
        }
    }
        
    public function getNavigates(){
        $request = $this->input->post('data');
        $type = $request['type'];
        $query = $this->Navigatemodel->getNavigates($type);
        if($type === 'admin')
            echo $this->showMenuNested($query);
        else{
            echo $this->showMenuOnClient($query);
        }
    }
            
    public function addNavigatesList($type){
        $request = $this->input->post('data');        
        $json = json_encode('success');
        
        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            if($type === 'category'){
                for($i = 0; $i < count($request); $i++){
                    $this->Navigatemodel->addNavigate($request[$i]['CatName'], $request[$i]['CatMeta']);
                }
                echo $json;
            }
            else if($type === 'article'){
                for($i = 0; $i < count($request); $i++){
                    $this->Navigatemodel->addNavigate($request[$i]['ArtName'], $request[$i]['ArtMeta']);
                } 
                echo $json;
            }
            else{
                for($i = 0; $i < count($request); $i++){
                    $this->Navigatemodel->addNavigate($request[$i]['TempName'], $request[$i]['Meta']);
                } 
                echo $json;
            }
        }
        else{
            $not_login = array(
                'redirect' => base_url().'login'
            );
            $json = json_encode($not_login);
            echo $json;
        }
    } 
    
    public function addCustomNavigate(){        
        $request = $this->input->post('data');           
        $name = $request['NavName'];
        $meta = $request['NavMeta'];        
        $type = $request['Type'];
        
        //$session = $this->session->has_userdata('remember_me');        
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Navigatemodel->addNavigate($name, $meta, $type);
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
    
    public function updateNavigate(){
        $request = $this->input->post('data');
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Navigatemodel->updateNavigate($request);
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
    
    public function deleteNavigate(){
        $request = $this->input->post('data');
        $id = $request['NavID'];
        $parent = $request['ParentId'];
        $pos = $request['Position'];
        $session = $this->phpsession->get(null, 'ototaihyundai_user');
        if($session !== null){
            $result = $this->Navigatemodel->deleteNavigate($id, $parent, $pos);
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
    
    public function changePosition(){
        $request = $this->input->post('data');
        $this->saveNewPosition($request);
    }
    
    //'[{"id":1},{"id":2,"children":[{"id":3}]},{"id":4}]'
    
    function saveNewPosition($list, $parent = 0){        
        $list_tmp = array();
        for($i = 0; $i < count($list); $i++){            
            if (isset($list[$i]['children'])) {
                $this->Navigatemodel->updatePosition($list[$i]['id'], $i+1, $parent);
                $this->saveNewPosition($list[$i]['children'], $list[$i]['id']);
            }
            else{
                $this->Navigatemodel->updatePosition($list[$i]['id'], $i+1, $parent);
            }
        }        
    }
             
}

?>