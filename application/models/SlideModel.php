<?php
defined('BASEPATH') OR exit('');

class SlideModel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }    
    
    public function getAllSlides($type){        
        if($type === 'admin'){             
            $result = $this->db->query('select ID,a.Image,Describes,ProLink,ArtMeta,ArtName,CateLink,CatMeta,CatName,Title
                                        from slides a left join categories b on a.CateLink = b.CatID left join articles c on a.ProLink = c.ArtID
                                        order by ID desc;');
        }
        else{
            $result = $this->db->query('select ID,a.Image,Describes,ProLink,CateLink,Title,CatName,ArtName,CatMeta,ArtMeta
                                        from slides a left join categories b on a.CateLink = b.CatID left join articles c on a.ProLink = c.ArtID                       
                                        order by ID desc;');
        }
        if($result->num_rows() > 0)
            return $result->result_array();                            
        return array();
        
    }
    
    public function updateSlide($data){              
        $this->db->where('ID', $data['ID']);        
        $result = $this->db->update('slides', $data);    
        if($result !== null)
            return true;       
        return false;
    }
    
    public function addSlide($data){        
        $result = $this->db->insert('slides', $data);
        if($result !== null)
            return true;       
        return false;        
    }
    
    public function deleteSlide($Id){
        $param = array(
            'ID' => $Id  
        );
        $result = $this->db->delete('slides', $param);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
    
    public function changeSlidePosition($id, $pos){
        $param = array(
            'Position' => $pos
        );
        $this->db->where('ID', $id);
        $this->db->update('slides', $param);
    }
}

?>