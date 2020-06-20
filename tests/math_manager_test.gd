extends Node
# Tests the various `MathManager` modes
#
# The tests provided in this class do not represent unit tests or truly
# automated tests. It simply produces a series of text exercises and prints
# some key information about each test exercise so that it can be verified that
# the code is functioning properly.
#
# Unit tests could potentially be built to actually methodically check the
# different elements that this prints out. I'm not aware of any built in unit
# test capabilities in Godot, although this looks promising: 
# https://github.com/bitwes/Gut


func _ready():
	_test_exercise_type(MathManager.MathMode.ADDITION)
	_test_exercise_type(MathManager.MathMode.SUBTRACTION)
	_test_exercise_type(MathManager.MathMode.COUNTING)


func _test_exercise_type(type = MathManager.MathMode.ADDITION):
	var exercise : _Exercise
	var manager = MathManager.new(type)
	while !manager.finished():
		exercise = manager.nextExercise()
		print(exercise)
		print(exercise.answer())
		print(exercise.possibleAnswers())
		print(" ")
		exercise.completed = true
