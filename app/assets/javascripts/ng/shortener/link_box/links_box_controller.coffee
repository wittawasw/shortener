(->
  LinksBox = ($scope, $http, Link) ->
    @subject = new Link
    @subject.link = {}
    $scope.page = 1

    $scope.get_links = (page) ->
      $scope.links = Link.query({ 'page': page }, ->
        $scope.page = page
        return
      )
      return

    $scope.get_links 1

    $scope.create_link = ->
      Link.save @subject, (link, response) ->
        $scope.get_links 1
        @subject = new Link
        @subject.link = {}
        return
      return

    return

  angular
    .module('links-box')
    .controller('LinksBox', LinksBox)
)()