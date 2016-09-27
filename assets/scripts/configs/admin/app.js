'use strict';

angular.module('ototaihyundaiApp', ['ngRoute', 'ckeditor', 'ngSanitize', 'angular-md5', 'ngFlash', 'ui.bootstrap.datetimepicker', 'angularUtils.directives.dirPagination', 'checklist-model', 'ngMap']);

angular.element(document).ready(function (){   
    angular.bootstrap(document.documentElement, ['ototaihyundaiApp']);
});