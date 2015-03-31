teamTailorApp
  .config(['$urlRouterProvider', '$stateProvider', ($urlRouterProvider, $stateProvider) ->
    $stateProvider
      .state 'candidates',
        url: '/'
        templateUrl: 'app/Candidates/Index/CandidatesView.html'
        controller: 'CandidatesController'

    $urlRouterProvider.otherwise '/'

  ])
