'use strict'

angular.module('app', ['ng']).config([
  '$routeProvider'
  '$locationProvider'

  ($routeProvider, $locationProvider) ->

    $routeProvider
      .when('/404', {templateUrl: '/partials/404.html'})
      .otherwise({redirectTo: '/404'})

    $locationProvider.html5Mode(true)
])