angular.module('ototaihyundaiApp').controller('searchCtrl', function($scope, $rootScope, $location, $sce, baseService){
    $scope.numPerPage = 10;
    $scope.numOfPage = 5;        
    $scope.trustAsHtml = $sce.trustAsHtml;    
    $rootScope.pageTitle = 'Tìm kiếm' + ' | ' + $rootScope.searchText;            
    //$rootScope.search();
    $('#main').css({display:'none'});
});