app.controller('relaxCtrl', [
  '$scope', '$http', '$window', 'config', 'Techno'
  ($scope, $http, $window, config, Techno) ->

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

    reloadPage = (res) -> $window.location.reload()

    $scope.docs = Techno.list
      _id: '_all_docs'

    $scope.create = (object) ->
      Techno.create({}, object).$promise.then reloadPage

    $scope.remove= (doc) ->
      Techno.delete( {_id: doc._id, rev: doc._rev}, doc).$promise.then reloadPage

    $scope.getTechno = (val)->
      Techno.search( {search: val} ).$promise

])

app.factory('Techno', [
  '$resource', 'config'
  ($resource, config) ->
    baseUrl = "#{config.dbURL}/#{config.dbname}"
    $resource baseUrl+"/:_id", {},
      list:
        method: 'GET'
        params:
          include_docs: true
        isArray: true
        transformResponse: formatResponse
      create:
        method: 'POST'
      delete:
        method: 'DELETE'
      search:
        method: 'GET'
        url: baseUrl+"/_design/app/_list/matchAndSort/technos"
        params:
          include_docs: true
        isArray: true
        transformResponse: formatResponse
])

formatResponse = (data) ->
  _.pluck JSON.parse(data).rows, 'doc'
