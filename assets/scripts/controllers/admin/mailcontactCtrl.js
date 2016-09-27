angular.module('ototaihyundaiApp').controller('mailcontactCtrl', function($scope, $rootScope, baseService){
    $rootScope.currentPage = {
        parent: 'Hộp thư',
        child: ''
    };
    $scope.numberPage = '10';
    $rootScope.getMailList();    
    $scope.event = {
        view: function(item){
            $rootScope.selectedMail = {};
            $rootScope.selectedMail = item;
            $('#myModal').modal('show');
        },  
        del: function(){                        
            var controller = baseService.URL_HOST + baseService.module.deleteMail;
            var param = {ID: $rootScope.selectedMail.ID};
            baseService.POST(controller, param).then(function(response){                
                if(response === 'true'){
                    $rootScope.getMailList();
                    $('#delAlert').modal('hide');  
                    baseService.showToast('Xóa thành công!', 'success');
                }                        
            }, function(err){
                baseService.showToast('Xóa thất bại!', 'danger');
                console.log(err);
            })
        },
        getItem: function(item){
            $rootScope.selectedMail = {};                   
            $rootScope.selectedMail = item;                     
        }         
    };
});