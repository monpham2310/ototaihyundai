angular.module('ototaihyundaiApp').controller('indexCtrl', function($scope, $sce, $rootScope, $window, $location, baseService){
    $rootScope.pageTitle = baseService.WebsiteName;
    $rootScope.slideShow = [];
    $rootScope.navigates = '';
    $rootScope.widgets = {
        information: {},
        header: {}
    };
    $rootScope.listWidgets = [];    
    $rootScope.proCateOnHome = '';
    $rootScope.cateOnHome = '';
    $rootScope.services = [];
    $rootScope.newProducts = [];
    $rootScope.newArticles = [];
    $rootScope.mapList = [];
    $rootScope.coordinate = {
        lat: 0,
        lng: 0
    };
    $rootScope.sidebarCategory = '';
    $rootScope.sidebar = {
        featuredProducts: [],
        video: []
    };
    $rootScope.resourceCates = [];
    $rootScope.photoGallery = '';
    $rootScope.dataType = {
        article: 1,
        product: 2
    };
    $rootScope.resourceType = {
        image: 1,
        video: 2
    }
    $scope.visitorCount = [];
    $rootScope.searchText = '';
    $rootScope.contacts = [];     
    $scope.myInterval = 4000;
    $scope.trustAsHtml = $sce.trustAsHtml;
    $scope.searchResult = [];
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
        var controller = baseService.URL_HOST + baseService.module.getAllWidgets;  
        var param = {type: 'client'};
        baseService.POST(controller, param).then(function(response){    
            $rootScope.listWidgets = response;
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
    function getHeaderAndInform(){        
        var controller = baseService.URL_HOST + baseService.module.getInformation;  
        var param = {type: 'client'};
        baseService.POST(controller, param).then(function(response){
            $rootScope.widgets.information = response[0];
        });      
        var controller = baseService.URL_HOST + baseService.module.getHeader;          
        baseService.GET(controller).then(function(response){
            $rootScope.widgets.header = response[0];
        });    
    };    
    $rootScope.visitorStatistic = function(){
        var controller = baseService.URL_HOST + baseService.module.visitorStatistic;
        baseService.GET(controller).then(function(response){
            if(response.message !== undefined){
                console.log(response.message);
            }
            else{
                $scope.visitorCount = response;
                $scope.visitorCount[0].Number = ($scope.visitorCount[0].Number === null)? 0: $scope.visitorCount[0].Number;
                $scope.visitorCount[1].Number = ($scope.visitorCount[1].Number === null)? 0: $scope.visitorCount[1].Number;
                $scope.visitorCount[2].Number = ($scope.visitorCount[2].Number === null)? 0: $scope.visitorCount[2].Number;
                $scope.visitorCount[3].Number = ($scope.visitorCount[3].Number === null)? 0: $scope.visitorCount[3].Number;
                $scope.visitorCount[4].Number = ($scope.visitorCount[4].Number === null)? 0: $scope.visitorCount[4].Number;
            }
        });
    };
    $rootScope.getSidebarCategory = function(type){
        var controller = baseService.URL_HOST + baseService.module.getNestableCate + '/' + type;
        baseService.GET(controller).then(function(response){
            $rootScope.sidebarCategory = response; 
        });
    };
    $rootScope.getSidebarFeaturedPro = function(type){
        var controller = baseService.URL_HOST + baseService.module.getFeaturedPro + '/' + type;
        baseService.GET(controller).then(function(response){
            $rootScope.sidebar.featuredProducts = response; 
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
        if($rootScope.searchText !== ''){
            var param = {search: $rootScope.searchText};
            baseService.POST(controller, param).then(function(response){
                var url = '/tim-kiem';
                $location.path(url);
                $scope.searchResult = response;
                $rootScope.pageTitle = title + ' | ' + $rootScope.searchText;
            });
        }
    }; 
    baseService.GET(baseService.URL_HOST + baseService.module.addNewVisitor);    
    $rootScope.getAllNavigates();
//    getSlider();    
//    $rootScope.getSidebarFeaturedPro($rootScope.dataType.product);
//    $rootScope.visitorStatistic();
//    $rootScope.getContactUser();
//    $rootScope.getMapList();
    getHeaderAndInform();
    $rootScope.getWidgets();
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
});