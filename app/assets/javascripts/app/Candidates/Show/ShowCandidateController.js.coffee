showCandidateModule.controller 'ShowCandidateController', [ '$scope', '$state', '$stateParams', 'ShowCandidateService',
                                                            'Notification'
  ($scope, $state, $stateParams, ShowCandidateService, Notification) ->
    $scope.candidate = {}
    $scope.hr = {}
    $scope.selectedHr = null
    window.dispatcher.bind 'mentions.create_success', (data) ->
      $scope.createMentionSuccess(data)
      return


    ShowCandidateService.retrieveCandidate($stateParams.id).then ((result) =>
      $scope.$emit('Candidate:Get:Sucsess', result.data)
    ), ((reason) =>
      $scope.$emit('Candidate:Get:Failed', result.data)
    )

    ShowCandidateService.retrieveHrStaffs().then ((result) =>
      $scope.$emit('Hr:Get:Sucsess', result.data)
    ), ((reason) =>
      $scope.$emit('Hr:Get:Failed', result.data)
    )

    $scope.$on('Candidate:Get:Sucsess', (event, data)->
      $scope.candidate = data
      )

    $scope.$on('Hr:Get:Sucsess', (event, data)->
      $scope.hr = data
      )

    $scope.$on('Candidate:Get:Failed', (event, data)->
      )

    $scope.createMentionSuccess = (data)->
      Notification({message: data.message, title: "#{data.sender} mentioned you in a comment."})

    $scope.sendMessage = ->
      if $scope.mentionMessage and $scope.selectedHr
        message = {
          candidate_id: $scope.candidate.id,
          receiver: $scope.selectedHr.username,
          sender: 'team.tailor',
          message: $scope.mentionMessage
        }
        ShowCandidateService.mentionMessage message

    $scope.selectHr = (item)->
      $scope.selectedHr = item
      item.label

]
