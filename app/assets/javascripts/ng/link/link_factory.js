angular.module('shortener').factory('Link', function($resource) {
  return $resource('/api/v1/links/:id');
});