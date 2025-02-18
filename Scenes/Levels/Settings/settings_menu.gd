extends CanvasLayer


var rebindMode = false
var rebindKeyToChange = ""

@onready var hotkeys = load("res://Scenes/Resources/Settings/keybinds.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	#Read hotkey resource data and assign the buttons the correct keys to display on the rebind button
	if hotkeys:
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveLeft/RebindKey1.text = hotkeys.defaultMoveLeft
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveRight/RebindKey1.text = hotkeys.defaultMoveRight
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveUp/RebindKey1.text = hotkeys.defaultMoveUp
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveDown/RebindKey1.text = hotkeys.defaultMoveDown
		#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/LightAttack/RebindKey1.text = hotkeys.defaultLightAttack
	
		print("loaded hotkeys succesfully")


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
func _on_rebind_key_pressed(value):
	#print("Awaiting key press for hotkey " + str(value))
	
	#toggle rebind mode
	#rebindMode = true
	
	#handle next input event through _unhandled_input() function
	pass
	
func rebind(eventRecieved):
	#print(eventRecieved)
	#rebind the key to the given key by the user
	if rebindKeyToChange == "moveLeft":
		#this
		#work to change the key code to the key value (ie 71 to g)
		hotkeys.defaultMoveLeft = str(eventRecieved.keycode)
		print(str(eventRecieved.keycode))
		
	else:
		print("hotkey rebind not implemented yet")
	
	#
	#make this a variable string for all hotkeys
	#
	$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveLeft/RebindKey1.text = str(eventRecieved)
	
	rebindMode = false
	
	
func _unhandled_input(event):
	#print(str(event))
	if rebindMode == true:
		#print("changing")
		rebind(event)
	
	


func _on_rebind_key_1_pressed(extra_arg_0):
	print(extra_arg_0)
	rebindMode = true
	rebindKeyToChange = extra_arg_0
