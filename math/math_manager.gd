class_name MathManager
extends Node

enum MATH_MODE {
	Counting,
	Addition,
	Subtraction
}

var _number_of_exercises : int
var _upper_limit : int
var _math_mode = MATH_MODE.Addition

var _exercises := []

var _current_exercise : int = 0

func _init(mode = MATH_MODE.Addition, exercises := 10, highest_number := 10):
	_math_mode = mode
	_number_of_exercises = exercises
	_upper_limit = highest_number
	
	for i in range(_number_of_exercises):
		_exercises.append(createExercise())

func createExercise():
	var exercise : _Operator
	var left : int
	var right : int
	
	randomize()
	
	left = rand_range(1, _upper_limit)
	right = rand_range(1, _upper_limit)
	
	match _math_mode:
		MATH_MODE.Counting:
			exercise = Counting.new(left)
		
		MATH_MODE.Addition:
			exercise = Addition.new(left, right)
		
		MATH_MODE.Subtraction:
			exercise = Subtraction.new(left, right)
	
	return exercise

func finished():
	if _current_exercise == _number_of_exercises:
		return _exercises.back().completed
	return (_current_exercise >= _number_of_exercises)

func nextExercise():
	_current_exercise += 1
	return currentExercise()

func currentExercise():
	if finished():
		return null
	return _exercises[_current_exercise-1]
