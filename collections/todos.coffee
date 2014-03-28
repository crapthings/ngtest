@Todos = new Meteor.Collection 'todos'

Todos.before.insert (userId, todo) ->
	_.extend todo,
		creatorId: userId
		createdAt: Date.now()
