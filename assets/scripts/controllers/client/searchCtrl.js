angular.module('ototaihyundaiApp').controller('searchCtrl', function($scope, $rootScope, $location, $translate, $sce, baseService){
    $scope.numPerPage = 10;
    $scope.numOfPage = 5;        
    $scope.trustAsHtml = $sce.trustAsHtml;    
    $rootScope.pageTitle = 'Tìm kiếm';            
    //$rootScope.search(); 
});