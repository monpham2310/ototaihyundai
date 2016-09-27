'use strict';

angular.module('monApp', ['ngRoute', 'ngSanitize', 'ngFlash', 'angularUtils.directives.dirPagination', 'ngMap', 'ui.bootstrap', 'angular-scroll-animate']);

angular.element(document).ready(function (){   
    angular.bootstrap(document.documentElement, ['ototaihyundaiApp']);
});