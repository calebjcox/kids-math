extends Button


const ACTION_RETURN_HOME = "home"


export(bool) var include_return_home = false


func _ready():
	if include_return_home:
		$ConfirmationDialog.add_button("Return Home", false, ACTION_RETURN_HOME)


func _on_Close_pressed():
	$ConfirmationDialog.popup_centered()


func _on_ConfirmationDialog_confirmed():
	get_tree().quit()


func _on_ConfirmationDialog_custom_action(action):
	match action:
		ACTION_RETURN_HOME:
			get_tree().change_scene("res://home/home.tscn")
