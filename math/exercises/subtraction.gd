class_name Subtraction
extends _Exercise


func _init(left: int, right: int).(left, right):
	if left < right:
		_left = right
		_right = left


func symbol() -> String:
	return "-"


func answer() -> int:
	return _left - _right
