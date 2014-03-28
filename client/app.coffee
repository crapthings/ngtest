ngMeteor.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) ->

	$urlRouterProvider.otherwise '/menu/notes'

	$locationProvider.html5Mode true

	$stateProvider

		.state 'signin',
			url: '/signin'
			template: getTemplate 'signin'
			controller: 'signinCtrl'
			auth: false

		.state 'signup',
			url: '/signup'
			template: getTemplate 'signup'
			controller: 'signupCtrl'
			auth: false

		.state 'menu',
			url: '/menu'
			abstract: true
			template: getTemplate 'menu'
			controller: 'menuCtrl'
			auth: true

		.state 'menu.notes',
			url: '/notes'
			template: getTemplate 'notes'
			controller: 'notesCtrl'
			auth: true

		.state 'menu.todos',
			url: '/todos'
			template: getTemplate 'todos'
			controller: 'todosCtrl'
			auth: true
]

ngMeteor.run ['$rootScope', '$state', ($rootScope, $state) ->
	$rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
		if (toState.name is 'signin') or (toState.name is 'signup')
			Deps.autorun ->
				if Meteor.user()
					$state.go 'menu.notes'
					event.preventDefault()
		else
			unless toState.auth and Meteor.user()
				$state.go 'signin'
				event.preventDefault()
]
