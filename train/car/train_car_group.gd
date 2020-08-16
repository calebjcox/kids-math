class_name TrainCarGroup
extends Container

onready var car = preload("train_car.tscn")
export(int) var number_of_cars = 1

export(String,
	"left",
	"right"
) var direction = "left"

func _ready():
	var newCar: TrainCar
	
	for _i in range(number_of_cars):
		newCar = car.instance()
		newCar.direction = direction
		newCar.randomColor()
		add_child(newCar)

