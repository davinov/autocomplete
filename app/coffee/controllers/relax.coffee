app.controller('relaxCtrl', [
  '$scope', 'couchdb', '$http', '$route', 'config'
  ($scope, couchdb, $http, $route, config) ->

    $scope.docs = []

    couchdb.findAll.then(
      (res) -> $scope.docs = _.pluck res.data.rows, 'doc'
      (err) -> alert 'Error get Captn'
    )

    $scope.create = (object) ->
      $http.post(config.couchdbURL + config.dbname, object).then(
        (res) -> $scope.docs.push(object)
        (err) -> alert 'Error post Captn'
      )

    $scope.remove= (doc, index) ->
      $http.delete(config.couchdbURL + config.dbname + "/#{doc._id}", params: {rev: doc._rev}).then(
        (res) -> $scope.docs.splice(index, 1)
        (err) -> alert 'Error delete Captn'
      )

    $scope.getLocation = (val) ->
      $http.get("//127.0.0.1:5984/formation/_design/hipster/_list/byInput/docs",
        params:
          input: val
      ).then (res) ->
        _.pluck res.data.rows, 'key'

])
