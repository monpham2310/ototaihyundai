<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Resourcetypemodel extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }
    
    public function getResourceType(){
        $result = $this->db->query('select TypeID,TypeName,Status
                                    from resourcetype
                                    where Status = 1;');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
}
?>