ngMeteor.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) ->

	$urlRouterProvider.otherwise '/menu/notes/latest'

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

		# posts

		.state 'menu.posts',
			url: '/posts'
			abstract: true
			template: getTemplate 'postsTabs'
			controller: 'postsCtrl'
			auth: true

		.state 'menu.posts.all',
			url: '/all'
			views:
				'all':
					template: getTemplate 'posts'
			auth: true

		.state 'menu.messages',
			url: '/messages'
			template: getTemplate 'messages'
			controller: 'messagesCtrl'
			auth: true

		# notes

		.state 'menu.notes',
			url: '/notes'
			abstract: true
			template: getTemplate 'notesTabs'
			controller: 'notesCtrl'
			auth: true

		.state 'menu.notes.latest',
			url: '/latest'
			views:
				'latest':
					template: getTemplate 'latestNotes'
			auth: true

		.state 'menu.notes.important',
			url: '/important'
			views:
				'important':
					template: getTemplate 'importantNotes'
			auth: true

		.state 'menu.notes.sticky',
			url: '/sticky'
			views:
				'sticky':
					template: getTemplate 'stickyNotes'
			auth: true

		.state 'menu.notes.view',
			url: '/view/:_id'
			views:
				'view':
					template: getTemplate 'viewNote'
					controller: 'viewNoteCtrl'
			auth: true

		# todos

		.state 'menu.todos',
			url: '/todos'
			template: getTemplate 'todos'
			controller: 'todosCtrl'
			auth: true

		.state 'menu.profile',
			url: '/profile'
			template: getTemplate 'profile'
			controller: 'profileCtrl'
			auth: true
]

ngMeteor.run ['$rootScope', '$state', ($rootScope, $state) ->
	if Meteor.userId()
		$state.go 'menu.notes.latest'
	$rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
		unless toState.name is 'signin' or toState.name is 'signup'
			unless toState.auth and Meteor.userId()
				$state.go 'signin'
				event.preventDefault()
]
