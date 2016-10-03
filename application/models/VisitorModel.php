<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Visitormodel extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();
    }
            
    public function addNew($ip){
//        $param = array(
//            'IpAddress' => $ip
//        );
//        $store_procedure = 'call sp_addNew(?)';
//        $this->db->query($store_procedure, $param);
        $checkExists = $this->db->query('select Ip,TimeVisit from visitor where TimeVisit = curdate() and Ip = "'.$ip.'";');
        if($checkExists->num_rows() !== 0){
            $this->db->query('update visitor
                            set NumOfTime = NumOfTime + 1
                            where TimeVisit = curdate() and Ip = "'.$ip.'";');
        }
        else{
            $this->db->query('insert into visitor(Ip, TimeVisit) values ("'.$ip.'",curdate());');
        }        
    }
    
    public function getVisitorList(){
        $this->db->select('ID');
        $this->db->select('Ip');
        $this->db->select('TimeVisit');
        $this->db->select('NumOfTime');
        $this->db->from('visitor');
        $result = $this->db->get();
        if($result->num_rows() > 0){
            return $result->result_array();
        }
        else{
            return null;
        }
    }
    
    public function visitorStatistic(){
        //$store_procedure = 'call sp_visitorStatistic()';        
        //$result = $this->db->query($store_procedure);
        $result = $this->db->query('select sum(NumOfTime) as Number  
                                    from visitor 
                                    where TimeVisit = curdate() 
                                    union all         
                                    select sum(NumOfTime) as Number      
                                    from visitor
                                    where TimeVisit = date_sub(curdate(),interval 1 day)       
                                    union all     
                                    select sum(NumOfTime) as Number       
                                    from visitor
                                    where month(TimeVisit) = month(curdate())       
                                    union all    
                                    select sum(NumOfTime) as Number       
                                    from visitor
                                    where year(TimeVisit) = year(curdate())        
                                    union all   
                                    select sum(NumOfTime) as Number
                                    from visitor;');
        if($result->num_rows() > 0){
            return $result->result_array();
        }
        else{
            return array();
        }
    }
}

?>