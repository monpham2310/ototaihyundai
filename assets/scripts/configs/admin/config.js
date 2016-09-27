angular.module('ototaihyundaiApp').config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider){
    $routeProvider.when('/admin', {
        templateUrl: 'admin/viewManageController/loadView/dashboard'
    })
    .when('/admin/dashboard', {
        templateUrl: 'admin/viewManageController/loadView/dashboard'
    })    
    .when('/admin/users', {
        templateUrl: 'admin/viewManageController/loadView/users'
    })
    .when('/admin/templates', {
        templateUrl: 'admin/viewManageController/loadView/templates'
    })
    .when('/admin/categories', {
        templateUrl: 'admin/viewManageController/loadView/categories'
    })
    .when('/admin/productCategories', {
        templateUrl: 'admin/viewManageController/loadView/categories'
    })
    .when('/admin/article', {
        templateUrl: 'admin/viewManageController/loadView/articles'
    })
    .when('/admin/widgets', {
        templateUrl: 'admin/viewManageController/loadView/widgets'
    })
    .when('/admin/menu', {
        templateUrl: 'admin/viewManageController/loadView/navigates'
    })  
    .when('/admin/slide', {
        templateUrl: 'admin/viewManageController/loadView/slide'
    }) 
    .when('/admin/product', {
        templateUrl: 'admin/viewManageController/loadView/articles'
    })        
    .when('/admin/client', {
        templateUrl: 'admin/viewManageController/loadView/client'
    })    
    .when('/admin/services', {
        templateUrl: 'admin/viewManageController/loadView/services'
    })
    .when('/admin/map', {
        templateUrl: 'admin/viewManageController/loadView/map'
    })
    .when('/admin/resources', {
        templateUrl: 'admin/viewManageController/loadView/resourceManager'
    })
    .when('/admin/mailcontact', {
        templateUrl: 'admin/viewManageController/loadView/mailcontact'
    })
    .when('/admin/article/add', {
        templateUrl: 'admin/viewManageController/loadView/editArticle'
    })
    .when('/admin/product/add', {
        templateUrl: 'admin/viewManageController/loadView/editArticle'
    })    
    .when('/admin/article/edit/:id', {
        templateUrl: 'admin/viewManageController/loadView/editArticle'
    })
    .when('/admin/product/edit/:id', {
        templateUrl: 'admin/viewManageController/loadView/editArticle'
    })
    .otherwise({
        redirectTo: '/admin'
    });    
    $locationProvider.html5Mode(true);
}]);   