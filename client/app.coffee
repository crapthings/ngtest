@app = angular.module 'app', []

ngMeteor.config ($stateProvider, $urlRouterProvider) ->

	$urlRouterProvider.otherwise '/leftmenu/notes'

	$stateProvider

		.state 'leftMenu',
			url: '/leftmenu'
			abstract: true
			template: Template.leftMenu
			controller: 'notesCtrl'

		.state 'leftMenu.notes',
			url: '/notes'
			template: Template.notes
