app.controller('slidesCtrl', [
  '$scope'
  ($scope) ->

    $scope.templateIndex = 0

    $scope.templates = [
      { url: "/partials/1.html", name: "Allo", color: "page-1" }
      { url: "/partials/2.html", name: "zaeez", color: "page-2" }
    ]

    $scope.template = $scope.templates[$scope.templateIndex]

    update = ->
      $scope.template = $scope.templates[$scope.templateIndex]
      $scope.$apply()

    keypress.combo "right", (-> $scope.templateIndex++;update())
    keypress.combo "left", (-> $scope.templateIndex--;update())
])
