extends Node
class_name _Operator

# Basic interface for all operators

var _multiple_operands := true
var _left: int 
var _right: int setget _set_right, _get_right
var completed : bool

func _init(left, right = 0):
	self._left = left
	self._right = right

func symbol():
	return ""

func answer():
	pass

func _set_right(new_right):
	if _multiple_operands:
		_right = new_right
	else:
		_left = new_right

func _get_right():
	if _multiple_operands:
		return _right
	else:
		return _left

func _to_string():
	if _multiple_operands:
		return str(_left) + " " + symbol() + " " + str(_right)
	return str(_left)

func equation():
	if _multiple_operands:
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
