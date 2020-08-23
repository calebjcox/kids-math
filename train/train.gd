class_name Train
extends Node


export(String,
	"left",
	"right"
) var direction = "right" setget _setDirection


func _ready():
	_updateDirection()


func _setDirection(newDirection):
	direction = newDirection
	if is_inside_tree():
		_updateDirection()


func _updateDirection():
	if direction == "left":
		move_child($TrainEngine,0)
	else:
		move_child($TrainEngine,get_child_count()-1)
	$TrainEngine.direction = direction
	$CarGroup1.direction = direction
	$CarGroup2.direction = direction
