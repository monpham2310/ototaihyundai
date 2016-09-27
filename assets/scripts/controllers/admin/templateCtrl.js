angular.module('ototaihyundaiApp').controller('templateCtrl', function($scope, $rootScope, baseService, $window){
    $scope.numberPage = '10';
    $scope.numOfPage = 5;      
    $scope.selectedTemp = {};
    $scope.newTemp = {
        Status: '1'
    };
    $scope.notice = {
        class: '',
        message: ''
    }; 
    $rootScope.currentPage = {
        parent: 'Template',
        child: ''
    };   
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
            $scope.selectedTemp = {};            
            $scope.selectedTemp = item;   
            $scope.notice.class = '';
            $scope.notice.message = '';  
        },        
        submitForm: function(isUpdate){            
            if(isUpdate){ 
                if($scope.Form.$valid){
                    var controller = baseService.URL_HOST + baseService.module.updateTemplate;                    
                    baseService.POST(controller, $scope.selectedTemp).then(function(response){
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            $rootScope.getTemplates();
                            $('#myModal').modal('hide');
                            baseService.showToast('Update is successful!', 'success');
                        }
                        else{
                            $scope.notice.class = 'left text-danger';
                            $scope.notice.message = 'Update is not successful!';
                        }
                    }, function(err){
                        console.log(err.message);
                    });
                }
            }
            else{ 
                if($scope.addForm.$valid){
                    var controller = baseService.URL_HOST + baseService.module.addTemplate;
                    baseService.POST(controller, $scope.newTemp).then(function(response){    
                        if(response.redirect !== undefined){
                            $window.location.href = response.redirect;
                        }
                        else if(response === 'true'){
                            $rootScope.getTemplates();        
                            $scope.newTemp = {
                                Filename: '',
                                Status: '1',
                                Type: ''
                            };
                            baseService.showToast('Add is successful!', 'success');
                        }  
                        else{                            
                            baseService.showToast('Add is not successful!', 'danger');
                        }
                    }, function(err){
                        console.log(err.message);
                    });
                }
            }            
        },
        del: function(){                        
            var controller = baseService.URL_HOST + baseService.module.delTemplate;
            var id = $scope.selectedTemp.TempID;
            var param = {ID : id};
            baseService.POST(controller, param).then(function(response){
                if(response.redirect !== undefined){
                    $window.location.href = response.redirect;
                }
                else if(response === 'true'){
                    $rootScope.getTemplates();                  
                    $('#delAlert').modal('hide');
                    baseService.showToast('Delete is successful!', 'success');
                }
                else{
                    $('#delAlert').modal('hide');
                    baseService.showToast('Delete is not successful!', 'danger');
                }
            }, function(err){
                console.log(err.message);
            });
        },
        getItem: function(item){
            $scope.selectedTemp = {};
            $scope.selectedTemp = item;            
        }
    };
});