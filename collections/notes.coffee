@Notes = new Meteor.Collection 'notes'

Notes.before.insert (userId, note) ->
	_.extend note,
		createdAt: Date.now()
