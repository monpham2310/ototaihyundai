angular.module('ototaihyundaiApp').controller('editArticleCtrl', function($scope, $rootScope, $window, $location, $sce, baseService){
    $scope.meta = $location.path();
    var ArtID = $scope.meta.substr($scope.meta.lastIndexOf('/') + 1);
    $scope.options = baseService.ckeditorOptions;
    $scope.options2 = baseService.ckeditorOptions2;
    $scope.selectedArt = {};
    $scope.trustAsHtml = $sce.trustAsHtml;
    var typeLink = $location.path();
    var title = (typeLink.indexOf('product') !== -1)? 'Sản phẩm' : 'Bài viết';    
    $rootScope.currentPage = {
        parent:  title,
        child: ($scope.meta.indexOf('edit') !== -1)? 'Sửa ' + title : 'Thêm ' + title
    };   
    $rootScope.dataType = (typeLink.indexOf('product') !== -1)? 2 : 1;
    function init(){
        if($scope.meta.indexOf('add') !== -1){
            $('#img').attr('src', '');
            $scope.selectedArt = {                
                Author: $rootScope.user.IdUser,
                Username: $rootScope.user.Username,
                DateCreated: baseService.getDatetimeNow(),
                ViewCount: 0,                
                Status: '1'
            };      
        }
        else{
            var controller = baseService.URL_HOST + baseService.module.editArticle + '/' + ArtID;
            baseService.GET(controller).then(function(response){
                $scope.selectedArt = response[0];
                $scope.selectedArt.ArtMeta = $scope.selectedArt.ArtMeta.substr(0, $scope.selectedArt.ArtMeta.lastIndexOf('.'));
            }, function(err){
                console.log(err);
            });
        }
    };
    init();
    $rootScope.getCategories($rootScope.dataType);            
    $rootScope.getTemplates();
    $('.collapse-link:not(.binded)').addClass("binded").click(function () {
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        var content = ibox.find('div.ibox-content');
        content.slideToggle(200);
        button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
        ibox.toggleClass('').toggleClass('border-bottom');
        setTimeout(function () {
            ibox.resize();
            ibox.find('[id^=map-]').resize();
        }, 50);
    });
    $scope.event = {
        collapseWidget: function(elemId){
            var ibox = $('#' + elemId).closest('div.ibox');
            var button = $('#' + elemId).find('i');
            var content = ibox.find('div.ibox-content');
            content.slideToggle(200);
            button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
            ibox.toggleClass('').toggleClass('border-bottom');
            setTimeout(function () {
                ibox.resize();
                ibox.find('[id^=map-]').resize();
            }, 50);  
        },
        submitForm: function(){            
            if($scope.Form.$valid){
                if($scope.meta.indexOf('edit') !== -1){
                    var controller = baseService.URL_HOST + baseService.module.updateArt;
                    if($rootScope.dataType === 1){
                        $scope.selectedArt.ArtMeta = $scope.selectedArt.ArtMeta + '.html';    
                    }
                    else{                        
                        $scope.selectedArt.ArtMeta = 'san-pham' + '/' + $scope.selectedArt.ArtMeta + '.html';    
                    }
                    if ($scope.selectedArt.Username !== undefined)
                        delete $scope.selectedArt.Username;                      
                    baseService.POST(controller, $scope.selectedArt).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            if($rootScope.dataType === 1){
                                $location.path('admin/article');
                                baseService.showToast('Cập nhật bài viết thành công!', 'success');  
                            }
                            else{
                                $location.path('admin/product');
                                baseService.showToast('Cập nhật sản phẩm thành công!', 'success');  
                            }                            
                        }
                        else{
                            baseService.showToast('Cập nhật thất bại!', 'danger');
                        }
                    }, function(err){                        
                        console.log(err.message);
                        baseService.showToast('Cập nhật thất bại!', 'danger');
                    });
                }
                else{
                    var controller = baseService.URL_HOST + baseService.module.addArt;
                    $scope.selectedArt.Author = $rootScope.user.IdUser;
                    $scope.selectedArt.Type = $rootScope.dataType;
                    if($rootScope.dataType === 1){
                        $scope.selectedArt.ArtMeta = $scope.selectedArt.ArtMeta; //+ '.html';    
                    }
                    else{                        
                        $scope.selectedArt.ArtMeta = 'san-pham' + '/' + $scope.selectedArt.ArtMeta; //+ '.html';    
                    }
                    if ($scope.selectedArt.Username !== undefined)
                        delete $scope.selectedArt.Username;
                    baseService.POST(controller, $scope.selectedArt).then(function(response){    
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            if($rootScope.dataType === 1){
                                init();
                                baseService.showToast('Đăng bài viết thành công!', 'success');  
                            }
                            else{
                                init();
                                baseService.showToast('Đăng sản phẩm thành công!', 'success');  
                            }
                        }
                        else{
                            baseService.showToast('Đăng thất bại!', 'danger');
                        }
                    }, function(err){                        
                        console.log(err.message);
                        baseService.showToast('Đăng thất bại!', 'danger');
                    }); 
                }
            }
        },        
        selectedChange: function(){            
            var Alias = '';              
            if($scope.selectedArt.ArtName !== undefined || $scope.selectedArt.ArtName !== ''){
                Alias = baseService.getAlias($scope.selectedArt.ArtName);
                $scope.selectedArt.ArtMeta = Alias;
            }            
        },
        browserImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#img').attr('src',url);                    
                    $scope.selectedArt.Image = newUrl;
                }                
            });
        }
    };    
});