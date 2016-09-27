angular.module('ototaihyundaiApp').controller('contactCtrl', function($scope, $rootScope, $interval, $location, baseService){
    $rootScope.pageTitle = 'Liên hệ';
    $rootScope.pageTitle += baseService.WebsiteName;    
    $scope.contact = {};
    var time = 0;
    $scope.event = {
        submit: function(){
            var controller = baseService.URL_HOST + baseService.module.sendContact;
            $scope.contact.DateSent = baseService.getDatetimeNow();
            baseService.POST(controller, $scope.contact).then(function(response){
                if(response === 'true'){
                    var message = 'Cám ơn bạn!Thư của bạn đã được gửi đi thành công.Chúng tôi sẽ phản hồi trong thời gian sớm nhất,trang web sẽ về trang chủ trong 5s nữa.';
                    var title = 'Thông báo';
                    baseService.showToast2(message, 'success', title);
                    $interval(function(){
                        if(time === 5){
                            var home = 'vi/trang-chu';
                            $location.path(home);
                        }
                        time++;
                    }, 1000);
                }
                else{
                    var message = 'Oops!Thư của bạn gửi đi thất bại.Chúng tôi rất tiếc,xin vui lòng thử lại!';
                    var title = 'Thông báo';
                    baseService.showToast2(message, 'danger', title);
                }
            }, function(err){
                
            });   
        },
        setCenter: function(lat, lng){
            $rootScope.coordinate.lat = lat;
            $rootScope.coordinate.lng = lng;
            console.log(lat, lng);
        }
    };
});