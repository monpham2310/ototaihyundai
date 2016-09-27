<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Resourcemodel extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }
    
    public function getResources($type, $resCate){        
        if($type === 'admin'){            
            $result = $this->db->query('select ResID,ResName,ResCate,b.Name,CateLink,ProLink,Image,Frame,File,Describes
                                        from resources a join resourcecate b on a.ResCate=b.ID
                                        where ResCate = '.$resCate.'
                                        order by ResID desc;');                        
        }
        else{ 
            $result = $this->db->query('select ResID,ResName,ResCate,b.Name,CateLink,CatName,CatMeta,ProLink,ArtName,ArtMeta,a.Image,Frame,File,ResCate,a.Describes
                                            from resources a join resourcecate b on a.ResCate=b.ID left join categories c on a.CateLink = c.CatID left join articles d on a.ProLink = d.ArtID
                                            where b.Type = '.$resCate.'
                                            order by ResID desc;');
        }
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
            
    public function addResource($data){        
        $result = $this->db->insert('resources', $data);
        return ($result !== null)? true : false;
    }
    
    public function updateResource($data){        
        $this->db->where('ResID', $data['ResID']);
        $result = $this->db->update('resources', $data);
        return ($result !== null)? true : false;
    }
    
    public function delResource($resId){
        $this->db->where('ResID', $resId);
        $result = $this->db->delete('resources');
        return ($result !== null)? true : false;
    }
    
}
?>