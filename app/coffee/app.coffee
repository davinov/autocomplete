'use strict'

app = angular.module('autocomplete', ['ng', 'ngRoute', 'ngAnimate', 'ui.bootstrap', 'partials'])

app.config([
  '$routeProvider', '$locationProvider', '$httpProvider'
  ($routeProvider, $locationProvider, $httpProvider) ->

    $routeProvider
      .when('/', templateUrl: '/partials/slides.html', controller: 'slidesCtrl')
      .when('/404', templateUrl: '/partials/404.html')
      .otherwise(redirectTo: '/404')

    # Beautify Urls: remove hashbang #! before routes
    $locationProvider.html5Mode true

    # Allow cross-domain http requests
    delete $httpProvider.defaults.headers.common['X-Requested-With']

])
