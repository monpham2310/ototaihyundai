angular.module('ototaihyundaiApp').config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider){
    $routeProvider.when('/admin', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/dashboard'
    })
    .when('/admin/dashboard', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/dashboard'
    })    
    .when('/admin/users', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/users'
    })
    .when('/admin/templates', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/templates'
    })
    .when('/admin/categories', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/categories'
    })
    .when('/admin/productCategories', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/categories'
    })
    .when('/admin/article', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/articles'
    })
    .when('/admin/widgets', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/widgets'
    })
    .when('/admin/menu', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/navigates'
    })  
    .when('/admin/slide', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/slide'
    }) 
    .when('/admin/product', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/articles'
    })        
    .when('/admin/client', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/client'
    })    
    .when('/admin/services', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/services'
    })
    .when('/admin/map', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/map'
    })
    .when('/admin/resources', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/resourceManager'
    })
    .when('/admin/mailcontact', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/mailcontact'
    })
    .when('/admin/article/add', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/editArticle'
    })
    .when('/admin/product/add', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/editArticle'
    })    
    .when('/admin/article/edit/:id', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/editArticle'
    })
    .when('/admin/product/edit/:id', {
        templateUrl: 'admin/Viewmanagecontroller/loadView/editArticle'
    })
    .otherwise({
        redirectTo: '/admin'
    });    
    $locationProvider.html5Mode(true);
}]);   