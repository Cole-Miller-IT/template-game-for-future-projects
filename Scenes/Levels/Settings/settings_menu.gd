extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#Read hotkey resource data and assign the buttons the correct keys to display on the rebind button
	var hotkeys = load("res://Scenes/Resources/Settings/keybinds.tres")
	
	if hotkeys:
		print("loaded hotkeys")
		print(hotkeys.defaultMoveLeft)
		
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveLeft/RebindKey.text = hotkeys.defaultMoveRight
	



func _on_check_button_toggled(toggled_on):
	print("toggle setting")
	print(toggled_on)


func _on_h_slider_changed():
	print("hslider something here")


func _on_confirm_pressed():
	print("Apply confirm confirmation message")


func _on_cancel_pressed():
	print("Apply cancel")


###############REBINDING HOTKEYS#######################
func _on_rebind_key_pressed():
	print("Awaiting key press")
	
	#Wait for the next input from the user
	
	
	#rebind the key
	
	
