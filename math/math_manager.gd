class_name MathManager
extends Node
# Manages creating and iterating through a series of math exercises
#
# Similar to a factory class but does additional management of the created
# `_Exercise`'s

enum MathMode {
	COUNTING,
	ADDITION,
	SUBTRACTION
}

var _math_mode = MathMode.ADDITION
var _exercises := []
var _current_exercise : int = 0
var _number_of_exercises : int
var _upper_limit : int
var _current_incorrect_answers: int = 0


func _init(mode = MathMode.ADDITION, exercises := 10, highest_number := 10):
	_math_mode = mode
	_number_of_exercises = exercises
	_upper_limit = highest_number
	
	for i in range(_number_of_exercises):
		_exercises.append(createExercise())


func createExercise() -> _Exercise:
	var exercise : _Exercise
	
	randomize()
	
	var lowerBound: int = 0 if Settings.allow_zero else 1
	var left: int = rand_range(lowerBound, _upper_limit)
	var right: int = rand_range(lowerBound, _upper_limit)
	
	match _math_mode:
		MathMode.COUNTING:
			exercise = Counting.new(left)
		
		MathMode.ADDITION:
			exercise = Addition.new(left, right)
		
		MathMode.SUBTRACTION:
			exercise = Subtraction.new(left, right)
	
	return exercise


func finished() -> bool:
	return (_current_exercise >= _exercises.size())


func nextExercise() -> _Exercise:
	if Settings.repeat_missed_exercises and _current_incorrect_answers > 0:
		_exercises.append(currentExercise())
	_current_incorrect_answers = 0
	_current_exercise += 1
	return currentExercise()


func currentExercise() -> _Exercise:
	if finished():
		return null
	return _exercises[_current_exercise]


func incorrectAnswer():
	_current_incorrect_answers += 1
