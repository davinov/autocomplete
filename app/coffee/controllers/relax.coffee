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

    reloadPage = (res) -> $window.location.reload()
    formatResults = (res) -> _.pluck res.data?.rows, 'doc'
    formatResultsAndSave = (res) -> $scope.docs = formatResults(res)

    $http.get("#{config.dbURL}/#{config.dbname}/_all_docs", params: include_docs: true).then(formatResultsAndSave)

    $scope.create = (object) ->
      $http.post("#{config.dbURL}/#{config.dbname}", object).then(reloadPage)

    $scope.remove= (doc, index) ->
      $http.delete("#{config.dbURL}/#{config.dbname}/#{doc._id}", params: {rev: doc._rev}).then(reloadPage)

    $scope.getTechno = (val) ->
      $http.get("#{config.dbURL}/#{config.dbname}/_design/app/_list/matchAndSort/technos",
        params:
          search: val
          include_docs: true
      ).then(formatResults)

])
