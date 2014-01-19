app.controller('slidesCtrl', [
  '$scope'
  ($scope) ->

    $scope.slides = []

    for num in [1..2]
      $scope.slides.push("/partials/#{num}.html")

    $scope.keypressCallback = -> console.log arguments

])
