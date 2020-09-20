extends Node


func _ready():
	$BoundingContainer/MarginContainer/VBoxContainer/Options/Repeat.pressed = Settings.repeat_missed_exercises


func _on_Start_pressed():
	get_tree().change_scene_to(preload("res://math/math.tscn"))


func _on_Repeat_toggled(button_pressed):
	Settings.set("repeat_missed_exercise", button_pressed)
