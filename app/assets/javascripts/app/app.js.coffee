window.teamTailorApp = angular.module 'teamTailorApp', ['templates', 'ngRoute', 'ngResource', 'ui.router','smart-table',
                                                        'mentio', 'ui-notification', 'showCandidateModule',
                                                        'candidatesModule']

window.dispatcher = new WebSocketRails('localhost:3003/websocket')
