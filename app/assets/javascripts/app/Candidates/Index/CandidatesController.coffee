candidatesModule.controller 'CandidatesController', [ '$scope', '$state', 'CandidatesService',
  ($scope, $state, CandidatesService) ->
    $scope.candidates = []
    CandidatesService.retrieveCandidates().then ((result) =>
        $scope.candidates = result.data
        $scope.candidatesDisplay = [].concat($scope.users)
      )

    $scope.goToCandidate = (candidate)->
      $state.go 'showCandidate', { id: candidate.id }

]
