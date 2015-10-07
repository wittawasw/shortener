angular
  .module('shortener')
  .factory 'Link', ($resource) ->
    $resource '/api/v1/links/:id'