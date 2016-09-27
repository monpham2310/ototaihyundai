angular.module('ototaihyundaiApp').config(function ($routeProvider, $locationProvider, $compileProvider){
    $routeProvider.when('/404', {
        templateUrl: 'IndexController/notfound'        
    })     
    .when('/trang-chu', {
        templateUrl: function(url){            
            return 'IndexController/loadView/home';
        }
    })
    .when('/lien-he', {
        templateUrl: function(url){            
            return 'IndexController/loadView/contact';
        }
    })    
    .when('/tim-kiem', {
        templateUrl: function(url){            
            return 'IndexController/loadView/search';
        }
    })             
    .when('/:meta', {
        templateUrl: function(url){
            var meta = url.lang + '/' + url.meta;
            return 'IndexController/loadTemplate/' + '?meta=' + meta;
        }        
    })
    .when('/:meta/:child', {
        templateUrl: function(url){
            var meta = url.meta + '/' + url.child;            
            return 'IndexController/loadTemplate/' + '?meta=' + meta;
        }      
    })      
    .otherwise({
        redirectTo: '/404'
    });        
    $locationProvider.html5Mode(true);
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|tel|skype|chrome-extension):/);    
});   