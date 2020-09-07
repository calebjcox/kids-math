extends Node


func _on_Start_pressed():
	get_tree().change_scene_to(preload("res://math/math.tscn"))
