candidatesModule.service('CandidatesService', ['$http', '$q',
  ($http, $q) ->

    retrieveCandidates: ->
      $http(@candidatesQuery())

    candidatesQuery: ->
      {
        name: 'candidates.all'
        method: 'GET',
        url: 'api/candidates'
      }

])
