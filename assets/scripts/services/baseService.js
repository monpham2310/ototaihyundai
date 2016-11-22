angular.module('ototaihyundaiApp').factory('baseService', function($http, $q, $window, Flash){   
        
    return angular.extend($http, {
        URL_HOST: window.location.origin + '/ototaihyundai/',        
        WebsiteName: ' | OTO TAI HYUNDAI',        
        module: {                        
            login: 'admin/Usercontroller/actionLogin',
            logout: 'admin/Usercontroller/actionLogout',
            user: 'admin/Usercontroller/getCurrentUser',
            destroySession: 'admin/Usercontroller/destroySession',
            dashboardStatistic: 'admin/Dashboardcontroller/dashboardStatistic',            
            allUsers: 'admin/Usercontroller/loadUsers',
            updateUser: 'admin/Usercontroller/updateUser',
            delUser: 'admin/Usercontroller/deleteUser',
            addUser: 'admin/Usercontroller/addUser',
            checkEmail: 'admin/Usercontroller/checkEmail',
            listPages: 'admin/Templatecontroller/getPages',
            getTemplates: 'admin/Templatecontroller/getAllTemplates',
            updateTemplate: 'admin/Templatecontroller/updateTemplate',
            addTemplate: 'admin/Templatecontroller/addTemplate',
            delTemplate: 'admin/Templatecontroller/deleteTemplate',
            categories: 'admin/Categorycontroller/loadCategories',
            proCategories: 'admin/Categorycontroller/loadProCategories',
            allCategories: 'admin/Categorycontroller/loadAllCategories',
            updateCate: 'admin/Categorycontroller/updateCategory',
            addCate: 'admin/Categorycontroller/addCategory',
            delCate: 'admin/Categorycontroller/deleteCategory',            
            articles: 'admin/Articlecontroller/loadArticles',
            allArticles: 'admin/Articlecontroller/loadAllArticles',
            updateArt: 'admin/Articlecontroller/updateArticle',
            editArticle: 'admin/Articlecontroller/editArticle',
            addArt: 'admin/Articlecontroller/addArticle',
            delArt: 'admin/Articlecontroller/deleteArticle',
            addNavigatesList: 'admin/Navigatecontroller/addNavigatesList',
            addCustomNavigate: 'admin/Navigatecontroller/addCustomNavigate',
            updateNavigate: 'admin/Navigatecontroller/updateNavigate',
            deleteNavigate: 'admin/Navigatecontroller/deleteNavigate',
            getNavigates: 'admin/Navigatecontroller/getNavigates',
            changePosition: 'admin/Navigatecontroller/changePosition',
            getInformation: 'admin/Widgetcontroller/getInformation',
            getHeader: 'admin/Widgetcontroller/getHeader',
            updateHeader: 'admin/Widgetcontroller/updateHeader',
            updateInform: 'admin/Widgetcontroller/updateInform',
            updateWidget: 'admin/Widgetcontroller/updateWidget',
            addWidget: 'admin/Widgetcontroller/addWidget',
            delWidget: 'admin/Widgetcontroller/delWidget',
            getAllWidgets: 'admin/Widgetcontroller/getAllWidgets',
            getWidgets: 'admin/Widgetcontroller/getWidgets',
            sortableWidget: 'admin/Widgetcontroller/sortableWidget',
            getMapList: 'admin/Mapcontroller/getMapList',
            updateMarker: 'admin/Mapcontroller/updateMarker',
            addNewMarker: 'admin/Mapcontroller/addNewMarker',
            deleteMarker: 'admin/Mapcontroller/deleteMarker',
            getSlides: 'admin/Slidecontroller/getSlides',
            updateSlide: 'admin/Slidecontroller/updateSlide',
            addSlide: 'admin/Slidecontroller/addSlide',
            deleteSlide: 'admin/Slidecontroller/deleteSlide',
            getClients: 'admin/Clientcontroller/getClients',
            updateClient: 'admin/Clientcontroller/updateClient',
            addClient: 'admin/Clientcontroller/addClient',
            deleteClient: 'admin/Clientcontroller/deleteClient',
            getServices: 'admin/Servicecontroller/getServices',
            updateService: 'admin/Servicecontroller/updateService',
            addService: 'admin/Servicecontroller/addService',
            deleteService: 'admin/Servicecontroller/deleteService',
            getMailList: 'admin/Mailcontactcontroller/getMailList',
            deleteMail: 'admin/Mailcontactcontroller/deleteMail',            
            addNewVisitor: 'admin/Visitorcontroller/addNew',            
            getCateOrProCate: 'admin/Categorycontroller/getCateOrProCate',            
            viewArtOrPro: 'admin/Articlecontroller/viewArtOrPro',                        
            sendContact: 'admin/Mailcontactcontroller/addMail',
            search: 'Indexcontroller/search',
            getResourceType: 'admin/Resourcecontroller/getResourceType',
            getResourceCate: 'admin/Resourcecontroller/getResourceCate',
            getResources: 'admin/Resourcecontroller/getResources',
            addResource: 'admin/Resourcecontroller/addResource',
            updateResource: 'admin/Resourcecontroller/updateResource',
            delResource: 'admin/Resourcecontroller/delResource',
            addResourceCat: 'admin/Resourcecontroller/addResourceCat',
            updateResourceCat: 'admin/Resourcecontroller/updateResourceCat',
            delResourceCat: 'admin/Resourcecontroller/delResourceCat'            
        },        
        ckeditorOptions: {
            language: 'vi',
            skin: 'office2013',
            allowedContent: true,
            entities: false,
            height: 500
        },
        ckeditorOptions2: {
            language: 'vi',
            skin: 'office2013',
            allowedContent: true,
            entities: false,
            height: 300
        },
        showToast: function(msg, classType){
            var message = '<strong> Thông báo!</strong><br/> ' + msg;
            var id = Flash.create(classType, message, 5000, {class: 'custom-flash', id: 'custom-id'}, true);
        },
        showToast2: function(msg, classType, title){
            var message = '<strong> '+ title +'!</strong><br/> ' + msg;
            var id = Flash.create(classType, message, 5000, {class: 'custom-flash', id: 'custom-id'}, true);
        },
        getAlias: function(str){ 
            if(str !== undefined){
                str= str.toLowerCase();
                str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");
                str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");
                str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");
                str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");
                str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");
                str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");
                str= str.replace(/đ/g,"d");
                str= str.replace(/!|@|\$|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\'| |\"|\&|\#|\[|\]|~/g,"-");
                str= str.replace(/-+-/g,"-"); /*thay thế 2- thành 1-*/
                str= str.replace(/^\-+|\-+$/g,"");/*cắt bỏ ký tự - ở đầu và cuối chuỗi*/
            }
            else{
                str = '';
            }
            return str;
        },
        getDatetimeNow: function(){
            var currentdate = new Date(); 
            var datetime =  currentdate.getFullYear() + "-"
                            + (currentdate.getMonth()+1)  + "-" 
                            + currentdate.getDate() + " "  
                            + currentdate.getHours() + ":"  
                            + currentdate.getMinutes() + ":" 
                            + currentdate.getSeconds();
            
            return datetime;
        },
        GET: function(controller){
            var result = $q.defer();
            $http.get(controller).then(function (response){
                result.resolve(response.data); 
            }, result.reject.bind(null));
            
            return result.promise;
        },
        POST: function(controller, param){
            var result = $q.defer();
            var arg = { 
                data: param
            };
            $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';                        
            $http({
                method: 'POST',
                url: controller,
                data: $.param(arg)   
            }).then(function(response){
                result.resolve(response.data);
            }, result.reject.bind(null));
                        
            return result.promise;
        },
        POSTDATA: function(controller, param){
            var result = $q.defer();
            var arg = {
                data: param  
            };
            $http.defaults.headers.post['Content-Type'] = undefined;
            $http({
                method: 'POST',
                url: controller,
                data: arg
            }).then(function(response){
                result.resolve(response.data); 
            }, result.reject.bind(null));
            
            return result.promise;
        },
        getImageUrl: function(url){
            var newUrl = url.substr(url.indexOf('assets'));
            return newUrl;
        },
        GetNotAsync: function(controller){
            var result = $q.defer();
            $http({
                method: 'GET',
                url: controller,
                async: false
            }).then(function (response){
                result.resolve(response.data); 
                //console.log(response.data);
            }, result.reject.bind(null));
            
            return result.promise;
        },
        getCoordinateOnGoogleMap: function(address){
            var result = $q.defer();
            $http.get('http://maps.google.com/maps/api/geocode/json?address=' + address + '&sensor=false').then(function(response){
                if(response.data.results.length > 0)
                    result.resolve(response.data.results[0].geometry.location);
                else
                    console.log('Không có kết quả');
            }, result.reject.bind(null));
            
            return result.promise;
        }
    });
});