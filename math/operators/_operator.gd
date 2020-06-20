class_name _Operator
extends Node
var completed : bool

var _multiple_operands := true
var _left: int 
var _right: int setget _set_right, _get_right


func _init(left: int, right := 0):
	self._left = left
	self._right = right


func _to_string():
	if _multiple_operands:
		return str(_left) + " " + symbol() + " " + str(_right)
	return str(_left)


func symbol() -> String:
	return ""


func answer() -> int:
	return 0


func equation() -> String:
	if _multiple_operands:
		return str(self) + " = "
	return ""


func possibleAnswers(numberOfOptions: int = 7) -> Array:
	var options: Array
	var offset: int
	var lower: int
	var upper: int
	var allowedOffset: int
	
	randomize()
	
	allowedOffset = numberOfOptions / 2
	offset = randi() % numberOfOptions - allowedOffset
	lower = answer() - allowedOffset - offset
	upper = answer() + allowedOffset + (numberOfOptions % 2) - offset
	options = range(lower, upper)
	
	return options


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
