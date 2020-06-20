class_name _Exercise
extends Node
# Core functionality that all Math exercise types share in common
#
# Abstracts away the most common peices of functioanlity from the individual
# exercise classes so that each exercise type class only needs to include the 
# code that is specific to that exercise type. All exercise types should
# override the following functions:
#	`_init` (must be defined because `_Exercise` defines `_init`)
# 	`symbol`
#	`answer`


var completed: bool

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
	if lower < 0:
		lower = 0
		upper = numberOfOptions
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
