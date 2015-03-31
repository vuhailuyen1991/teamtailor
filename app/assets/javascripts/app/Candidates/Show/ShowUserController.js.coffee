showUserModule.controller 'ShowUserController', [ '$scope', '$state', '$stateParams', 'ShowUserService', 'UsersService'
  ($scope, $state, $stateParams, ShowUserService, UsersService) ->
    $scope.user = {}
    $scope.updateSuccess = false
    $scope.updateFailed = false
    $scope.showUserStatus = false
    $scope.failedMessage = ''

    ShowUserService.retrieveUser($stateParams.userId).then ((result) =>
      $scope.$emit('User:Get:Sucsess', result.data)
    ), ((reason) =>
      $scope.$emit('User:Get:Failed', result.data)
    )

    $scope.$on('User:Update:Sucsess', (event, data)->
      $scope.updateSuccess = true
      $scope.updateFailed = false
      $scope.failedMessage = ''
      )

    $scope.$on('User:Update:Failed', (event, reason)->
      $scope.failedMessage = reason.data.message
      $scope.updateSuccess = false
      $scope.updateFailed = true
      )

    $scope.$on('User:Get:Sucsess', (event, data)->
      $scope.user = data
      $scope.showUserStatus = true
      )

    $scope.$on('User:Get:Failed', (event, data)->
      )

    $scope.$on('User:Deactive:Sucsess', (event, data)->
      $state.reload()
    )

    $scope.$on('User:Active:Sucsess', (event, data)->
      $state.reload()
    )

    $scope.updateUser = ->
      ShowUserService.updateUser($scope.user).then ((result) =>
          $scope.$emit('User:Update:Sucsess', result.data)
        ), ((reason) =>
          $scope.$emit('User:Update:Failed', reason)
        )
    $scope.deactive = (user)->
      UsersService.deactive(user).then((result) =>
          $scope.$emit('User:Deactive:Sucsess', result.data)
        )

    $scope.active = (user)->
      UsersService.active(user).then((result) =>
          $scope.$emit('User:Active:Sucsess', result.data)
        )
]
