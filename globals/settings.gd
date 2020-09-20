extends Node
# Singleton to hold all of the settings

var repeat_missed_exercises := true setget set_repeat_missed_exercises, get_repeat_missed_exercises


func set_repeat_missed_exercises(repeat: bool):
	repeat_missed_exercises = repeat


func get_repeat_missed_exercises() -> bool:
	return repeat_missed_exercises
