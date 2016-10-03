<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Widgetmodel extends CI_Model {
        
    public function __construct(){
        parent::__construct();
        $this->load->database();    
        $this->load->model('Articlemodel');
        $this->load->model('Categorymodel');
        $this->load->model('Visitormodel');
        $this->load->model('Mapmodel');
    }
    
//    public function getInformation($type){        
//        if($type === 'admin'){
//            $result = $this->db->query('select InformId,Name,Email,Phone,Facebook
//                    from information
//                    ;');  
//        }
//        else{
//            $result = $this->db->query('select InformId,Name,Email,Phone,Facebook
//                    from information
//                    ;');  
//        }
//        return ($result->num_rows() > 0)? $result->result_array() : array();
//    }
    
    public function getHeader(){
        $result = $this->db->query('select BannerId,Logo,Banner
                    from banner;');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
            
    function showNestableCate($query, &$refVar, $parent = 0, $child = false){
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
                $refVar .= '<ul class="product-categories">';
            else
                $refVar .= '<ul class="children">';
            foreach ($menu_tmp as $item) 
            {                
                $refVar .= '<li>
                        <a href="'.$item['CatMeta'].'"><img src="'.$item['CatImg'].'" title="'.$item['CatName'].'" alt="'.$item['CatName'].'" width="50" height="50"><span class="cat-name">'.$item['CatName'].'</span></a>';                
                // Gọi lại đệ quy
                // Truyền vào danh sách menu chưa lặp và parent của menu hiện tại
                $this->showNestableCate($query, $refVar, $item['CatID'], true);
                $refVar .= '</li>';
            }
            $refVar .= '</ul>';
        }        
    }
    
    function getNestableCate($place, $type){
        $result = $this->Categorymodel->getAllCategories($place, $type);        
        $sidebarCategory = '';
        $this->showNestableCate($result, $sidebarCategory);
        return $sidebarCategory;
    }
        
    public function getAllWidgets($data){ 
        $this->sidebarCategory = '';
        if($data['type'] === 'admin'){
            $result = $this->db->query('select ID,Title,Describes,Area,Status,Position,CateID,Config,Content,Method,Type
                                    from widgets
                                    where Area = "'.$data['area'].'"
                                    order by Position;');    
            return ($result->num_rows() > 0)? $result->result_array() : array();
        }
        else{
            $result = $this->db->query('select ID,Title,Describes,Area,a.Status,Position,CateID,CatMeta,Config,Content,Method,a.Type
                                    from widgets a left join categories b on a.CateID = b.CatID
                                    where a.Status = 1 and Area <> "noArea"
                                    order by Position;');
            $result = $result->result_array();
            $count = count($result);
            if($count > 0){
                for($i = 0; $i < $count; $i++){
                    if($result[$i]['Type'] === 1)
                        $result[$i]['data'] = $this->Articlemodel->getArtForCate($result[$i]['CateID'], $result[$i]['Config']);
                    else{
                        if($result[$i]['Method'] === 'wd_productCategories'){                            
                            $result[$i]['data'] = $this->getNestableCate($data['type'], 2);
                        }
                        if($result[$i]['Method'] === 'wd_articleCategories'){
                            $result[$i]['data'] = $this->getNestableCate($data['type'], 1);
                        }
                        if($result[$i]['Method'] === 'wd_allProduct'){
                            $result[$i]['data'] = $this->Articlemodel->getAllArtOrPro(2);
                        }
                        if($result[$i]['Method'] === 'wd_allArticle'){
                            $result[$i]['data'] = $this->Articlemodel->getAllArtOrPro(1);
                        }
                        if($result[$i]['Method'] === 'wd_featureArt'){
                            $result[$i]['data'] = $this->Articlemodel->getFeatureArtOrPro(1, $result[$i]['Config']);
                        }
                        if($result[$i]['Method'] === 'wd_featurePro'){
                            $result[$i]['data'] = $this->Articlemodel->getFeatureArtOrPro(2, $result[$i]['Config']);
                        }
                        if($result[$i]['Method'] === 'wd_newProduct'){
                            $result[$i]['data'] = $this->Articlemodel->getNewArtOrPro(2, $result[$i]['Config']);
                        }
                        if($result[$i]['Method'] === 'wd_newArticle'){
                            $result[$i]['data'] = $this->Articlemodel->getNewArtOrPro(1, $result[$i]['Config']);
                        }
                        if($result[$i]['Method'] === 'wd_markerList'){
                            $result[$i]['data'] = $this->Mapmodel->getMapList();
                        }
                        if($result[$i]['Method'] === 'wd_visitorStatistic'){
                            $result[$i]['data'] = $this->Visitormodel->visitorStatistic();
                        }
                    }
                }
            }            
            return $result;
        }        
    }
    
    public function updateHeader($data){
        $result = false;
        $check_row = $this->db->query('select BannerId from banner;');
        if($check_row->num_rows() >= 1){
            $this->db->where('BannerId', $data['BannerId']);
            $result = $this->db->update('banner', $data);
        }
        else{  
            $id = isset($data['BannerId'])? $data['BannerId'] : 1;
            $temp = array(
                'BannerId' => $id,
                'Logo' => $data['Logo'],
                'Banner' => $data['Banner']
            );
            $result = $this->db->insert('banner', $temp);
        }
        return $result;
    }
    
    public function updateInformation($data){
        $this->db->where('InformId', $data['InformId']);
        $result = $this->db->update('information', $data);
        return ($result !== null)? true : false;
    }
    
    public function updateWidget($param){
        $this->db->where('ID', $param['ID']);
        $result = $this->db->update('widgets', $param);
        return ($result !== null)? true : false;
    }
    
    public function addWidget($param){        
        $result = $this->db->insert('widgets', $param);
        return ($result !== null)? true : false;
    }
    
    public function delWidget($id){        
        $this->db->where('ID', $id);
        $result = $this->db->delete('widgets');
        return ($result !== null)? true : false;
    }
    
    public function updatePosition($param, $pos){
        $arg = array(
            'Area' => $param['area'],
            'Position' => $pos
        );        
        
        $this->db->where('ID', $param['id']);
        $this->db->update('widgets', $arg);
        
        $widget = $this->db->query('select Title,Status,Describes,CateID,Config,Content,Method,Type
                                        from widgets
                                        where ID = '.$param['id'].';');
        $widget = $widget->result();
        $type = $widget[0]->Type;
        $method = $widget[0]->Method;
        if($type === 0 || $method !== null){                                    
            $widgetExisted = $this->db->query('select ID from widgets 
                                                where Method = "'.$widget[0]->Method.'" and Area = "noArea";');
            if($widgetExisted->num_rows() === 0){                
                $data = array(
                    'Title' => $widget[0]->Title,
                    'Area' => 'noArea',
                    'Status' => $widget[0]->Status,
                    'Describes' => $widget[0]->Describes,
                    'Position' => $pos,
                    'CateID' => $widget[0]->CateID,
                    'Config' => $widget[0]->Config,
                    'Content' => $widget[0]->Content,
                    'Method' => $widget[0]->Method,
                    'Type' => $widget[0]->Type
                );
                $this->db->insert('widgets', $data);
            }
            else if($widgetExisted->num_rows() > 1){
                $this->db->where('ID', $param['id']);
                $this->db->delete('widgets');
            }
        }
    }
}
?>