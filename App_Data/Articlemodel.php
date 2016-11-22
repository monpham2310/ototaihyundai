<?php
defined('BASEPATH') OR exit('');

class Articlemodel extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();        
    }    
    
    public function getAllArticles($type){                        
        if($type === 'admin'){            
            $result = $this->db->query('SELECT ArtID, ArtName, ArtDescribes, ArtMeta, Image, DateCreated, articles.CatId, CatName, Author, UserName,  ViewCount, Content, articles.Status, articles.TempId,Price,Discount,articles.Type,Manufacture,Estimate,PhoneContact,Video,articles.Facebook,articles.Google,articles.Youtube,articles.Twitter
            FROM articles        
            LEFT JOIN categories ON articles.CatId = categories.CatID
            JOIN users ON articles.Author = users.UserID                   
            order by DateCreated desc;');                         
        }
        else{
            $result = $this->db->query('SELECT ArtID, ArtName, ArtDescribes, ArtMeta, Image, DateCreated, articles.CatId, CatName, Author, UserName,  ViewCount, Content, articles.Status, articles.TempId,Price,Discount,articles.Type,Manufacture,Estimate,PhoneContact,Video,articles.Facebook,articles.Google,articles.Youtube,articles.Twitter
                FROM articles        
                LEFT JOIN categories ON articles.CatId = categories.CatID
                JOIN users ON articles.Author = users.UserID 
                where articles.Status = 1
                order by DateCreated desc;');
        }
                
        if($result->num_rows() > 0){
            return $result->result_array();            
        }
        else{
            return array();
        }
    }
    
    public function getArticles($type, $dataType){
        if($type === 'admin'){            
            $result = $this->db->query('SELECT ArtID, ArtName, ArtDescribes, ArtMeta, Image, DateCreated, articles.CatId, CatName, Author, UserName,  ViewCount, Content, articles.Status, articles.TempId,Price,Discount,articles.Type,Manufacture,Estimate,PhoneContact,Video,articles.Facebook,articles.Google,articles.Youtube,articles.Twitter
            FROM articles        
            LEFT JOIN categories ON articles.CatId = categories.CatID
            JOIN users ON articles.Author = users.UserID   
            where articles.Type = '.$dataType.'
            order by DateCreated desc;');            
        }
        else{
            $result = $this->db->query('SELECT ArtID, ArtName, ArtDescribes, ArtMeta, Image, DateCreated, articles.CatId, CatName, Author, UserName,  ViewCount, Content, articles.Status, articles.TempId,Price,Discount,articles.Type,Manufacture,Estimate,PhoneContact,Video,articles.Facebook,articles.Google,articles.Youtube,articles.Twitter
                FROM articles        
                LEFT JOIN categories ON articles.CatId = categories.CatID
                JOIN users ON articles.Author = users.UserID 
                where articles.Type = '.$dataType.' and articles.Status = 1
                order by DateCreated desc;');
        }
                
        if($result->num_rows() > 0){
            return $result->result_array();            
        }
        else{
            return array();
        }
    }
    
    public function getArtForCate($cateId, $limit){        
        $result = $this->db->query('SELECT ArtID, ArtName, ArtMeta, Image, Price, Video                 
                                    FROM articles                               
                                    where CatId = '.$cateId.'
                                    order by DateCreated desc
                                    limit '.$limit.';');
        if($result->num_rows() > 0){
            return $result->result_array();            
        }
        else{
            return array();
        }
    }
    
    public function getNewArtOrPro($type, $limit){        
        $result = $this->db->query('SELECT ArtID,ArtName,ArtMeta,ArtDescribes,Image,Video
                FROM articles                               
                where Type = '.$type.' and Status = 1
                order by DateCreated desc
                limit '.$limit.';');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
        
    public function updateArticle($data){
        $query = $this->db->query('select ArtMeta from articles where ArtID = "'.$data['ArtID'].'";');
        $row = $query->result();
        $oldMeta = $row[0]->ArtMeta;
        $this->db->where('ArtID', $data['ArtID']);
        $result = $this->db->update('articles', $data);  
        $this->db->query('update navigates
                          set NavMeta = "'.$data['ArtMeta'].'"
                          where NavMeta = "'.$oldMeta.'";');
        if($result !== null){
            return true;            
        }
        else{
            return false;
        }
    }

    public function addArticle($data){     
        $result = $this->db->insert('articles', $data);
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
    
    public function deleteArticle($Id, $user){
        $param = array(
            'ArtID' => $Id  
        );
        $result = $this->db->delete('articles', $param);        
        if($result !== null){
            return true;
        }
        else{
            return false;
        }
    }
      
    private function getRelatedPost($catId, $artId){    
        $relatedPost = array();
        if(isset($catId)){
            $relatedPost = $this->db->query('select ArtID,ArtName,ArtDescribes,ArtMeta,Image,DateCreated,a.CatId,CatName,Author,Username,PhoneContact as Phone,ViewCount,Price,Discount,Manufacture,Video
                                        from articles a left join categories b on a.CatId = b.CatID join users c on a.Author = c.UserID
                                        where a.CatId = '.$catId.' and ArtID <> '.$artId.' and a.Status = 1
                                        order by DateCreated desc
                                        limit 4;');
        }
                
        return ($relatedPost->num_rows() > 0)? $relatedPost->result_array() : array();
    }
    
    public function getArtOrPro($meta){        
        $query = $this->db->query('select CatId from articles where ArtMeta = "'.$meta.'";');
        $row = $query->result();
        $catId = $row[0]->CatId;
        $result = $this->db->query('select ArtID,ArtName,ArtMeta,Content,a.CatId,CatName,CatMeta,DateCreated,Username,PhoneContact as Phone,ViewCount,ArtDescribes,Image,Price,Discount,Manufacture,Estimate,Video,(select CatName 
        from categories 
        where CatID = (select CatParent from categories where CatID = "'.$catId.'")) as ParentName,
        (select CatMeta 
            from categories 
            where CatID = (select CatParent from categories where CatMeta = "'.$meta.'")) as ParentMeta,a.Facebook,a.Google,a.Youtube,a.Twitter
          from articles a left join categories b on a.CatId=b.CatID join users c on a.Author = c.UserID
          where ArtMeta = "'.$meta.'" and a.Status = 1;');
        $articles = $result->result_array();
        //update visit counter
        $this->db->query('update articles
                          set ViewCount = ViewCount + 1
                          where ArtID ='.$articles[0]['ArtID'].';'); 
        //get related post
        $relatedPost = $this->getRelatedPost($catId, $articles[0]['ArtID']);
        $articles[0]['RelatedPost'] = $relatedPost;
        if($result->num_rows() > 0){
            return $articles;            
        }
        else{
            return array();
        }
    }
            
    public function isArticle($meta){
        $result = $this->db->query('select 1 from articles where ArtMeta="' .$meta. '";');
        if($result->num_rows() > 0)
            return true;
        return false;
    }
    
    public function editArticle($artId){
        $result = $this->db->query('select ArtID,ArtName,ArtDescribes,ArtMeta,Image,DateCreated,CatId,Author,UserName as Username,ViewCount,Content,a.Status,TempId,Price,Discount,Type,Manufacture,Estimate,Video,a.Facebook,a.Google,a.Youtube,a.Twitter
        from articles a join users b on a.Author = b.UserID
        where ArtID = '.$artId.';');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
            
    public function getFeatureArtOrPro($type, $limit){
        $result = $this->db->query('select ArtID,ArtName,ArtMeta,ArtDescribes,Image,Video
                                    from articles
                                    where Type = '.$type.' and Status = 1
                                    order by ViewCount desc
                                    limit '.$limit.';');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
    
    public function getAllArtOrPro($type){
        $result = $this->db->query('SELECT ArtID, ArtName, ArtMeta, Image, Price, Video                 
                                    FROM articles                               
                                    where Type = '.$type.'
                                    order by DateCreated desc;');
        return ($result->num_rows() > 0)? $result->result_array() : array();
    }
}

?>