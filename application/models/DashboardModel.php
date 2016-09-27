<?php
defined('BASEPATH') OR exit('');

class DashboardModel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();
    }        
        
    public function dashboardStatistic($user){
        //$store_proc = 'call sp_dashboardStatistic()';        
        $result = $this->db->query('select count(ID) as Number     
                                    from mailcontact
                                    union all
                                    select count(ArtID) as Number
                                    from articles
                                    where Type = 1 and Author = '.$user.'
                                    union all
                                    select sum(NumOfTime) as Number       
                                    from visitor
                                    union all
                                    select count(ArtID) as Number
                                    from articles
                                    where Type = 2 and Author = '.$user.';');
        if($result->num_rows() > 0){
            return $result->result_array();
        }
        else{
            return null;
        }  
    }
}

?>