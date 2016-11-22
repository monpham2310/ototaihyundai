angular.module('ototaihyundaiApp').controller('indexCtrl', function($scope, $sce, $rootScope, $window, $location, baseService){
    $rootScope.pageTitle = baseService.WebsiteName;
    $rootScope.slideShow = '';
    $rootScope.navigates = '';
    $rootScope.widgets = {
        header: {}
    };
    $rootScope.listBodyWidgets = [];    
    $rootScope.listSidebarWidgets = [];    
    $rootScope.listFooterWidgets = [];    
    $rootScope.services = [];
    $rootScope.mapList = [];
    $rootScope.coordinate = {
        lat: 0,
        lng: 0
    };
    $rootScope.resourceType = {
        image: 1,
        video: 2
    }
    $rootScope.searchText = '';
    $rootScope.contacts = [];     
    $scope.myInterval = 4000;
    $scope.trustAsHtml = $sce.trustAsHtml;
    $rootScope.searchResult = null;
    function getSlider(){
        var getSlides = baseService.URL_HOST + baseService.module.getSlides; 
        var param = {type: 'client'};
        baseService.POST(getSlides, param).then(function(response){            
            $rootScope.slideShow = response;            
        }, function(err){
            console.log(err.message);
        });
    };
    $rootScope.getContactUser = function(){
        var controller = baseService.URL_HOST + baseService.module.allUsers;
        var param = {type: 'client'};
        baseService.POST(controller, param).then(function(response){
            $rootScope.contacts = response;
        }, function(err){
            console.log(err);
        });
    };
    $rootScope.getAllNavigates = function(){
        var controller = baseService.URL_HOST + baseService.module.getNavigates;
        var param = {type: 'client'};
        baseService.POST(controller, param).then(function(response){
            $rootScope.navigates = response;
        }, function(err){
            console.log(err);
        });
    };
    $rootScope.getWidgets = function(area){
        var controller = baseService.URL_HOST + baseService.module.getWidgets;  
        var param = {Area: area};
        baseService.POST(controller, param).then(function(response){  
            if(area === 'body')
                $rootScope.listBodyWidgets = response;
            if(area === 'sidebar')
                $rootScope.listSidebarWidgets = response;
            if(area === 'footer')
                $rootScope.listFooterWidgets = response;
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
    $rootScope.initMapList = function(model){                    
        var i = 0;
        var count = 0;
        var avgLat = 0;
        var avgLng = 0;
        for(i = 0; i < model.length; i++){
            count++;
            avgLat += parseFloat(model[i].Lattitude);
            avgLng += parseFloat(model[i].Longitude);            
        }
        $rootScope.coordinate.lat = avgLat / count;
        $rootScope.coordinate.lng = avgLng / count;        
    };
    function getHeader(){              
        var controller = baseService.URL_HOST + baseService.module.getHeader;          
        baseService.GET(controller).then(function(response){
            $rootScope.widgets.header = response[0];
        });    
    };      
    $rootScope.getResources = function(type){
        var controller = baseService.URL_HOST + baseService.module.getResources; 
        var param = {type: 'client', resourceCate: type};
        baseService.POST(controller, param).then(function(response){
            if(type === $rootScope.resourceType.image)
                $rootScope.photoGallery = response;
        }, function(err){
            console.log(err);
        });
    };
    $rootScope.search = function(){
        var controller = baseService.URL_HOST + baseService.module.search;
        console.log(controller);
        if($rootScope.searchText !== ''){
            var param = {search: $rootScope.searchText};
            console.log(param);
            baseService.POST(controller, param).then(function(response){
                console.log(response);
                var url = '/tim-kiem';
                $location.path(url);
                $rootScope.searchResult = response;                
            });
        }
    }; 
    baseService.GET(baseService.URL_HOST + baseService.module.addNewVisitor);    
    $rootScope.getAllNavigates();
    getSlider();
    /*$rootScope.getContactUser();*/
    /*$rootScope.getMapList();*/
    getHeader();
    $rootScope.getWidgets('body');
    $rootScope.getWidgets('sidebar');
    $rootScope.getWidgets('footer');
    $scope.sidebarRight = function($el){
        $el.removeClass('not-visible');
        $el.addClass('animated fadeInRight');
    };
    $scope.event = {
        hover: function(id){
            $('#drop-'+id).addClass('open');
        },
        leave: function(id){
            $('#drop-'+id).removeClass('open');
        },        
        setCenter: function(lat, lng){
            $rootScope.coordinate.lat = lat;
            $rootScope.coordinate.lng = lng;
            console.log(lat, lng);
        }
    }
    $('#main').css({display:'block'});
});
angular.module('ototaihyundaiApp').controller('404Ctrl', function($scope, $rootScope, baseService){
    
});