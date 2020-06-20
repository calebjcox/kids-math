extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var exercise : _Operator
	var manager = MathManager.new()
	while !manager.finished():
		exercise = manager.nextExercise()
		print(exercise)
		print(exercise.answer())
		print(exercise.possibleAnswers())
		print("")
		exercise.completed = true
