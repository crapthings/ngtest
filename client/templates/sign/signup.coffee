ngMeteor.controller 'signupCtrl', ($scope) ->

	$scope.user =
		username: ''
		password: ''
		profile:
			displayName: ''
			mobile: ''

	$scope.signup = (user) ->
		Accounts.createUser user.username, user.password, (err) ->
			unless err
				console.log Meteor.user()
			else
				alert err
