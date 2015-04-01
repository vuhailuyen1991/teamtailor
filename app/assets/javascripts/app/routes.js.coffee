teamTailorApp
  .config(['$urlRouterProvider', '$stateProvider', ($urlRouterProvider, $stateProvider) ->
    $stateProvider
      .state 'candidates',
        url: '/candidates'
        templateUrl: 'app/Candidates/Index/CandidatesView.html'
        controller: 'CandidatesController'
      .state 'showCandidate',
        url: '/candidates/:id'
        templateUrl: 'app/Candidates/Show/ShowCandidateView.html'
        controller: 'ShowCandidateController'

    $urlRouterProvider.otherwise '/candidates'

  ])
