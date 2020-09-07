extends Node


export(int,1,10) var exercises = 10
export(MathManager.MathMode) var mode = MathManager.MathMode.ADDITION


var _manager: MathManager

func _ready():
	_manager = MathManager.new(mode, exercises)
	_loadExercise()


func _loadExercise():
	$Feedback/Text.text = ""
	$Equation/Answer.text = "___"
	$Feedback/Image.visible = false
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
	if answers[number] == exercise.answer():
		_answerRight()
	else:
		_answerWrong()
	pass


func _answerRight():
	$Feedback/Text.text = "Good job!"
	$Feedback/Image.texture = preload("res://math/right.png")
	$Feedback/Text.add_color_override("font_color", Color("62B01E"))
	$Feedback/Image.visible = true
	$Equation/Answer.text = str(_manager.currentExercise().answer())
	$NextExerciseTimer.start()


func _answerWrong():
	$Feedback/Text.text = "Try again"
	$Feedback/Text.add_color_override("font_color", Color("ED6868"))
	$Feedback/Image.texture = preload("res://math/wrong.png")
	$Feedback/Image.visible = true


func _nextExercise():
	if _manager.nextExercise():
		_loadExercise()
	else:
		get_tree().quit()
	
