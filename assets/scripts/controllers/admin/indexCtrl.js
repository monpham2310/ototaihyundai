angular.module('ototaihyundaiApp').controller('indexCtrl', function($scope, $rootScope, $window, $sce, baseService){    
    $rootScope.user = {};
    $rootScope.trustAsHtml = $sce.trustAsHtml;    
    $rootScope.usersList = [];
    $rootScope.templates = [];
    $rootScope.categories = [];
    $rootScope.navigates = '';
    $rootScope.currentPage = {
        parent: '',
        child: ''
    };
    $rootScope.widgets = {
        information: {},                
        header: {}
    };
    $rootScope.listWidgets = {
        noArea: [],
        body: [],
        sidebar: [],
        footer: []
    };
    $rootScope.marqueeImages = [];
    $rootScope.slideList = [];    
    $rootScope.mapList = [];
    $rootScope.customerList = [];
    $rootScope.serviceList = [];
    $rootScope.mailList = [];
    $rootScope.dashboard = [];
    $rootScope.dataType = 0;
    $rootScope.selectedMail = {};
    $rootScope.resourceCate = [];
    $rootScope.resourceType = [];
    $rootScope.resources = [];
    $rootScope.coordinate = {
        lat: 0,
        lng: 0
    };
    function init(){
        var controller = baseService.URL_HOST + baseService.module.user;
        baseService.GET(controller).then(function(response){
            if(response.redirect === undefined){
                $rootScope.user = response;  
                $rootScope.dashboardStatistic();
            }
            else{
                $window.location.url = response.redirect;
            }
        }, function(err){
            console.log(err);
        }); 
    }; 
    $rootScope.dashboardStatistic = function(){
        var controller = baseService.URL_HOST + baseService.module.dashboardStatistic;
        var param = {UserId: $rootScope.user.IdUser};
        baseService.POST(controller, param).then(function(response){
            $rootScope.dashboard = response;            
        }, function(err){
            console.log(err);
        });  
    };
    $rootScope.getMailList = function(){
        var controller = baseService.URL_HOST + baseService.module.getMailList;
        baseService.GET(controller).then(function(response){
           $rootScope.mailList = response; 
        }, function(err){
            console.log(err);
        });
    };
    $rootScope.getMapList = function(){        
        var controller = baseService.URL_HOST + baseService.module.getMapList;
        baseService.GET(controller).then(function(response){
            $rootScope.mapList = response;
            var i = 0;
            var count = 0;
            var avgLat = 0;
            var avgLng = 0;
            for(i = 0; i < $rootScope.mapList.length; i++){
                count++;
                avgLat += parseFloat($rootScope.mapList[i].Lattitude);
                avgLng += parseFloat($rootScope.mapList[i].Longitude);
                $rootScope.mapList[i].Title = 'Địa chỉ ' + (i + 1);
            }
            $rootScope.coordinate.lat = avgLat / count;
            $rootScope.coordinate.lng = avgLng / count;
        }, function(err){
            console.log(err);
        });    
    };
    $rootScope.getCategories = function(type){
        var controller = baseService.URL_HOST + baseService.module.categories; 
        var param = {type: 'admin', dataType: type};
        baseService.POST(controller,param).then(function(response){                           
            $rootScope.categories = response;                      
        }, function(error){
            console.log(error.message);
        });
    };    
    $rootScope.getAllCategories = function(){
        var controller = baseService.URL_HOST + baseService.module.allCategories;
        var param = {type: 'admin'};
        baseService.POST(controller,param).then(function(response){                           
            $rootScope.categories = response;                      
        }, function(error){
            console.log(error.message);
        });
    };    
    $rootScope.getTemplates = function(){
        var controller = baseService.URL_HOST + baseService.module.getTemplates;        
        baseService.POST(controller).then(function(response){            
            $rootScope.templates = response;                      
        }, function(err){
            console.log(err); 
        });  
    };
    $rootScope.getAllArticles = function(){
        var controller = baseService.URL_HOST + baseService.module.allArticles;
        var param = {type: 'admin'};
        baseService.POST(controller,param).then(function(response){                           
            $rootScope.articles = response;                      
        }, function(error){
            console.log(error.message);
        });  
    };
    $rootScope.getArticles = function(type){
        var controller = baseService.URL_HOST + baseService.module.articles;
        var param = {type: 'admin', dataType: type};
        baseService.POST(controller,param).then(function(response){                           
            $rootScope.articles = response;                      
        }, function(error){
            console.log(error.message);
        });  
    };
    init(); 
    $rootScope.getMailList();
    $scope.listMenu = [
        {class: 'fa fa-dashboard fa-fw', text: 'Bảng tin', link: 'admin/dashboard', id: 0},                      
        {class: 'fa fa-desktop fa-fw', text: 'Giao diện', link: '', id: 2}, 
        {class: 'fa fa-files-o fa-fw', text: 'Bài viết', link: '', id: 1},
        {class: 'fa fa-shopping-cart fa-fw', text: 'Sản phẩm', link: '', id: 3},               
        {class: 'fa fa-th-large fa-fw', text: 'Khác', link: '', id: 4},
        {class: 'fa fa-folder-o fa-fw', text: 'Tài nguyên', link: 'admin/resources', id: 5},
        {class: 'fa fa-map-marker fa-fw', text: 'Vị trí', link: 'admin/map', id: 6},        
        {class: 'fa fa-user fa-fw', text: 'Thành viên', link: 'admin/users', id: 7}
    ];    
    $scope.childMenu = [
        {class: 'fa fa-list-alt fa-fw', text: 'Danh mục', link: 'admin/categories', parent: 1},
        {class: 'fa fa-edit fa-fw', text: 'Bài viết', link: 'admin/article', parent: 1},
        {class: 'fa fa-list-alt fa-fw', text: 'Danh mục', link: 'admin/productCategories', parent: 3},
        {class: 'fa fa-edit fa-fw', text: 'Sản phẩm', link: 'admin/product', parent: 3},        
        {class: 'fa fa-flask fa-fw', text: 'Widgets', link: 'admin/widgets', parent: 2},
        {class: 'fa fa-sitemap fa-fw', text: 'Menu', link: 'admin/menu', parent: 2},
        {class: 'fa fa-sliders fa-fw', text: 'Slideshow', link: 'admin/slide', parent: 2},
        {class: 'fa fa-briefcase fa-fw', text: 'Khách hàng', link: 'admin/client', parent: 4},        
        {class: 'fa fa-thumbs-up fa-fw', text: 'Dịch vụ', link: 'admin/services', parent: 4}     
    ];   
    $scope.funcOfUser = [
        {class: 'fa fa-user fa-fw', text: 'Thông tin', link: 'admin/profile'},
        {class: 'fa fa-sign-out fa-fw', text: 'Đăng xuất', link: baseService.URL_HOST + 'login'}        
    ];
    $scope.funcOfAdmin = {
        class: 'fa fa-clipboard fa-fw', text: 'Templates', link: 'admin/templates', id: 7,
    };
    $scope.event = {        
        navigationPage: function(url){                                    
            var controller = baseService.URL_HOST + baseService.module.logout;
            baseService.GET(controller).then(function (response){
                $window.location.href = baseService.URL_HOST + 'login';                 
            }, function (error){
                console.log(error);
            });
        },        
        view: function(item){
            $rootScope.selectedMail = {};
            $rootScope.selectedMail = item;
            $('#Modal').modal('show');
        } 
    };          
    $window.onbeforeunload = function(event){                
        var controller = baseService.URL_HOST + baseService.module.destroySession;
        baseService.GetNotAsync(controller);        
    };        
});