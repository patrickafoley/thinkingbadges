'use strict'



angular.module('badgeApp.services', [
  'ngRoute'
  'ngAnimate'
  'ngResource'
  'ng-rails-csrf'
  'ngGrid'
])


angular.module('badgeApp', [
  'ngRoute'
  'ngGrid'
  'badgeApp.services'
])
