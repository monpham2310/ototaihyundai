angular.module('ototaihyundaiApp').controller('navigateCtrl', function ($scope, $rootScope, baseService, $window) {
    $rootScope.currentPage = {
        parent: 'Menu',
        child: ''
    };    
    $scope.dataType = {
        article: 1,
        product: 2
    };
    $scope.selected = {};
    var isChanged = false;
    $scope.artCategories = [];
    $scope.proCategories = [];
    $scope.listArticles = [];
    $scope.listProducts = [];
    $scope.listPages = [];
    $scope.selectedNav = {};
    $scope.newNavigate = {};
    $scope.nestableNav = [];
    function getData(){
        var controller = baseService.URL_HOST + baseService.module.categories;
        var param = {type: 'admin', dataType: $scope.dataType.article};
        baseService.POST(controller,param).then(function(response){                           
            $scope.artCategories = response;                      
        }, function(error){
            console.log(error.message);
        });
        var controller = baseService.URL_HOST + baseService.module.categories;
        var param = {type: 'admin', dataType: $scope.dataType.product};
        baseService.POST(controller,param).then(function(response){                           
            $scope.proCategories = response;                      
        }, function(error){
            console.log(error.message);
        });
        var controller = baseService.URL_HOST + baseService.module.articles;
        var param = {type: 'admin', dataType: $scope.dataType.article};
        baseService.POST(controller,param).then(function(response){                           
            $scope.listArticles = response;                      
        }, function(error){
            console.log(error.message);
        });
        var controller = baseService.URL_HOST + baseService.module.articles;
        var param = {type: 'admin', dataType: $scope.dataType.product};
        baseService.POST(controller,param).then(function(response){                           
            $scope.listProducts = response;                      
        }, function(error){
            console.log(error.message);
        });
        var controller = baseService.URL_HOST + baseService.module.listPages;
        var param = {type: 'page'};
        baseService.POST(controller,param).then(function(response){                           
            $scope.listPages = response;                      
        }, function(error){
            console.log(error.message);
        });
    };
    function init() {  
        $scope.selected = {
            cates: [],
            articles: [],
            proCates: [],
            products: [],
            pages: []
        };
        $scope.newNavigate = {
            Status: '1'
        }
        var controller = baseService.URL_HOST + baseService.module.getNavigates;
        var param = {
            type: 'admin'
        };
        baseService.POST(controller, param).then(function (response) {
            $rootScope.navigates = response;
        });        
    };    
    init();  
    getData();    
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
    function updateOutput(e) {
        var list = e.length ? e : $(e.target),
            output = list.data('output');
        if ($window.JSON) {            
            isChanged = true;
        } else {
            console.log('JSON browser support required for this demo.');
        }
    }; 
    $('#nestable').nestable({
        group: 1
    }).on('change', updateOutput);
    $scope.event = {        
        slide: function (id) {
            $('#bt-' + id).find('i').toggleClass('fa-caret-down').toggleClass('fa-caret-up');
            $('#form-' + id).slideToggle(200);
        },
        saveChange: function () {
            console.log($window.JSON.stringify($scope.nestableNav));
            $scope.nestableNav = $('#nestable').nestable('serialize');
            var controller = baseService.URL_HOST + baseService.module.changePosition;
            baseService.POST(controller, $scope.nestableNav).then(function (response) {
                isChanged = false;
                init();                
                baseService.showToast('Cập nhật vị trí thành công!', 'success');
            }, function(err){
                baseService.showToast('Cập nhật vị trí thất bại!', 'danger');
                console.log(err);
            });
        },
        addNavigatesList: function (array, type) {
            var controller = baseService.URL_HOST + baseService.module.addNavigatesList + '/' + type;
            if(isChanged)
                $scope.event.saveChange();
            baseService.POST(controller, array).then(function (response) {
                if (response.redirect !== undefined) {
                    $window.location.href = response.redirect;
                } else {
                    init();                    
                    baseService.showToast('Thêm thành công!', 'success');
                }
            }, function(err){
                baseService.showToast('Thêm thất bại!', 'danger');
                console.log(err);
            });
        },
        submitForm: function () {
            if ($scope.addForm.$valid) {
                var controller = baseService.URL_HOST + baseService.module.addCustomNavigate;
                $scope.newNavigate.Type = 1;
                $scope.newNavigate.NavMeta = $scope.newNavigate.NavMeta;
                if(isChanged)
                    $scope.event.saveChange();
                baseService.POST(controller, $scope.newNavigate).then(function (response) {
                    if (response.redirect !== undefined) {
                        $window.location.href = response.redirect;
                    } else {                        
                        init();
                        baseService.showToast('Thêm thành công!', 'success');
                    }
                }, function(err){
                    baseService.showToast('Thêm thất bại!', 'danger');
                    console.log(err);
                });
            }
        },
        update: function (id, name, status, meta = undefined) {
            var controller = baseService.URL_HOST + baseService.module.updateNavigate;
            if (meta === undefined) {
                var obj = {
                    NavID: id,
                    NavName: name,
                    Status: status                                      
                };
            } else {
                var obj = {
                    NavID: id,
                    NavName: name,
                    NavMeta: meta,
                    Status: status                                       
                };
            }
            if(isChanged)
                $scope.event.saveChange();
            baseService.POST(controller, obj).then(function (response) {
                if (response.redirect !== undefined) {
                    $window.location.href = response.redirect;
                } else {                    
                    init();
                    baseService.showToast('Cập nhật thành công!', 'success');
                }
            }, function(err){
                baseService.showToast('Cập nhật thất bại!', 'danger');
                console.log(err);
            });
        },
        delete: function (id, parent, position) {
            $scope.newNavigate = {};
            $scope.newNavigate = {
                NavID: id,
                ParentId: parent,
                Position: position
            };            
            $('#delAlert').modal('show');
        },
        delMenu: function(){
            var controller = baseService.URL_HOST + baseService.module.deleteNavigate; 
            if(isChanged)
                $scope.event.saveChange();
            baseService.POST(controller, $scope.newNavigate).then(function (response) {
                if (response.redirect !== undefined) {
                    $window.location.href = response.redirect;
                } else {                                
                    init();
                    $('#delAlert').modal('hide');
                    baseService.showToast('Xóa thành công!', 'success');
                }
            }, function(err){
                baseService.showToast('Xóa thất bại!', 'danger');
                console.log(err);
            });
        },                
        expandAll: function(){
            $('.dd').nestable('expandAll');
        },
        collapseAll: function(){
            $('.dd').nestable('collapseAll');
        }
    };
});