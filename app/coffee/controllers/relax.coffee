app.controller('relaxCtrl', [
  '$scope', '$http', '$window', 'config'
  ($scope, $http, $window, config) ->

    $scope.config = config
    $scope.docs = []
    $scope.isAwesome = (doc) ->
      return ':?' unless doc
      switch doc.awesomeness
        when 1 then ":@"
        when 2 then ":'("
        when 3 then ":/"
        when 8 then ":)"
        when 9 then ":D"
        when 10 then "\\o/"
        else ":|"

    $http.get("#{config.dbURL}/#{config.dbname}/_all_docs", params: include_docs: true).then(
      (res) -> $scope.docs = _.pluck res.data.rows, 'doc'
      (err) -> alert 'Error get Captn'
    )

    $scope.create = (object) ->
      $http.post("#{config.dbURL}/#{config.dbname}", object).then(
        (res) -> $window.location.reload()
        (err) -> alert 'Error post Captn'
      )

    $scope.remove= (doc, index) ->
      $http.delete("#{config.dbURL}/#{config.dbname}/#{doc._id}", params: {rev: doc._rev}).then(
        (res) -> $window.location.reload()
        (err) -> alert 'Error delete Captn'
      )

    $scope.getLocation = (val) ->
      $http.get(config.dbURL + config.dbname + "/_design/app" + "/_list/" + "",
        params:
          input: val
      ).then (res) ->
        _.pluck res.data.rows, 'key'

])
