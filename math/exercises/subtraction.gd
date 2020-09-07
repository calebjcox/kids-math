class_name Subtraction
extends _Exercise
# An exercise in subtraction


func _init(left: int, right: int).(left, right):
	if left < right:
		self.left = right
		self.right = left


func symbol() -> String:
	return "-"


func answer() -> int:
	return left - right
