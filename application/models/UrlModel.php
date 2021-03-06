<?php
defined('BASEPATH') OR exit('');
class Urlmodel extends CI_Model{
 
    public function __construct(){
        $this->load->database();
    }
    
    public function getURLS(){
 
        $query = $this->db->query('select CatMeta as Url from categories
                                   union
                                   select ArtMeta as Url from articles
                                   union
                                   select NavMeta as Url from navigates
                                   union
                                   select Meta as Url from templates;');
        return $query->result_array();
    }
}
?>