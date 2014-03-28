ngMeteor.controller 'notesCtrl', ($scope, $collection, $ionicModal) ->

	$collection 'Notes', $scope, {},
		sort:
			createdAt: -1

	$scope.noteModal = $ionicModal.fromTemplate getTemplate 'newNote',
		scope: $scope
		animation: 'slide-in-up'

	$scope.openModal = ->
		$scope.noteModal.show()

	$scope.closeModal = ->
		$scope.noteModal.hide()

	$scope.newNote = ->
		$scope.openModal()

	$scope.createNote = (note) ->
		$scope.Notes.add note
		$scope.closeModal()
		note.title = ''
		note.content = ''
