app.factory('couchdb', [
  '$http', 'config'
  ($http, config) ->

    findAll: $http.get(config.couchdbURL + config.dbname + '/_all_docs', params: include_docs: true)

])
