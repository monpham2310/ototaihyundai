angular.module('ototaihyundaiApp').controller('templateCtrl', function($scope, $rootScope, $location, $sce, baseService){
    $scope.meta = $location.path();
    $scope.sitemap = {};
    $scope.trustAsHtml = $sce.trustAsHtml;
    $scope.itemList = [];
    $scope.typeArticle = {
        article: 1,
        product: 2
    }; 

    function init(){
        var meta = $scope.meta.substr(1);
        var controller = baseService.URL_HOST + baseService.module.getCateOrProCate;
        var param = {meta: meta};
        console.log(param);
        baseService.POST(controller, param).then(function(response){
            $scope.sitemap = response[0];
            $rootScope.pageTitle = $scope.sitemap.CatName + baseService.WebsiteName;
            $scope.itemList = $scope.sitemap.CateList;
        }, function(err){
            console.log(err.message);
        });
    };
    init();
    $('#main').css({display:'none'});
});