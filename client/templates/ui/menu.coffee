ngMeteor.controller 'menuCtrl', ['$scope', '$state', ($scope, $state) ->

	$scope.signout = ->
		Meteor.logout (err) ->
			unless err
				$state.go 'signin'
]
