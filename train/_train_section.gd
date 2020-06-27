class_name _TrainSection
extends TextureRect


export(String, "left", "right") var direction = "left" setget _setDirection


func _ready():
	loadTexture()


func loadTexture() ->  void:
	pass


func _setDirection(newDirection : String) -> void:
	if !_validateDirection(newDirection):
		return
	direction = newDirection
	loadTexture()


func _validateDirection(checkDirection) -> bool:
	match checkDirection:
		"left", \
		"right":
			return true
		_:
			return false
