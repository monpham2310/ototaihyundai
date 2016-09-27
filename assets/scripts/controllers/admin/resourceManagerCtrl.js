angular.module('ototaihyundaiApp').controller('resourceManagerCtrl', function ($scope, $rootScope, $window, $sce, baseService) {
    $rootScope.currentPage = {
        parent: 'Tài nguyên',
        child: ''
    };
    $scope.label = {
        title: ''
    }
    $scope.typeArticle = {
        product: 2,
        article: 1
    };
    $scope.notice = {};
    $scope.isUpdate = false;
    $scope.trustAsHtml = $sce.trustAsHtml;    
    $scope.resType = 0;
    $scope.resCate = 0;
    $scope.selectedRes = {};
    $scope.selectedCat = {};
    function getResources(){
        $scope.notice = {
            class: '',
            message: ''
        }
        var controller = baseService.URL_HOST + baseService.module.getResources;
        var param = {type: 'admin', resourceCate: $scope.resCate};
        baseService.POST(controller, param).then(function(response){
            $rootScope.resources = response;
        }, function(err){
            console.log(err);
        });
    };
    function getResourceCate(){
        $scope.notice = {
            class: '',
            message: ''
        }
        var controller = baseService.URL_HOST + baseService.module.getResourceCate;
        var param = {
            type: 'admin',
            resourceType: $scope.resType
        };
        baseService.POST(controller, param).then(function (response) {
            $rootScope.resourceCate = response;
            $scope.resCate = (response.length > 0)? response[0]['ID'] : 0;
            getResources();
        }, function(err){
            console.log(err);
        });
    };    
    function init() {        
        var controller = baseService.URL_HOST + baseService.module.getResourceType;
        baseService.GET(controller).then(function (response) {
            $rootScope.resourceType = response;
            $scope.resType = response[0]['TypeID'];
            getResourceCate();
        }, function(err){
            console.log(err);
        });        
    };    
    init();    
    $rootScope.getCategories($scope.typeArticle.product);
    $rootScope.getArticles($scope.typeArticle.product);
    $scope.event = {
        addCat: function(){
            $scope.label.title = 'Thêm danh mục';  
            $scope.selectedCat = {
                Type: $scope.resType                
            };
            $scope.isUpdate = false;                        
        },
        editCat: function(item){
            $scope.label.title = 'Sửa danh mục';
            $scope.selectedCat = {};
            $scope.selectedCat = item;
            $('#catModal').modal('show');
            $scope.isUpdate = true;            
        },
        getCatItem: function(item){
            $scope.selectedCat = {};
            $scope.selectedCat = item;  
            $('#delCatAlert').modal('show');
        },
        delCat: function(){
            var controller = baseService.URL_HOST + baseService.module.delResourceCat;    
            var param = {ID: $scope.selectedCat.ID};
            baseService.POST(controller, param).then(function(response){
                if(response.redirect !== undefined){
                    $window.location.href = response.redirect;
                }                        
                else if(response === 'true'){
                    getResourceCate();       
                    $('#delCatAlert').modal('hide');
                    baseService.showToast('Xóa thành công!', 'success');
                }
                else{
                    baseService.showToast('Xóa thất bại!', 'danger');
                }
            }, function(err){
                baseService.showToast('Xóa thất bại!', 'danger');
                console.log(err);
            });
        },
        submitCatForm: function(){
            if($scope.catForm.$valid){
                if($scope.isUpdate){
                    var controller = baseService.URL_HOST + baseService.module.updateResourceCat;                    
                    baseService.POST(controller, $scope.selectedCat).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }                        
                        else if(response === 'true'){
                            getResourceCate();
                            $('#catModal').modal('hide');
                            baseService.showToast('Cập nhật thành công!', 'success');
                        }
                        else{
                            $scope.notice.class = "text-danger";
                            $scope.notice.message = 'Cập nhật thất bại!';
                        }
                    }, function(err){
                        $scope.notice.class = "text-danger";
                        $scope.notice.message = 'Cập nhật thất bại!';
                        console.log(err);
                    });
                }
                else{
                    var controller = baseService.URL_HOST + baseService.module.addResourceCat;                    
                    baseService.POST(controller, $scope.selectedCat).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }                        
                        else if(response === 'true'){
                            getResourceCate();
                            $('#catModal').modal('hide');
                            baseService.showToast('Thêm thành công!', 'success');
                        }
                        else{
                            $scope.notice.class = "text-danger";
                            $scope.notice.message = 'Thêm thất bại!';
                        }
                    }, function(err){
                        baseService.showToast('Thêm thất bại!', 'danger');
                        console.log(err);
                    });
                }
            }  
        },
        add: function(){
            $scope.label.title = 'Thêm tài nguyên';  
            $scope.selectedRes = {
                CateLink: '0',
                ProLink: '0',
                ResCate: $scope.resCate                
            };
            $scope.isUpdate = false;
            $('#resImg').attr('src', '');
        },
        edit: function(item){
            $scope.label.title = 'Sửa tài nguyên';
            $scope.selectedRes = {};
            $scope.selectedRes = item;
            $('#resModal').modal('show');
            $scope.isUpdate = true;
        },
        getItem: function(item){
            $scope.selectedRes = {};
            $scope.selectedRes = item;  
        },
        del: function(){
            var controller = baseService.URL_HOST + baseService.module.delResource;    
            var param = {ResID: $scope.selectedRes.ResID};
            baseService.POST(controller, param).then(function(response){
                if(response.redirect !== undefined){
                    $window.location.href = response.redirect;
                }                        
                else if(response === 'true'){
                    getResources();       
                    $('#delAlert').modal('hide');
                    baseService.showToast('Xóa thành công!', 'success');
                }
                else{
                    baseService.showToast('Xóa thất bại!', 'danger');
                }
            }, function(err){
                baseService.showToast('Xóa thất bại!', 'danger');
                console.log(err);
            });
        },
        submitForm: function(){
            if($scope.Form.$valid){
                if($scope.isUpdate){
                    var controller = baseService.URL_HOST + baseService.module.updateResource;                         
                    baseService.POST(controller, $scope.selectedRes).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }                        
                        else if(response === 'true'){
                            getResources();
                            $('#resModal').modal('hide');
                            baseService.showToast('Cập nhật thành công!', 'success');
                        }
                        else{
                            $scope.notice.class = "text-danger";
                            $scope.notice.message = 'Cập nhật thất bại!';
                        }
                    }, function(err){
                        $scope.notice.class = "text-danger";
                        $scope.notice.message = 'Cập nhật thất bại!';
                        console.log(err);
                    });
                }
                else{
                    var controller = baseService.URL_HOST + baseService.module.addResource;                    
                    baseService.POST(controller, $scope.selectedRes).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }                        
                        else if(response === 'true'){
                            getResources();
                            $('#resModal').modal('hide');
                            baseService.showToast('Thêm thành công!', 'success');
                        }
                        else{
                            $scope.notice.class = "text-danger";
                            $scope.notice.message = 'Thêm thất bại!';
                        }
                    }, function(err){
                        $scope.notice.class = "text-danger";
                        $scope.notice.message = 'Thêm thất bại!';
                        console.log(err);
                    });
                }
            }  
        },        
        selectResType: function(typeId){
            $scope.resType = typeId;
            getResourceCate();
            for(var i = 0; i < $rootScope.resourceType.length; i++){
                var li = $('#type-' + $rootScope.resourceType[i].TypeID).hasClass('active');
                if(li){
                    $('#type-' + $rootScope.resourceType[i].TypeID).removeClass('active');
                    break;
                }
            }
            $('#type-' + typeId).addClass('active');
        },
        selectResCate: function(cateId){
            $scope.resCate = cateId;
            getResources();    
            for(var i = 0; i < $rootScope.resourceType.length; i++){
                var li = $('#cat-' + $rootScope.resourceType[i].TypeID).hasClass('resCate');
                if(li){
                    $('#cat-' + $rootScope.resourceType[i].TypeID).removeClass('resCate');
                    break;
                }
            }
            $('#cat-' + cateId).addClass('resCate');
        },
        browserImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#resImg').attr('src',url);
                    $('#img_url').val(newUrl);
                    $scope.selectedRes.Image = newUrl;
                }
            });
        },
        browserFile: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);                    
                    $('#file_url').val(newUrl);
                    $scope.selectedRes.File = newUrl;
                }
            });
        },
        hover: function(id){
            $('#box-' + id).each(function () {
                animationHover(this, 'pulse');
            });
        }
    };
});