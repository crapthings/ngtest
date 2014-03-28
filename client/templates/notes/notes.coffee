ngMeteor.controller 'notesCtrl', ['$scope', '$collection', '$ionicModal', ($scope, $collection, $ionicModal) ->

	$collection 'Notes', $scope, { creatorId: Meteor.userId() },
		sort:
			createdAt: -1

	$scope.noteModal = $ionicModal.fromTemplate getTemplate('newNote'),
		scope: $scope
		animation: 'slide-in-up'

	$scope.openModal = ->
		$scope.noteModal.show()

	$scope.closeModal = ->
		$scope.noteModal.hide()

	$scope.openNoteModal = ->
		$scope.openModal()

	$scope.createNote = (note) ->
		$scope.Notes.add note
		$scope.closeModal()
		note.title = ''
		note.content = ''
]
