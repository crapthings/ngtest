@Todos = new Meteor.Collection 'todos'

Todos.before.insert (userId, todo) ->
	_.extend todo,
		creatorId: userId
		createdAt: Date.now()
		completed: false
		urgency: todo.urgency or false

Todos.after.insert (userId, todo) ->
	Users.update userId,
		$inc:
			'stats.todos.uncompleted': 1
