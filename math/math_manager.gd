class_name MathManager
extends Node

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


func _init(mode = MathMode.ADDITION, exercises := 10, highest_number := 10):
	_math_mode = mode
	_number_of_exercises = exercises
	_upper_limit = highest_number
	
	for i in range(_number_of_exercises):
		_exercises.append(createExercise())


func createExercise() -> _Exercise:
	var exercise : _Exercise
	var left : int
	var right : int
	
	randomize()
	
	left = rand_range(1, _upper_limit)
	right = rand_range(1, _upper_limit)
	
	match _math_mode:
		MathMode.COUNTING:
			exercise = Counting.new(left)
		
		MathMode.ADDITION:
			exercise = Addition.new(left, right)
		
		MathMode.SUBTRACTION:
			exercise = Subtraction.new(left, right)
	
	return exercise


func finished() -> bool:
	if _current_exercise == _number_of_exercises:
		return _exercises.back().completed
	return (_current_exercise >= _number_of_exercises)


func nextExercise() -> _Exercise:
	_current_exercise += 1
	return currentExercise()


func currentExercise() -> _Exercise:
	if finished():
		return null
	return _exercises[_current_exercise-1]
