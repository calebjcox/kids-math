extends Node


func _ready():
	$BoundingContainer/MarginContainer/VBoxContainer/Options/Repeat.pressed = Settings.repeat_missed_exercises
	$BoundingContainer/MarginContainer/VBoxContainer/Options/Zero.pressed = Settings.allow_zero
	$BoundingContainer/MarginContainer/VBoxContainer/Options/Count/Number.value = Settings.number_of_exercises


func _on_Start_pressed():
	get_tree().change_scene_to(preload("res://math/math.tscn"))


func _on_Repeat_toggled(button_pressed):
	Settings.repeat_missed_exercises = button_pressed


func _on_Zero_toggled(button_pressed):
	Settings.allow_zero = button_pressed


func _on_Number_value_changed(value):
	Settings.number_of_exercises = value
