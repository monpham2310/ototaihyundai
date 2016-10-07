'use strict';

angular.module('ototaihyundaiApp', ['ngRoute', 'ngSanitize', 'ngFlash', 'angularUtils.directives.dirPagination', 'ngMap', 'ui.bootstrap']);

angular.element(document).ready(function (){   
    angular.bootstrap(document.documentElement, ['ototaihyundaiApp']);
});