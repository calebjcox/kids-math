extends Node


export(int,1,10) var exercises = 1
export(MathManager.MathMode) var mode = MathManager.MathMode.ADDITION


var _manager: MathManager

func _ready():
	_manager = MathManager.new(mode, exercises)
	_loadExercise()


func _loadExercise():
	var exercise: _Exercise = _manager.currentExercise()
	
	$BoundingContainer/Train.setNumberOfCars(exercise.left, exercise.right)
	$Equation/Left.text = str(exercise.left)
	$Equation/Right.text = str(exercise.right)
	$Equation/Symbol.text = exercise.symbol()
	
	var answers: Array = exercise.possibleAnswers()
	$Answers/Answer0.text = str(answers[0])
	$Answers/Answer1.text = str(answers[1])
	$Answers/Answer2.text = str(answers[2])
	$Answers/Answer3.text = str(answers[3])
	$Answers/Answer4.text = str(answers[4])
	$Answers/Answer5.text = str(answers[5])
	$Answers/Answer6.text = str(answers[6])


func _on_answer_pressed(number: int):
	var exercise: _Exercise = _manager.currentExercise()
	var answers: Array = exercise.possibleAnswers()
	print (exercise)
	print (answers)
	print (answers[number])
	if answers[number] == exercise.answer():
		_answerRight()
	else:
		_answerWrong()
	pass


func _answerRight():
	print("Right!")
	pass


func _answerWrong():
	print("Wrong!")
	pass
