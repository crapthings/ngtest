@Notes = new Meteor.Collection 'notes'

Notes.before.insert (userId, note) ->
	_.extend note,
		creatorId: userId
		createdAt: Date.now()
		sticky: note.sticky or false
		important: note.important or false
