extends _Operator
class_name Subtraction

func _init(left, right).(left, right):
	if left < right:
		_left = right
		_right = left


func symbol():
	return "-"

func answer():
	return _left - _right
