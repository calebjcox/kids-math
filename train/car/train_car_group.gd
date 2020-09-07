class_name TrainCarGroup
extends Container

onready var car = preload("train_car.tscn")
export(int) var number_of_cars = 1 setget _setCars

export(String,
	"left",
	"right"
) var direction = "right" setget _setDirection

func _ready():
	for _i in range(number_of_cars):
		$HBoxContainer.add_child(_newCar())


func _newCar() -> TrainCar:
	var newCar: TrainCar
	newCar = car.instance()
	newCar.direction = direction
	newCar.randomColor()
	return newCar


func _setDirection(newDirection):
	direction = newDirection
	if is_inside_tree():
		for car in $HBoxContainer.get_children():
			car.direction = direction


func _setCars(number):
	if number < 0:
		return
	while $HBoxContainer.get_child_count() > number:
		$HBoxContainer.remove_child($HBoxContainer.get_child($HBoxContainer.get_child_count() - 1))
	while $HBoxContainer.get_child_count() < number:
		$HBoxContainer.add_child(_newCar())
