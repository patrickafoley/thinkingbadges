# defining all routes
angular.module('badgeApp').config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/login',
      templateUrl: '/assets/login.html',
      controller: 'LoginController'

    .when '/list',
      templateUrl: '/assets/list.html',
      controller: 'BadgeController'

    .when '/create',
      templateUrl: '/assets/create.html',
      controller: 'BadgeController'

    .otherwise
      redirectTo: '/create'


]