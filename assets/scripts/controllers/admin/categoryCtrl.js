angular.module('ototaihyundaiApp').controller('categoryCtrl', function($scope, $rootScope, $window, $location, baseService){
    $scope.numberPage = '10';
    $scope.numOfPage = 5;      
    $scope.selectedCate = {};      
    $scope.newCategory = {};
    $scope.notice = {
        class: '',
        message: ''
    };  
    var typeLink = $location.path();
    $rootScope.currentPage = {
        parent: (typeLink.indexOf('productCategories') !== -1)? 'Danh mục sản phẩm' : 'Danh mục',
        child: ''
    };      
    function init(){    
        $scope.newCategory = {   
            CatParent: '0',
            CatDescribes: ''                                           
        };
        $rootScope.dataType = (typeLink.indexOf('productCategories') !== -1)? 2 : 1;
        $rootScope.getCategories($rootScope.dataType);        
    };          
    init();
    $rootScope.getTemplates();
    $('.collapse-link:not(.binded)').addClass("binded").click( function() {
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
        edit: function(item){                        
            $scope.selectedCate = {};            
            $scope.selectedCate = item;
            $scope.selectedCate.CatMeta = $scope.selectedCate.CatMeta.substr($scope.selectedCate.CatMeta.lastIndexOf('/') + 1);
            $scope.notice.class = '';
            $scope.notice.message = '';     
        },        
        submitForm: function(isUpdate){
            if(isUpdate){   
                if($scope.Form.$valid){
                    var controller = baseService.URL_HOST + baseService.module.updateCate;  
                    if($rootScope.dataType === 1){
                        $scope.selectedCate.CatMeta = $scope.selectedCate.CatMeta;
                    }
                    else{                        
                        $scope.selectedCate.CatMeta = 'danh-muc' + '/' + $scope.selectedCate.CatMeta;
                    }
                    if($scope.selectedCate.$$hashKey !== undefined)
                        delete $scope.selectedCate.$$hashKey;
                    if($scope.selectedCate.ParentName !== undefined)
                        delete $scope.selectedCate.ParentName;
                    baseService.POST(controller, $scope.selectedCate).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            init(); 
                            $('#myModal').modal('hide');
                            baseService.showToast('Cập nhật thành công!', 'success');
                        }
                        else{
                            $scope.notice.class = 'left text-danger';
                            $scope.notice.message = 'Cập nhật thất bại!';
                        }
                    }, function(err){
                        console.log(err.message);
                    });
                }
            }
            else{       
                if($scope.addForm.$valid){
                    var controller = baseService.URL_HOST + baseService.module.addCate;
                    $scope.newCategory.Type = $rootScope.dataType;
                    if($rootScope.dataType === 1){
                        $scope.newCategory.CatMeta = $scope.newCategory.CatMeta;
                    }
                    else{                        
                        $scope.newCategory.CatMeta = 'danh-muc' + '/' + $scope.newCategory.CatMeta;
                    }
                    if($scope.selectedCate.ParentName !== undefined)
                        delete $scope.selectedCate.ParentName;
                    baseService.POST(controller, $scope.newCategory).then(function(response){    
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            init();                            
                            baseService.showToast('Thêm thành công!', 'success');
                        }  
                        else{
                            baseService.showToast('Thêm thất bại!', 'danger');
                        }
                    }, function(err){
                        console.log(err.message);
                    });
                }
            }            
        },
        del: function(){                        
            var controller = baseService.URL_HOST + baseService.module.delCate;            
            var param = {cateId : $scope.selectedCate.CatID};
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
            $scope.selectedCate = {};
            $scope.selectedCate = item;            
        },        
        getAliasForCate: function(isUpdate){            
            var cateAlias = '';
            if(isUpdate){
                if($scope.selectedCate.CatName !== undefined || $scope.selectedCate.CatName !== ''){                         
                    cateAlias = baseService.getAlias($scope.selectedCate.CatName); 
                    $scope.selectedCate.CatMeta = cateAlias;          
                }
            }
            else{
                if($scope.newCategory.CatName !== undefined || $scope.newCategory.CatName !== ''){             
                    cateAlias = baseService.getAlias($scope.newCategory.CatName);
                    $scope.newCategory.CatMeta = cateAlias;          
                }
            }
        },
        browserImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#img').attr('src',url);
                    $('#txt_url').val(newUrl);
                    $scope.newCategory.CatImg = newUrl;
                }
            });
        },
        browserEditImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#imgEdit').attr('src',url);
                    $('#txt_editUrl').val(newUrl);
                    $scope.selectedCate.CatImg = newUrl;
                }
            });
        }
    };
});