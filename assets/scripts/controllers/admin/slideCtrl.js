angular.module('ototaihyundaiApp').controller('slideCtrl', function($scope, $rootScope, $window, baseService){
    $rootScope.currentPage = {
        parent: 'Slide',
        child: ''
    };
    $scope.typeArticle = {
        product: 2,
        article: 1
    };    
    $scope.isUpdate = false;
    $scope.numberPage = '10';
    $scope.numOfPage = 5;
    $scope.label = {
        title: ''        
    };
    $scope.notice = {};
    $scope.selectedSlide = {};
    function init(){
        $scope.notice = {
            class: '',
            message: ''
        };
        var controller = baseService.URL_HOST + baseService.module.getSlides;
        var param = {type: 'admin'};
        baseService.POST(controller, param).then(function(response){
            $rootScope.slideList = response; 
        }, function(err){
            console.log(err);
        });
    };    
    init();
    $rootScope.getCategories($scope.typeArticle.product);
    $rootScope.getArticles($scope.typeArticle.product);
    $scope.event = {
        edit: function(item){
            $scope.label.title = 'Sửa slide';
            $scope.isUpdate = true;
            $scope.selectedSlide = {};            
            $scope.selectedSlide = item;              
        },
        add: function(){
            $scope.label.title = 'Thêm slide';
            $scope.isUpdate = false;
            $scope.selectedSlide = {
                CateLink: '0',
                ProLink: '0'                
            };            
            $('#img').attr('src', '');
        },
        submitForm: function(){
            if($scope.Form.$valid){
                if($scope.isUpdate){
                    var controller = baseService.URL_HOST + baseService.module.updateSlide;                      
                    baseService.POST(controller, $scope.selectedSlide).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            init();
                            $('#myModal').modal('hide');  
                            baseService.showToast('Cập nhật thành công!', 'success');
                        }                        
                    }, function(err){
                        $scope.notice.class = 'text-danger';
                        $scope.notice.message = 'Cập nhật thất bại!';
                        console.log(err);
                    });
                }
                else{
                    var controller = baseService.URL_HOST + baseService.module.addSlide;                    
                    baseService.POST(controller, $scope.selectedSlide).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            init();
                            $('#myModal').modal('hide');  
                            baseService.showToast('Thêm thành công!', 'success');
                        }                        
                    }, function(err){
                        $scope.notice.class = 'text-danger';
                        $scope.notice.message = 'Thêm thất bại!';
                        console.log(err);
                    });
                }
            }          
        },
        del: function(){                        
            var controller = baseService.URL_HOST + baseService.module.deleteSlide;
            var param = {ID: $scope.selectedSlide.ID};
            baseService.POST(controller, param).then(function(response){
                if(response.redirect !== undefined){
                    $window.location.href = response.redirect;
                }
                else if(response === 'true'){
                    init();
                    $('#delAlert').modal('hide');  
                    baseService.showToast('Xóa thành công!', 'success');
                }                        
            }, function(err){
                baseService.showToast('Xóa thất bại!', 'danger');
                console.log(err);
            })
        },
        getItem: function(item){
            $scope.selectedSlide = {};                   
            $scope.selectedSlide = item;                     
        },        
        browserImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#img').attr('src',url);
                    $('#txt_url').val(newUrl);
                    $scope.selectedSlide.Image = newUrl;
                }
            });
        }        
    };
}); 