class_name TrainCar
extends _TrainSection


export(String, 
	"aqua", 
	"blue", 
	"fushia", 
	"green", 
	"lime", 
	"maroon", 
	"navy", 
	"purple", 
	"red", 
	"teal", 
	"yellow"
) var color = "aqua" setget _setColor


func changeCar(newColor := "aqua", newDirection := "left") -> void:
	if !_validateDirection(newDirection):
		return
	if !_validateColor(newColor):
		return
	direction = newDirection
	color = newColor
	loadTexture()


func loadTexture() -> void:
	self.texture = _trainCarTexture()


func _trainCarTexture() -> Resource:
	return load(_trainCarResPath());


func _trainCarResPath() -> String:
	return "res://train/car/" + direction + "/train_car_" + direction + "_" + color + ".png"


func _setColor(newColor : String) -> void:
	if !_validateColor(newColor):
		return
	color = newColor
	loadTexture()



func _validateColor(checkColor) -> bool:
	match checkColor:
		"aqua", \
		"blue", \
		"fushia", \
		"green", \
		"lime", \
		"maroon", \
		"navy", \
		"purple", \
		"red", \
		"teal", \
		"yellow":
			return true
		_:
			return false
