ngMeteor.controller 'signinCtrl', ($scope) ->

	$scope.user =
		username: ''
		password: ''

	$scope.signin = (user) ->
		Meteor.loginWithPassword user.username, user.password, (err) ->
			unless err
				console.log Meteor.user()
			else
				alert err
