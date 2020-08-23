class_name Train
extends Node


export (int, 1, 2) var number_of_car_sections = 2
export (int) var number_of_cars_section1 = 1
export (int) var number_of_cars_section2 = 1


export(String,
	"left",
	"right"
) var direction = "right" setget _setDirection


func _ready():
	_updateDirection()
	_updateCarGroups()


func setNumberOfCars(first: int, second: int = -1):
	number_of_cars_section1 = first
	if second >= 0:
		number_of_cars_section2 = second
		number_of_car_sections = 2
	else:
		number_of_car_sections = 1
	if is_inside_tree():
		_updateCarGroups()


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


func _updateCarGroups():
	$CarGroup1.number_of_cars = number_of_cars_section1
	
	if number_of_car_sections == 1:
		$CarGroup2.visible = false
		$CarSpacer.visible = false
	else:
		$CarGroup2.visible = true
		$CarSpacer.visible = true
		$CarGroup2.number_of_cars = number_of_cars_section2
