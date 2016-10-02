angular.module('ototaihyundaiApp').controller('homeCtrl', function($scope, $rootScope, $sce, baseService){
    $rootScope.pageTitle = 'Trang chủ' + baseService.WebsiteName;
    $scope.itemPerPagePro = 8;
    $scope.itemPerPageArt = 8; 
    $scope.trustAsHtml = $sce.trustAsHtml;
    $scope.body = function($el){
        $el.removeClass('not-visible');
        $el.addClass('animated fadeInLeft');
    };
    $scope.featuredProducts = [];
    $scope.cut = function(value, min, max, tail) {
        if (!value) return '';
        min = parseInt(min, 10);
        max = parseInt(max, 10);
        if (!max) return value;
        if (value.length <= max) return value;

        value = value.substr(min, max);
        var lastspace = value.lastIndexOf(' ');
        value = value.substr(0, lastspace);
        return value + (tail || ' …');
    }
    function getFeaturedPro(type){
        var controller = baseService.URL_HOST + baseService.module.getFeaturedPro + '/' + type;
        baseService.GET(controller).then(function(response){
            $scope.featuredProducts = response; 
        });
    };
    getFeaturedPro($rootScope.dataType.product);
});