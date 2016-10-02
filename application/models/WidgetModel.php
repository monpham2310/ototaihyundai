<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Widgetmodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }
    
    public function getInformation($type){        
        if($type === 'admin'){
            $result = $this->db->query('select InformId,Name,Email,Phone,Facebook
                    from information
                    ;');  
        }
        else{
            $result = $this->db->query('select InformId,Name,Email,Phone,Facebook
                    from information
                    ;');  
        }
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
    
    public function getHeader(){
        $result = $this->db->query('select BannerId,Logo,Banner
                    from banner;');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
    
    public function getArtForCate($cateId){
        $query = $this->db->query('SELECT ArtID, ArtName, ArtMeta, Image, Price, Video                 
                                    FROM articles                               
                                    where CatId = '.$cateId.'
                                    order by DateCreated desc
                                    limit 12;');
        return ($query->num_rows() > 0)? $query->result_array() : array();
    }
    
    public function getAllWidgets($data){                
        if($data['type'] === 'admin'){
            $result = $this->db->query('select ID,Title,Describes,Area,Status,Position,CateID,Config,Content,Method,Type
                                    from widgets
                                    where Area = "'.$data['area'].'"
                                    order by Position;');    
            return ($result->num_rows() > 0)? $result->result_array() : array();
        }
        else{
            $result = $this->db->query('select ID,Title,Describes,Area,a.Status,Position,CateID,CatMeta,Config,Content,Method,Type
                                    from widgets a join categories b on a.CateID = b.CatID
                                    where a.Status = 1
                                    order by Position;');
            $result = $result->result_array();
            $count = count($result);
            if($count > 0){
                for($i = 0; $i < $count; $i++){
                    $result[$i]['artList'] = $this->getArtForCate($result[$i]['CateID']);
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