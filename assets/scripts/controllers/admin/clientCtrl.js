angular.module('ototaihyundaiApp').controller('clientCtrl', function($scope, $rootScope, $window, baseService){
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
    $scope.selectedClient = {};
    function init(){
        $scope.notice = {
            class: '',
            message: ''
        };
        var controller = baseService.URL_HOST + baseService.module.getClients;
        var param = {type: 'admin'};
        baseService.POST(controller, param).then(function(response){
            $rootScope.customerList = response; 
        }, function(err){
            console.log(err);
        });
    };    
    init();    
    $scope.event = {
        edit: function(item){
            $scope.label.title = 'Sửa khách hàng';
            $scope.isUpdate = true;
            $scope.selectedClient = {};            
            $scope.selectedClient = item;              
        },
        add: function(){
            $scope.label.title = 'Thêm khách hàng';
            $scope.isUpdate = false;
            $scope.selectedClient = {};
            $('#img').attr('src', ''); 
        },
        submitForm: function(){
            if($scope.Form.$valid){
                if($scope.isUpdate){
                    var controller = baseService.URL_HOST + baseService.module.updateClient;     
                    if($scope.selectedClient.$$hashKey !== undefined)
                        delete $scope.selectedClient.$$hashKey;
                    baseService.POST(controller, $scope.selectedClient).then(function(response){
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
                    var controller = baseService.URL_HOST + baseService.module.addClient;                    
                    baseService.POST(controller, $scope.selectedClient).then(function(response){
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
            var controller = baseService.URL_HOST + baseService.module.deleteClient;
            var param = {ID: $scope.selectedClient.ID};
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
            $scope.selectedClient = {};                   
            $scope.selectedClient = item;                     
        },        
        browserImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#img').attr('src',url);
                    $('#txt_url').val(newUrl);
                    $scope.selectedClient.Image = newUrl;
                }
            });
        }         
    };
});