extends _Operator
class_name Subtraction

func _init(new_left, new_right).(new_left, new_right):
	if new_left < new_right:
		left = new_right
		right = new_left


func symbol():
	return "-"

func result():
	return left - right
