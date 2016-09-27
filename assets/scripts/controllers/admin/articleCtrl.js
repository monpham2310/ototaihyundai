angular.module('ototaihyundaiApp').controller('articleCtrl', function($scope, $rootScope, $window, $location, baseService){
    $scope.numberPage = '5';        
    $scope.numOfPage = 5;            
    $scope.articles = [];
    $scope.selectedArt = {};
    var typeLink = $location.path();
    $rootScope.currentPage = {
        parent: (typeLink.indexOf('product') !== -1)? 'Sản phẩm' : 'Bài viết',
        child: ''
    };               
    function init(){        
        $rootScope.dataType = (typeLink.indexOf('product') !== -1)? 2 : 1; 
        var controller = baseService.URL_HOST + baseService.module.articles;
        var param = {type: 'admin', dataType: $rootScope.dataType};
        baseService.POST(controller,param).then(function(response){                           
            $scope.articles = response;                     
        }, function(error){
            console.log(error.message);
        });
    };           
    init();                 
    $scope.event = {
        edit: function(item){                        
            $scope.selectedArt = {};
            $scope.selectedArt = item;               
            if($rootScope.dataType === 1)
                $location.path('admin/article/edit/' + item.ArtID);
            else
                $location.path('admin/product/edit/' + item.ArtID);
        },
        add: function(){                                                  
            if($rootScope.dataType === 1)
                $location.path('admin/article/add');
            else
                $location.path('admin/product/add');
        },
        del: function(){
            var idPro = $scope.selectedArt.ArtID;
            var controller = baseService.URL_HOST + baseService.module.delArt;
            var param = {
                id: idPro,
                user: $rootScope.user.IdUser
            };
            baseService.POST(controller, param).then(function(response){
                if(response.redirect !== undefined){
                    $window.location.href = response.redirect;
                }
                else if(response === 'true'){
                    init();
                    $('#delAlert').modal('hide');
                    baseService.showToast('Xóa thành công!', 'success');
                }
                else{
                    baseService.showToast('Xóa thất bại!', 'danger');
                }
            }, function(err){
                console.log(err.message);
            });
        },
        getItem: function(item){
            $scope.selectedArt = {};
            $scope.selectedArt = item;            
        }        
    };    
});