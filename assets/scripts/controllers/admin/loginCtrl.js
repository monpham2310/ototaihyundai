angular.module('ototaihyundaiApp').controller('loginCtrl', function($scope, $rootScope, $window, baseService, md5){
       
    $scope.form = {
        email: '',
        password: '',
        isRemember: true
    };    
    $scope.message = '';
    
    $scope.event = {
        submitForm: function(){            
            if($scope.userForm.$valid){                                
                var controller = baseService.URL_HOST + baseService.module.login;
                $scope.form.password = md5.createHash($scope.form.password);
                baseService.POST(controller, $scope.form).then(function(response){
                    if(response.message !== undefined){
                        $scope.message = response.message;
                        baseService.showToast(response.message, 'danger');        
                    }
                    else{                        
                        $window.location.href = response.link;                        
                    }
                }, function(err){
                    baseService.showToast('Đăng nhập thất bại!', 'danger');
                    console.log(err);
                }); 
            }
                        
        }  
    };
});