angular.module('ototaihyundaiApp').directive('compileHtml', function ($compile, $sce) {
    return {
        restrict: 'A',
        replace: true,
        link: function (scope, ele, attrs) {
            scope.$watch(attrs.compileHtml, function (html) {
                ele.html(html);
                $compile(ele.contents())(scope);
            });
        }
    };
});
angular.module('ototaihyundaiApp').directive('lightBox', function() {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
                console.log("lightbox directive");
                console.log("lightbox function");
                var img = $('a.example-image-link').find('img');
                /* set image url attribute */                 
                element.attr("href", scope.artOrPro.Image);
                $(element).Chocolat();
                $('a.example-image-link').Chocolat();
                $(function() {
                    $('a.example-image-link').Chocolat();
                    /*alert($('.moments-bottom '));*/
                });
          }
    }
});
angular.module('ototaihyundaiApp').directive('dynFbCommentBox', function () {
    function createHTML(href, numposts, colorscheme, width) {
        return '<div class="fb-comments" ' +
                       'data-href="' + href + '" ' +
                       'data-numposts="' + numposts + '" ' +
                       'data-colorsheme="' + colorscheme + '" ' +
                        'data-width="100%">' +
               '</div>';
    }

    return {
        restrict: 'A',
        scope: {},
        link: function postLink(scope, elem, attrs) {
            attrs.$observe('pageHref', function (newValue) {
                var href        = newValue;
                var numposts    = attrs.numposts    || 5;
                var colorscheme = attrs.colorscheme || 'light';

                elem.html(createHTML(href, numposts, colorscheme));
                FB.XFBML.parse(elem[0]);
            });
        }
    };
});