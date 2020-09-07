extends Button




func _on_Close_pressed():
	$ConfirmationDialog.popup_centered()


func _on_ConfirmationDialog_confirmed():
	get_tree().quit()
