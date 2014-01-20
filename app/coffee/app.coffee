'use strict'

app = angular.module('autocomplete', ['ng', 'ngRoute', 'ui.bootstrap', 'partials'])

app.config([
  '$routeProvider', '$locationProvider', '$httpProvider'
  ($routeProvider, $locationProvider, $httpProvider) ->

    $routeProvider
      .when('/', templateUrl: '/partials/relax.html', controller: 'relaxCtrl')
      .otherwise(redirectTo: '/')

    # Beautify Urls: remove hashbang #! before routes
    $locationProvider.html5Mode true

    # Allow cross-domain http requests
    # delete $httpProvider.defaults.headers.common['X-Requested-With']

])
