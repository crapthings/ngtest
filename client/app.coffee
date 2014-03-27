app = angular.module 'app', []

# app = angular.module 'app', ['ngTouch', 'ui.router', 'ionic']

ngMeteor.config ($stateProvider, $urlRouterProvider) ->

	$urlRouterProvider.otherwise '/sidemenu/home'

	$stateProvider

		.state 'sidemenu',
			url: '/sidemenu'
			abstract: true
			template: Template.sidemenu

		.state 'sidemenu.home',
			url: '/home'
			template: Template.home
