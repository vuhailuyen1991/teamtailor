showUserModule.service('ShowUserService', ['$http', '$q', 'AuthService',
  ($http, $q, AuthService) ->

    retrieveUser: (userId) ->
      $http(@userQuery(userId))

    updateUser: (user) ->
      $http(@updateUserQuery(user))

    updateUserQuery: (user) ->
      {
        name: 'user.update',
        method: 'PUT',
        url: "api/v1/users/#{user.id}/admin_update",
        data: @retrieveUserData(user)
      }

    retrieveUserData: (user) ->
      {
        password: user.password,
        passwordConfirmation: user.passwordConfirmation
      }

    userQuery: (userId) ->
      {
        name: 'user.get',
        method: 'GET',
        url: "api/v1/users/#{userId}"
      }
])
