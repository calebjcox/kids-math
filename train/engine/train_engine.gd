class_name TrainEngine
extends _TrainSection


func loadTexture() -> void:
	self.texture = _trainEngineTexture()


func _trainEngineTexture() -> Resource:
	return load(_trainEnginePath());


func _trainEnginePath() -> String:
	return "res://train/engine/train_engine_" + direction + ".png"
