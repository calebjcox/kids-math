class_name Subtraction
extends _Operator


func _init(left, right).(left, right):
	if left < right:
		_left = right
		_right = left


func symbol():
	return "-"


func answer():
	return _left - _right
