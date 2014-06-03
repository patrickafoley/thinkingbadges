angular.module('badgeApp').controller 'BadgeController', 
  ['$scope', 
  '$location',
  'BadgeService', 
  ($scope, $location, BadgeService) ->

    $scope.list = ->

      $scope.grid_options = { data: 'badges', columnDefs: [{ 
              field: 'name', displayName: 'Name', width: 90 }, {
              field: 'company', displayName: 'Company', width: 80 },{
              field: 'email', displayName: 'Email' }, {
              field: 'url', displayName: '', cellTemplate: '<div class="ngCellText" ng-class="col.colIndex()"><a data-method="delete" href="javascript:void(0)" ng-click="delete(row)" >Delete</a></div>'}]
      }

      BadgeService.list().then((result) ->
        $scope.badges = result
        badges = result
      )

    $scope.updateQRCode = ->
      @qr.clear()
      vCard = BadgeService.get_badge_vcard($scope.get_badge())
      @qr.makeCode vCard
  
    $scope.print = ->
      if $scope.badge_form.$valid
        window.print()
        BadgeService.create($scope.get_badge()).then(->
          $scope.badge = null
        )
    
    $scope.get_badge = ->
      return {name: $scope.badge.name, company: $scope.badge.company, email: $scope.badge.email }

    $scope.delete = (row) ->
      id = row.getProperty("id")
      BadgeService.delete(id).then(->
        $scope.list()
      )

    $scope.list()
    if $('#qrcode').length > 0 
      $scope.qr = new QRCode(document.getElementById("qrcode"), "woot")


  ]
