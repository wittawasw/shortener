links_box.controller('LinksBox',[ '$scope', '$http', 'Link', function($scope, $http, Link) {

  $scope.subject = new Link();
  $scope.subject.link = {};
  $scope.page = 1;

  $scope.get_links = function(page){
    $scope.links = Link.query({'page': page}, function() {
      $scope.page = page;
    });
  };

  $scope.get_links(1);

  $scope.create_link = function(){
    Link.save($scope.subject, function(link, response) {
      $scope.get_links(1);
      $scope.subject = new Link();
      $scope.subject.link = {};
    }); 
  };

}]);