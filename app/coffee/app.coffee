'use strict'

angular.module('app', ['ng', 'partials']).config([
  '$routeProvider', '$locationProvider'
  ($routeProvider, $locationProvider) ->

    $routeProvider
    .when('/', templateUrl: '/partials/home.html')
    .when('/404', templateUrl: '/partials/404.html')
    .otherwise(redirectTo: '/404')

    $locationProvider.html5Mode(true)

])
