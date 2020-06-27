class_name TrainCarGroup
extends MarginContainer

onready var car = preload("train_car.tscn")
export(int) var number_of_cars = 1
export(String,
	"left",
	"right"
) var direction = "left"

func _ready():
	var newCar: TrainCar
	
	for i in range(number_of_cars):
		newCar = car.instance()
		newCar.direction = direction
		newCar.randomColor()
		$HBoxContainer.add_child(newCar)



func _on_HBoxContainer_item_rect_changed():
	var maxRect: Rect2
	var rect: Rect2
	printRects("Before")
	
	maxRect = self.get_rect()
	rect = $HBoxContainer.get_rect()
	
	rect.size.x = min(rect.size.x, maxRect.size.x)
	rect.size.y = min(rect.size.y, maxRect.size.y)
	
	$HBoxContainer.rect_size = rect.size
	printRects("After")


func printRects(Header := ""):
	print(Header)
	print(self.get_rect())
	print($HBoxContainer.get_rect())
	print($HBoxContainer.get_parent_area_size())
