angular.module('ototaihyundaiApp').controller('mapCtrl', function ($scope, $rootScope, $window, baseService) {
    $rootScope.currentPage = {
        parent: 'Vị trí',
        child: ''
    };    
    $scope.selectedMarker = {};
    $scope.newMap = {};
    $scope.notice = {
        class: '',
        message: ''
    };
    $('.collapse-button:not(.binded)').addClass("binded").click(function () {
        var ibox = $(this).closest('li.dd-item');
        var button = $(this).find('i');
        var content = ibox.find('form.panel');
        content.slideToggle(200);
        button.toggleClass('fa-caret-down').toggleClass('fa-caret-up');
    });
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
    $rootScope.getMapList();
    $scope.event = {
        add: function(){
            $scope.newMap = {};  
            $scope.notice = {
                class: '',
                message: ''
            };
        },
        delMap: function(){
            var controller = baseService.URL_HOST + baseService.module.deleteMarker;
            var param = {MapID: $scope.newMap.MapID};
            baseService.POST(controller, param).then(function(response){
                if (response.redirect !== undefined) {
                    $window.location.href = response.redirect;
                } else if (response === 'true') {
                    $rootScope.getMapList();
                    $('#delAlert').modal('hide');
                    baseService.showToast('Xóa thành công!', 'success');
                } else {
                    baseService.showToast('Xóa thất bại!', 'danger');
                }
            }, function(err){
                baseService.showToast('Xóa thất bại!', 'danger');
                console.log(err);
            });
        },
        submitForm: function () {
            var controller = baseService.URL_HOST + baseService.module.addNewMarker;            
            baseService.POST(controller, $scope.newMap).then(function (response) {
                if (response.redirect !== undefined) {
                    $window.location.href = response.redirect;
                } else if (response === 'true') {
                    $rootScope.getMapList();
                    $('#myModal').modal('hide');
                    baseService.showToast('Thêm mới thành công!', 'success');
                } else {
                    $scope.notice.class = 'text-danger';
                    $scope.notice.message = 'Thêm mới thất bại!';
                }
            }, function(err){
                $scope.notice.class = 'text-danger';
                $scope.notice.message = 'Thêm mới thất bại!';
            });
        },
        updateForm: function (obj) {
            var controller = baseService.URL_HOST + baseService.module.updateMarker;  
            if(obj.Title !== undefined)
                delete obj.Title;
            baseService.POST(controller, obj).then(function (response) {
                if (response.redirect !== undefined) {
                    $window.location.href = response.redirect;
                } else if (response === 'true') {
                    $rootScope.getMapList();
                    baseService.showToast('Cập nhật thành công!', 'success');
                } else {
                    baseService.showToast('Cập nhật thất bại!', 'danger');
                }
            }, function(err){
                baseService.showToast('Cập nhật thất bại!', 'danger');
            });
        },
        delete: function(obj){
            $scope.newMap = {};
            $scope.newMap = obj;
            $('#delAlert').modal('show');
        },
        getCoordinate: function(isUpdate){            
            if(!isUpdate){
                if($scope.newMap.Address !== undefined && $scope.newMap.Address !== ''){
                    baseService.getCoordinateOnGoogleMap($scope.newMap.Address).then(function(response){
                        $scope.newMap.Lattitude = response.lat;
                        $scope.newMap.Longitude = response.lng;
                    });
                }
            }
        },
        slide: function (obj) {
            $rootScope.coordinate.lat = obj.Lattitude;
            $rootScope.coordinate.lng = obj.Longitude;    
            $('#bt-' + obj.MapID).find('i').toggleClass('fa-caret-down').toggleClass('fa-caret-up');
            $('#form-' + obj.MapID).slideToggle(200);
        },
    };
});