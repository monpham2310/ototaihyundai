angular.module('ototaihyundaiApp').controller('dashboardCtrl', function($scope, $rootScope, baseService){
    $scope.dashboard = [];
    $rootScope.currentPage = {
        parent: 'Bảng tin',
        child: ''
    };    
    if($rootScope.user.IdUser !== '')
        $rootScope.dashboardStatistic();
});