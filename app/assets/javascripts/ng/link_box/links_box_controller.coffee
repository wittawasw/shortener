(->
  LinksBox = ($scope, $http, Link) ->
    $scope.subject = new Link
    $scope.subject.link = {}
    $scope.page = 1

    $scope.get_links = (page) ->
      $scope.links = Link.query({ 'page': page }, ->
        $scope.page = page
        return
      )
      return

    $scope.get_links 1

    $scope.create_link = ->
      Link.save $scope.subject, (link, response) ->
        $scope.get_links 1
        $scope.subject = new Link
        $scope.subject.link = {}
        return
      return

    return

  angular
    .module('links-box')
    .controller('LinksBox', LinksBox)
)()