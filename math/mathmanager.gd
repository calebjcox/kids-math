class_name MathManager
extends Node

enum MATH_MODE {
	Counting,
	Addition,
	Subtraction
}

var number_of_exercises : int
var upper_limit : int
var math_mode = MATH_MODE.Addition

var exercises := []

var current_exercise : int = 0

func _init(mode = MATH_MODE.Addition, exercises := 10, highest_number := 10):
	math_mode = mode
	number_of_exercises = exercises
	upper_limit = highest_number
	
	for i in range(number_of_exercises):
		self.exercises.append(createExercise())

func createExercise():
	var exercise : _Operator
	var left : int
	var right : int
	
	randomize()
	
	left = rand_range(1, upper_limit)
	right = rand_range(1, upper_limit)
	
	match math_mode:
		MATH_MODE.Counting:
			exercise = Counting.new(left)
		
		MATH_MODE.Addition:
			exercise = Addition.new(left, right)
		
		MATH_MODE.Subtraction:
			exercise = Subtraction.new(left, right)
	
	return exercise

func finished():
	if current_exercise == number_of_exercises:
		return exercises.back().completed
	return (current_exercise >= number_of_exercises)

func nextExercise():
	current_exercise += 1
	return currentExercise()

func currentExercise():
	if finished():
		return null
	return exercises[current_exercise-1]
