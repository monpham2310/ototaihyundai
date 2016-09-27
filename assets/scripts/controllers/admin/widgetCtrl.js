angular.module('ototaihyundaiApp').controller('widgetCtrl', function($scope, $rootScope, $window, $route, baseService){
    $rootScope.currentPage = {
        parent: 'Widgets',
        child: '',
        class: 'fa fa-flask'
    };      
    $scope.newWidget = {};   
    $scope.areas = [
        {value: 'noArea', text: 'Trống'},
        {value: 'body', text: 'Body'},
        {value: 'sidebar', text: 'Sidebar'},
        {value: 'footer', text: 'Footer'},
    ];
    $scope.label = {
        title: ''  
    };
    var listNestableBody = [];
    var listNestableSidebar = [];
    var listNestableFooter = [];
    var listNestableNoArea = [];
    var noAreaIsChanged = false;
    var bodyIsChanged = false;
    var sidebarIsChanged = false;
    var footerIsChanged = false;
    $('.collapse-link:not(.binded)').addClass("binded").click(function () { 
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        var content = ibox.find('div.ibox-content');
        content.slideToggle(200);
        button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
        ibox.find('div.tile-header').toggleClass('').toggleClass('border-bottom');
        setTimeout(function () {
            ibox.resize();
            ibox.find('[id^=map-]').resize();
        }, 50);
    });
    function getWidgets(area){
        var controller = baseService.URL_HOST + baseService.module.getAllWidgets;
        var param = {type: 'admin', area: area};
        baseService.POST(controller, param).then(function(response){            
            if(area === 'body'){
                $rootScope.listWidgets.body = [];
                $rootScope.listWidgets.body = response;
            }
            else if(area === 'sidebar'){
                $rootScope.listWidgets.sidebar = [];
                $rootScope.listWidgets.sidebar = response;
            }
            else if(area === 'footer'){
                $rootScope.listWidgets.footer = [];
                $rootScope.listWidgets.footer = response;
            }
            else{
                $rootScope.listWidgets.noArea = [];
                $rootScope.listWidgets.noArea = response;
            }
        });
    }; 
    function getInformation(){
        var controller = baseService.URL_HOST + baseService.module.getInformation;  
        var param = {type: 'admin'};
        baseService.POST(controller, param).then(function(response){
            $rootScope.widgets.information = response[0];
        });
    };
    function init(){                
        getWidgets('noArea');
        getWidgets('body');
        getWidgets('sidebar');
        getWidgets('footer');
    };  
    function serialize(list){
        var output = [];
        if ($window.JSON) {
            var json = $window.JSON.stringify(list.nestable('serialize'), function(key, val) {
               if (typeof val == "object") {
                    if (output.length > 0)
                        return;
                    output.push(val);
                }
                return val;
            });
            for(var i = 0; i < output[0].length; i++){
                if(output[0][i].$scope !== undefined){
                    delete output[0][i].$scope;
                }
            }            
            console.log(output[0]);            
        } 
        return output[0];
    };
    function saveChange(area, list){
        var controller = baseService.URL_HOST + baseService.module.sortableWidget; 
        for(var i = 0; i < list.length; i++){
            list[i].area = area;
        }
        baseService.POST(controller, list).then(function(response){
            if(response.redirect !== undefined){
                $window.location.href = response.redirect;   
            }
            else if(response === 'true'){
                $route.reload();                
                baseService.showToast('Cập nhật thành công!', 'success');
            }
            else{
                baseService.showToast('Cập nhật thất bại!', 'danger');
            }
        }, function(err){
            baseService.showToast('Cập nhật thất bại!', 'danger');
            console.log(err);
        });
    };
    function updateOutputNoArea(e) {
        var list = e.length ? e : $(e.target);
        listNestableNoArea = serialize(list);
        console.log(listNestableNoArea);
        noAreaIsChanged = true;
    };
    function updateOutputBody(e) {
        var list = e.length ? e : $(e.target);
        listNestableBody = serialize(list);
        console.log(listNestableBody);
        bodyIsChanged = true;
    };
    function updateOutputSidebar(e) {
        var list = e.length ? e : $(e.target);
        listNestableSidebar = serialize(list);
        console.log(listNestableSidebar);
        sidebarIsChanged = true;
    };
    function updateOutputFooter(e) {
        var list = e.length ? e : $(e.target);
        listNestableFooter = serialize(list);
        console.log(listNestableFooter);
        footerIsChanged = true;
    };
    $('#nestableWidget').nestable({
        maxDepth: 1,
        group: 1
    }).on('change', updateOutputNoArea);
    $('#nestableBody').nestable({
        maxDepth: 1,
        group: 1
    }).on('change', updateOutputBody);
    $('#nestableSidebar').nestable({
        maxDepth: 1,
        group: 1
    }).on('change', updateOutputSidebar);
    $('#nestableFooter').nestable({
        maxDepth: 1,
        group: 1
    }).on('change', updateOutputFooter);        
    function getHeader(){
        var controller = baseService.URL_HOST + baseService.module.getHeader;          
        baseService.GET(controller).then(function(response){
            $rootScope.widgets.header = response[0];
        });
    };       
    getHeader();
    init();
    getInformation();
    $rootScope.getAllCategories();    
    $scope.event = {         
        add: function(){
            $scope.newWidget = {};
            $scope.newWidget = {
                Area: 'noArea',                
                Status: '1'
            };
            $scope.label.title = 'Add Widget'
        },
        delete: function(item){            
            $scope.newWidget = {};
            $scope.newWidget = item;
            $('#delAlert').modal('show');
        },
        save: function(){
            if(noAreaIsChanged){
                saveChange('noArea', listNestableNoArea);
                noAreaIsChanged = false;
            }
            if(bodyIsChanged){
                saveChange('body', listNestableBody);
                bodyIsChanged = false;
            }
            if(sidebarIsChanged){
                saveChange('sidebar', listNestableSidebar);
                sidebarIsChanged = false;
            }
            if(footerIsChanged){
                saveChange('footer', listNestableFooter);
                footerIsChanged = false;
            }
        },
        updateForm: function(obj, isUpdate){
            if(isUpdate){
                var controller = baseService.URL_HOST + baseService.module.updateWidget;
                baseService.POST(controller, obj).then(function(response){
                    if(response.redirect !== undefined){
                        $window.location.href = response.redirect;   
                    }
                    else if(response === 'true'){
                        init();
                        baseService.showToast('Cập nhật thành công!', 'success');
                    }
                    else{
                        baseService.showToast('Cập nhật thất bại!', 'danger');
                    }
                }, function(err){
                    baseService.showToast('Cập nhật thất bại!', 'danger');
                    console.log(err);
                });
            }
            else{
                var controller = baseService.URL_HOST + baseService.module.addWidget;
                baseService.POST(controller, $scope.newWidget).then(function(response){
                    if(response.redirect !== undefined){
                        $window.location.href = response.redirect;   
                    }
                    else if(response === 'true'){
                        init();
                        $('#widgetModal').modal('hide');
                        baseService.showToast('Thêm thành công!', 'success');
                    }
                    else{
                        baseService.showToast('Thêm thất bại!', 'danger');
                    }
                }, function(err){
                    baseService.showToast('Thêm thất bại!', 'danger');
                    console.log(err);
                });
            }
        },  
        delWidget: function(){
            var controller = baseService.URL_HOST + baseService.module.delWidget;
            var param = {ID: $scope.newWidget.ID};
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
            });  
        },
        updateHeader: function(){            
            var controller = baseService.URL_HOST + baseService.module.updateHeader;
            baseService.POST(controller, $rootScope.widgets.header).then(function(response){
                if(response.redirect !== undefined){
                    $window.location.href = response.redirect;   
                }
                else if(response === 'true'){
                    getHeader(); 
                    baseService.showToast('Cập nhật thành công!', 'success');
                }
                else{
                    baseService.showToast('Cập nhật thất bại!', 'danger');
                }
            }, function(err){
                baseService.showToast('Cập nhật thất bại!', 'danger');
                console.log(err);
            });
        },
        updateInform: function(){            
            var controller = baseService.URL_HOST + baseService.module.updateInform;
            baseService.POST(controller, $rootScope.widgets.information).then(function(response){
                if(response.redirect !== undefined){
                    $window.location.href = response.redirect;   
                }
                else if(response === 'true'){
                    getInformation(); 
                    baseService.showToast('Cập nhật thành công!', 'success');
                }
                else{
                    baseService.showToast('Cập nhật thất bại!', 'danger');
                }
            }, function(err){
                baseService.showToast('Cập nhật thất bại!', 'danger');
                console.log(err);
            });
        },
        browserImg: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#img').attr('src',url);                    
                    $rootScope.widgets.header.Logo = newUrl;
                }                
            });
        },
        browserImgBanner: function(){
            CKFinder.popup({
                chooseFiles: true,  
                selectActionFunction: function(url){
                    var newUrl = baseService.getImageUrl(url);
                    $('#img-banner').attr('src',url);                    
                    $rootScope.widgets.header.Banner = newUrl;
                }                
            });
        },
        collapse: function (id) {               
            $('#bt-' + id).find('i').toggleClass('fa-caret-down').toggleClass('fa-caret-up');
            $('#form-' + id).slideToggle(200);
        }
    };
});