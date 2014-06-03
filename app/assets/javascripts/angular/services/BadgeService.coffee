

angular.module('badgeApp.services').factory('BadgeService', [
  '$resource'
  '$rootScope'
  ($resource, $scope) ->

    service = $resource '/badges/:id', {},
      'create':
        method: 'POST'
      'list':
        method: 'GET'
        isArray: true
      'show':
        method: 'GET'
      'delete'
        method: 'DELETE'


    get_badge_vcard: (badge) => 
      "BEGIN:VCARD\nVERSION:4.0\nFN: " + badge.name + "\nORG: " + badge.company + "\nEMAIL: " + badge.email + "\nEND:VCARD"

    create: (new_badge) =>
      promise = service.create(new_badge).$promise
      promise

    list: () ->
      promise =service.list().$promise
      promise

    show: (badge_id) ->
      promise = service.show(id: badge_id).$promise
      promise.then((result) ->
        console.log "showing #{result}"
      )
      promise

    delete:(badge_id) ->
      promise = service.delete({id: badge_id}).$promise
      promise 

])


