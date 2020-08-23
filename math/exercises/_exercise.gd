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
var left: int 
var right: int setget _setright, _getright


func _init(left: int, right := 0):
	self.left = left
	self.right = right


func _to_string():
	if _multiple_operands:
		return str(left) + " " + symbol() + " " + str(right)
	return str(left)


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


func _setright(newright):
	if _multiple_operands:
		right = newright
	else:
		left = newright


func _getright():
	if _multiple_operands:
		return right
	else:
		return -1
