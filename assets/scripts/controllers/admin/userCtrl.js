angular.module('ototaihyundaiApp').controller('userCtrl', function($scope, $rootScope, $window, baseService, md5){
    $scope.isUpdate = false;
    $scope.numberPage = '10';
    $scope.numOfPage = 5;
    $scope.label = {
        title: ''        
    }; 
    $scope.permissions = [
        {IdLevel: 0, LevelName: 'Admin'},
        {IdLevel: 1, LevelName: 'Biên tập viên'},
        {IdLevel: 2, LevelName: 'Tác giả'},
        {IdLevel: 2, LevelName: 'Nhân viên KD'},
    ];    
    $scope.notice = {
        class: '',
        message: ''
    };
    $rootScope.currentPage = {
        parent: 'Thành viên',
        child: ''
    };
    var email = '';
    $scope.selectedUser = {};          
    $scope.checkExistsEmail = false;               
    function init(){                
        var controller = baseService.URL_HOST + baseService.module.allUsers;
        baseService.GET(controller).then(function(response){                           
            $rootScope.usersList = response;              
        }, function(error){
            console.log(error);
        });
    };            
    init();      
    function checkEmail(){
        var controller = baseService.URL_HOST + baseService.module.checkEmail;
        var param = {email: $scope.selectedUser.Email};
        baseService.POST(controller, param).then(function(response){
            if(response === '1'){
                $scope.checkExistsEmail = true;                        
            }
            else{
                $scope.checkExistsEmail = false;                        
            }
        }, function(err){
            console.log(err.message);
        });
    };
    $scope.event = {
        edit: function(item){
            $scope.label.title = 'Sửa thông tin';
            $scope.isUpdate = true;
            $scope.selectedUser = {};            
            $scope.selectedUser = item; 
            email = item.Email;
            $scope.notice.class = '';
            $scope.notice.message = '';  
        },
        add: function(){
            $scope.label.title = 'Thêm thành viên';
            $scope.isUpdate = false;
            $scope.selectedUser = {                
                Avatar: '',
                Phone: '',
                Status: '1',
                IsContact: '0'
            };       
            $('#img').attr('src', '');
            email = '';
            $scope.notice.class = '';
            $scope.notice.message = '';  
        },
        submitForm: function(){
            var noimage = 'assets/includes/upload/images/users/noimage.jpg';
            if(!$scope.checkExistsEmail){
                if($scope.Form.$valid){
                    if($scope.isUpdate){                                        
                        var controller = baseService.URL_HOST + baseService.module.updateUser;                        
                        $scope.selectedUser.Avatar = ($scope.selectedUser.Avatar === '')? noimage : $scope.selectedUser.Avatar;
                        if($scope.selectedUser.Password !== undefined && $scope.selectedUser.Password !== '')
                            $scope.selectedUser.Password = md5.createHash($scope.selectedUser.Password);
                        if($scope.selectedUser.$$hashKey !== undefined)
                            delete $scope.selectedUser.$$hashKey;
                        baseService.POST(controller, $scope.selectedUser).then(function(response){
                            if(response.redirect !== undefined){
                                $window.location.href = response.redirect;
                            }
                            else if(response[0] !== 'null'){
                                init(); 
                                $('#myModal').modal('hide');
                                if(response[0].IdUser === $rootScope.user){
                                    $rootScope.user = response[0];
                                }
                                baseService.showToast('Cập nhật thành công!', 'success');
                            }
                            else{
                                $scope.notice.class = 'left text-danger';
                                $scope.notice.message = 'Cập nhật thất bại!';
                            }
                        }, function(err){
                            $scope.notice.class = 'left text-danger';
                            $scope.notice.message = 'Cập nhật thất bại!';
                            console.log(err);
                        });
                    }
                    else{
                        if($scope.selectedUser.Password === $scope.selectedUser.ConfirmPassword){
                            var controller = baseService.URL_HOST + baseService.module.addUser;                            
                            $scope.selectedUser.Avatar = ($scope.selectedUser.Avatar === '')? noimage : $scope.selectedUser.Avatar;
                            $scope.selectedUser.Password = md5.createHash($scope.selectedUser.Password);                            
                            if($scope.selectedUser.$$hashKey !== undefined)
                                delete $scope.selectedUser.$$hashKey;
                            delete $scope.selectedUser.ConfirmPassword;
                            baseService.POST(controller, $scope.selectedUser).then(function(response){  
                                if(response.redirect !== undefined){
                                    $window.location.href = response.redirect;
                                }
                                else if(response === 'true'){
                                    init(); 
                                    $('#myModal').modal('hide');
                                    baseService.showToast('Thêm thành công!', 'success');
                                }  
                                else{
                                    $scope.notice.class = 'left text-danger';
                                    $scope.notice.message = 'Thêm thất bại!';
                                }
                            }, function(err){
                                console.log(err);
                            });
                        }
                        else{                                    
                            $scope.notice.class = 'left text-danger';
                            $scope.notice.message = 'Mật khẩu không khớp!';
                        }
                    }
                }
            }            
        },
        del: function(){                        
            var controller = baseService.URL_HOST + baseService.module.delUser;            
            var param = {'userId' : $scope.selectedUser.UserID};
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
                    $('#delAlert').modal('hide');
                    baseService.showToast('Xóa thất bại!', 'danger');
                }
            }, function(err){
                console.log(err);
            });
        },
        getItem: function(item){
            $scope.selectedUser = {};                   
            $scope.selectedUser = item;                     
        },        
        browserImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#img').attr('src',url);
                    $('#txt_url').val(newUrl);
                    $scope.selectedUser.Avatar = newUrl;
                }
            });
        },
        checkExists: function(){
            if($scope.selectedUser.Email !== undefined && $scope.selectedUser.Email !== ''){
                if($scope.isUpdate){
                    if($scope.selectedUser.Email !== email){
                        checkEmail();
                    }
                }
                else{
                    checkEmail();
                }
            }
        }
    };
});