angular.module('ototaihyundaiApp').config(function ($routeProvider, $locationProvider, $compileProvider){
    $routeProvider.when('/', {
        templateUrl: 'Indexcontroller/loadView/home'
    })       
    .when('/trang-chu', {
        templateUrl: 'Indexcontroller/loadView/home'
    })
    .when('/lien-he', {
        templateUrl: 'Indexcontroller/loadView/contact'
    })    
    .when('/tim-kiem', {
        templateUrl: 'Indexcontroller/loadView/search'
    })  
    .when('/404', {
        templateUrl: 'Indexcontroller/notfound'        
    })  
    .when('/:meta', {
        templateUrl: function(url){
            var meta = url.meta;
            return 'Indexcontroller/loadTemplate/' + '?meta=' + meta;
        }        
    })
    .when('/:meta/:child', {
        templateUrl: function(url){
            var meta = url.meta + '/' + url.child;            
            return 'Indexcontroller/loadTemplate/' + '?meta=' + meta;
        }      
    })
    .otherwise({
        redirectTo: '/404'
    });        
    $locationProvider.html5Mode(true);
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|tel|skype|chrome-extension):/);    
});   