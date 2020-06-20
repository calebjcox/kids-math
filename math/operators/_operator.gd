extends Node
class_name _Operator

# Basic interface for all operators

var multiple_operands := true
var left: int 
var right: int setget _set_right, _get_right
var completed : bool

func _init(new_left, new_right = 0):
	self.left = new_left
	self.right = new_right

func symbol():
	return ""

func answer():
	pass

func _set_right(new_right):
	if multiple_operands:
		right = new_right
	else:
		left = new_right

func _get_right():
	if multiple_operands:
		return right
	else:
		return left

func _to_string():
	if multiple_operands:
		return str(left) + " " + symbol() + " " + str(right)
	return str(left)

func equation():
	if multiple_operands:
		return str(self) + " = "
	return ""

func possibleAnswers(numberOfOptions : int = 7):
	var options : Array
	var offset : int
	var lower : int
	var upper : int
	var allowedOffset : int
	
	randomize()
	
	allowedOffset = numberOfOptions / 2
	offset = randi() % numberOfOptions - allowedOffset
	lower = answer() - allowedOffset - offset
	upper = answer() + allowedOffset + (numberOfOptions % 2) - offset
	options = range(lower, upper)
	
	return options
