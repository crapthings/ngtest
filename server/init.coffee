Meteor.startup ->

	isAdminExist = Users.findOne { username : 'admin' }

	unless isAdminExist

		Accounts.createUser
			username: 'admin'
			password: 'admin'
