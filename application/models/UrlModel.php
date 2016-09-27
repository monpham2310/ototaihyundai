<?php
defined('BASEPATH') OR exit('');
class UrlModel extends CI_Model{
 
    public function __construct(){
        $this->load->database();
    }
    
    public function getURLS(){
 
        $query = $this->db->query('select CatMeta as Url from categories
                                   union
                                   select ArtMeta as Url from articles
                                   union
                                   select NavMeta as Url from navigates;');
        return $query->result_array();
    }
}
?>