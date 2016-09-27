angular.module('ototaihyundaiApp').controller('articleCtrl', function($scope, $rootScope, $sce, $location, baseService){
    $scope.meta = $location.path();
    $scope.artOrPro = {};
    $scope.trustAsHtml = $sce.trustAsHtml;
    $scope.typeArticle = {
        article: 1,
        product: 2
    };
    $scope.relatedPost = [];
    function init(){
        var meta = $scope.meta.substr(1);
        var controller = baseService.URL_HOST + baseService.module.viewArtOrPro;
        var param = {meta: meta};
        baseService.POST(controller, param).then(function(response){
            $scope.artOrPro = response[0];
            $rootScope.pageTitle = $scope.artOrPro.ArtName + baseService.WebsiteName; 
            var obj = {ArtID: $scope.artOrPro.ArtID};
            $scope.relatedPost = $scope.artOrPro.RelatedPost;
        }, function(err){
            console.log(err.message); 
        });
    };    
    init();
    $scope.event = {
        active: function(idTab){
            if(idTab === 'detail'){
                $('#detail-link').addClass('active');
                $('#detail').addClass('fade in active');
                $('#estimate-link').removeClass('active');
                $('#estimate').removeClass('fade in active');
            }
            else{
                $('#estimate-link').addClass('active');
                $('#estimate').addClass('fade in active');
                $('#detail-link').removeClass('active');
                $('#detail').removeClass('fade in active');
            }
        },
        share: function(){
            if($scope.artOrPro.Image !== ''){
                FB.ui({
                    method: 'share',
                    display: 'popup',
                    href: baseService.URL_HOST + $scope.artOrPro.ArtMeta,
                    name: $scope.artOrPro.ArtName,
                    picture: baseService.URL_HOST + $scope.artOrPro.Image,
                    caption: $scope.artOrPro.ArtName,
                    description: $scope.artOrPro.ArtDescribes
                }, function(response){});
            }
            else{
                var link = $scope.artOrPro.Video.substr($scope.artOrPro.Video.indexOf('src="') + 5, ($scope.artOrPro.Video.indexOf('" frameborder')) - ($scope.artOrPro.Video.indexOf('src="') + 5));
                FB.ui({
                    method: 'share',
                    display: 'popup',
                    href: baseService.URL_HOST + $scope.artOrPro.ArtMeta,
                    name: $scope.artOrPro.ArtName,
                    source: link,
                    caption: $scope.artOrPro.ArtName,
                    description: $scope.artOrPro.ArtDescribes
                }, function(response){});
            }
        }
    };
});