angular.module('ototaihyundaiApp').controller('galleryCtrl', function($scope, $rootScope, baseService){
    $rootScope.pageTitle = 'Thư viện ảnh';
    $rootScope.pageTitle += baseService.WebsiteName;
    $scope.resCate = 0;    
    $scope.selectedPhoto = {};
    function init(){
        var controller = baseService.URL_HOST + baseService.module.getResourceCate;
        var param = {type: 'client', resourceType: $scope.resourceType.image};
        baseService.POST(controller, param).then(function(response){
            $rootScope.resourceCates = response;
            $scope.resCate = response[0]['ID'];
            $rootScope.getResources($rootScope.resourceType.image);
        }, function(err){
           console.log(err); 
        });
    };
    init();
    $scope.event = {
        selectedCate: function(id){
            $scope.resCate = id;            
            for(var i = 0; i < $rootScope.resourceCates.length; i++){
                var buttonActive = $('#btn-' + $rootScope.resourceCates[i].ID).hasClass('btn-active');
                if(buttonActive){
                    $('#btn-' + $rootScope.resourceCates[i].ID).removeClass('btn-active');
                    break;
                }
            }
            $('#btn-' + id).addClass('btn-active');
        },
        openPhoto: function(item){
            $scope.selectedPhoto = {};
            $scope.selectedPhoto = item;
            $('#photoModal').modal('show');
        }
    }
});