<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class ResourceTypeModel extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->library('phpsession');
    }
    
    public function getResourceType(){
        $result = $this->db->query('select TypeID,TypeName,Status
                                    from resourcetype
                                    where Status = 1;');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
}
?>