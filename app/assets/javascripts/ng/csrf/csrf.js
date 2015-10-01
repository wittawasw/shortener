angular.module('ngCsrf', [] ).config(['$httpProvider', function($httpProvider) {
    var getToken = function() {
        var el = document.querySelector('meta[name="csrf-token"]');
        el = el.getAttribute('content');
        return el;
    };
    var updateToken = function() {
        var headers = $httpProvider.defaults.headers.common, token = getToken();
        if (token) {
            headers['X-CSRF-TOKEN'] = getToken;
        }
    };
    updateToken();
}]);