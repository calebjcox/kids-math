extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	_test_exercise_type(MathManager.MathMode.ADDITION)
	_test_exercise_type(MathManager.MathMode.SUBTRACTION)
	_test_exercise_type(MathManager.MathMode.COUNTING)

func _test_exercise_type(type = MathManager.MathMode.ADDITION):
	var exercise : _Operator
	var manager = MathManager.new(type)
	while !manager.finished():
		exercise = manager.nextExercise()
		print(exercise)
		print(exercise.answer())
		print(exercise.possibleAnswers())
		print(" ")
		exercise.completed = true
