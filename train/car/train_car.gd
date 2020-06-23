class_name TrainCar
extends Sprite

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
export(String, "left", "right") var direction = "left" setget _setDirection


func _ready():
	loadTexture()


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


func _setDirection(newDirection : String) -> void:
	if !_validateDirection(newDirection):
		return
	direction = newDirection
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

func _validateDirection(checkDirection) -> bool:
	match checkDirection:
		"left", \
		"right":
			return true
		_:
			return false
