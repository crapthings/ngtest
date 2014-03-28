angular.module 'app', []

ngMeteor.config ($stateProvider, $urlRouterProvider) ->

	$urlRouterProvider.otherwise '/signin'

	$stateProvider

		.state 'signin',
			url: '/signin'
			template: getTemplate 'signin'
			controller: 'signinCtrl'

		.state 'signup',
			url: '/signup'
			template: getTemplate 'signup'
			controller: 'signupCtrl'

		.state 'leftMenu',
			url: '/leftmenu'
			abstract: true
			template: getTemplate 'leftMenu'
			controller: 'notesCtrl'

		.state 'leftMenu.notes',
			url: '/notes'
			template: getTemplate 'notes'
