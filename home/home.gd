extends Node


func _ready():
	$BoundingContainer/MarginContainer/VBoxContainer/Options/Repeat.pressed = Settings.get_repeat_missed_exercises()


func _on_Start_pressed():
	get_tree().change_scene_to(preload("res://math/math.tscn"))
