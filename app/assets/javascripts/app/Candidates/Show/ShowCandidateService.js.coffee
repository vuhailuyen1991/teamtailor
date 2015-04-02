showCandidateModule.service 'ShowCandidateService', ['$http', '$q'
  ($http, $q) ->

    sendSuccess = (response) ->
      console.log 'sendSuccess', response

    sendFailure = (response) ->
      console.log 'sendFailure', response

    mentionMessage: (message) ->
      window.dispatcher.trigger('mentions.create', message, sendSuccess, sendFailure)

    retrieveCandidate: (id) ->
      $http(@candidateQuery(id))

    retrieveHrStaffs: (id) ->
      $http(@hrStaffsQuery(id))

    hrStaffsQuery: ->
      {
        name: 'hrStaffs.get',
        method: 'GET',
        url: 'api/users'
      }

    candidateQuery: (id) ->
      {
        name: 'candidate.get',
        method: 'GET',
        url: "api/candidates/#{id}"
      }

]
