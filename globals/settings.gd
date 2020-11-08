extends Node
# Singleton to hold all of the settings


var repeat_missed_exercises: bool = true

var _settings = {}


func _get(property):
	return get(property)


func _set(property, value):
	set(property, value)


func get(setting: String, ignoreMissing := false):
	if setting in self:
		return .get(setting)
	if not ignoreMissing:
		_checkIfSettingExists(setting)
	return _settings.get(setting)


func set(setting: String, value, ignoreMissing := false):
	if setting in self:
		.set(setting, value)
	if not ignoreMissing:
		_checkIfSettingExists(setting)
	_settings[setting] = value


func _checkIfSettingExists(property) -> bool:
	if _settings.has(property) or property in self:
		return true
	push_warning("setting " + str(property) + " does not exist")
	return false
