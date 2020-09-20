extends Node
# Singleton to hold all of the settings


var _settings = {
	repeat_missed_exercises = true,
}


func _get(property):
	return get(property)


func _set(property, value):
	set(property, value)


func get(setting: String, ignoreMissing := false):
	if not ignoreMissing:
		_checkIfSettingExists(setting)
	return _settings.get(setting)


func set(setting: String, value, ignoreMissing := false):
	if not ignoreMissing:
		_checkIfSettingExists(setting)
	_settings[setting] = value


func _checkIfSettingExists(property) -> bool:
	if not _settings.has(property):
		push_warning("setting " + str(property) + " does not exist")
		return false
	return true
