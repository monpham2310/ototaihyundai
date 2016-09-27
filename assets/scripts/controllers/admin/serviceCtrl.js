angular.module('ototaihyundaiApp').controller('serviceCtrl', function($scope, $rootScope, $window, baseService){
    $rootScope.currentPage = {
        parent: 'Khách hàng',
        child: ''
    };    
    $scope.isUpdate = false;
    $scope.numberPage = '10';
    $scope.numOfPage = 5;
    $scope.label = {
        title: ''        
    };
    $scope.notice = {};
    $scope.selectedService = {};
    function init(){
        $scope.notice = {
            class: '',
            message: ''
        };
        var controller = baseService.URL_HOST + baseService.module.getServices;
        var param = {type: 'admin'};
        baseService.POST(controller, param).then(function(response){
            $rootScope.serviceList = response; 
        }, function(err){
            console.log(err);
        });
    };
    init();    
    $scope.event = {
        edit: function(item){
            $scope.label.title = 'Sửa dịch vụ';
            $scope.isUpdate = true;
            $scope.selectedService = {};            
            $scope.selectedService = item;             
        },
        add: function(){
            $scope.label.title = 'Thêm dịch vụ';
            $scope.isUpdate = false;
            $scope.selectedService = {};
            $('#img').attr('src', ''); 
        },
        submitForm: function(){
            if($scope.Form.$valid){
                if($scope.isUpdate){
                    var controller = baseService.URL_HOST + baseService.module.updateService;       
                    if($scope.selectedService.$$hashKey !== undefined)
                        delete $scope.selectedService.$$hashKey;
                    baseService.POST(controller, $scope.selectedService).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            init();
                            $('#myModal').modal('hide');  
                            baseService.showToast('Cập nhật thành công!', 'success');
                        }  
                        else{
                            $scope.notice.class = 'text-danger';
                            $scope.notice.message = 'Cập nhật thất bại!';
                        }
                    }, function(err){                        
                        $scope.notice.class = 'text-danger';
                        $scope.notice.message = 'Cập nhật thất bại!';
                        console.log(err);
                    });
                }
                else{
                    var controller = baseService.URL_HOST + baseService.module.addService;                    
                    baseService.POST(controller, $scope.selectedService).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            init();
                            $('#myModal').modal('hide');  
                            baseService.showToast('Thêm thành công!', 'success');
                        } 
                        else{
                            $scope.notice.class = 'text-danger';
                            $scope.notice.message = 'Thêm thất bại!';
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
            var controller = baseService.URL_HOST + baseService.module.deleteService;
            var param = {ID: $scope.selectedService.ID};
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
                baseService.showToast('Xóa thất bại!', 'danger');
                console.log(err);
            })
        },
        getItem: function(item){
            $scope.selectedService = {};                   
            $scope.selectedService = item;                     
        },        
        browserImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#img').attr('src',url);
                    $('#txt_url').val(newUrl);
                    $scope.selectedService.Image = newUrl;
                }
            });
        }       
    };
});