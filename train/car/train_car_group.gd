class_name TrainCarGroup
extends Container

onready var car = preload("train_car.tscn")
export(int) var number_of_cars = 1

export(String,
	"left",
	"right"
) var direction = "right" setget _setDirection

func _ready():
	var newCar: TrainCar
	
	for _i in range(number_of_cars):
		newCar = car.instance()
		newCar.direction = direction
		newCar.randomColor()
		$HBoxContainer.add_child(newCar)


func _setDirection(newDirection):
	direction = newDirection
	if is_inside_tree():
		for car in $HBoxContainer.get_children():
			car.direction = direction
