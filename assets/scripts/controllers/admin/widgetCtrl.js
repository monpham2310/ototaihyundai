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
                for(var i = 0;i < $rootScope.listWidgets.body.length; i++){
                    if($rootScope.listWidgets.body[i].Method === 'wd_visitorStatistic'){
                        var temp = $rootScope.listWidgets.body[i].Content.split(',');
                        $rootScope.listWidgets.body[i].Content = temp;
                    }
                }
            }
            else if(area === 'sidebar'){                
                $rootScope.listWidgets.sidebar = [];
                $rootScope.listWidgets.sidebar = response;
                for(var i = 0;i < $rootScope.listWidgets.sidebar.length; i++){
                    if($rootScope.listWidgets.sidebar[i].Method === 'wd_visitorStatistic'){
                        var temp = $rootScope.listWidgets.sidebar[i].Content.split(',');
                        $rootScope.listWidgets.sidebar[i].Content = temp;
                    }
                }
            }
            else if(area === 'footer'){                
                $rootScope.listWidgets.footer = [];
                $rootScope.listWidgets.footer = response;
                for(var i = 0;i < $rootScope.listWidgets.footer.length; i++){
                    if($rootScope.listWidgets.footer[i].Method === 'wd_visitorStatistic'){
                        var temp = $rootScope.listWidgets.footer[i].Content.split(',');
                        $rootScope.listWidgets.footer[i].Content = temp;
                    }
                }
            }
            else{                
                $rootScope.listWidgets.noArea = [];
                $rootScope.listWidgets.noArea = response;
            }
        });
    };     
    function init(){            
        getWidgets('noArea');
        getWidgets('body');
        getWidgets('sidebar');
        getWidgets('footer');
    };      
    function saveChange(area, list){
        var controller = baseService.URL_HOST + baseService.module.sortableWidget; 
        for(var i = 0; i < list.length; i++){
            list[i].area = area;
            if(list[i].$scope !== undefined)
                delete list[i].$scope;
        }
        baseService.POST(controller, list).then(function(response){
            if(response.redirect !== undefined){
                $window.location.href = response.redirect;   
            }
            else if(response === 'true'){
                $route.reload();                                
                //init();                
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
        console.log(list);
        noAreaIsChanged = true;
    };
    function updateOutputBody(e) {
        var list = e.length ? e : $(e.target);        
        console.log(list);
        bodyIsChanged = true;
    };
    function updateOutputSidebar(e) {
        var list = e.length ? e : $(e.target);        
        console.log(list);
        sidebarIsChanged = true;
    };
    function updateOutputFooter(e) {
        var list = e.length ? e : $(e.target);        
        console.log(list);
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
                listNestableNoArea = $('#nestableWidget').nestable('serialize');                
                saveChange('noArea', listNestableNoArea);
                noAreaIsChanged = false;
            }
            if(bodyIsChanged){
                listNestableBody = $('#nestableBody').nestable('serialize');                
                saveChange('body', listNestableBody);
                bodyIsChanged = false;
            }
            if(sidebarIsChanged){
                listNestableSidebar = $('#nestableSidebar').nestable('serialize');                
                saveChange('sidebar', listNestableSidebar);
                sidebarIsChanged = false;
            }
            if(footerIsChanged){
                listNestableFooter = $('#nestableFooter').nestable('serialize');                
                saveChange('footer', listNestableFooter);
                footerIsChanged = false;
            }
        },
        updateFormVisitCounter: function(obj){
            var temp = '';            
            for(var i = 0; i < obj.Content.length; i++)
                temp += obj.Content[i] + ',';
            obj.Content = temp; 
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