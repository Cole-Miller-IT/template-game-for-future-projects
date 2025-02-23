extends CanvasLayer


var rebindMode = false
var rebindKeyToChange = ""

@onready var hotkeys = Keybinds.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	#Read hotkey resource data and assign the buttons the correct keys to display on the rebind button
	if hotkeys:
		hotkeys = ResourceLoader.load("res://Scenes/Resources/Settings/keybinds.tres")
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveLeft/RebindKey.text = hotkeys.defaultMoveLeft
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveRight/RebindKey1.text = hotkeys.defaultMoveRight
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveUp/RebindKey1.text = hotkeys.defaultMoveUp
		$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveDown/RebindKey1.text = hotkeys.defaultMoveDown
		#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/LightAttack/RebindKey1.text = hotkeys.defaultLightAttack
	
		print("loaded hotkeys succesfully")
		
	hotkeys.applyStoredKeybinds()


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
func rebind(eventRecieved):
	#print("before changes: " + hotkeys.defaultMoveLeft)
	print("Left map events before: " + str(InputMap.action_get_events("left")))
	
	#rebind the key to the given key by the user
	if rebindKeyToChange == "moveLeft":
		hotkeys.defaultMoveLeft = eventRecieved.as_text_key_label().to_lower()
		#print("keycode recieved for change " + eventRecieved.as_text_key_label().to_lower())
		
		InputMap.action_erase_events("left")
		InputMap.action_add_event("left", eventRecieved)
		
		print("Left map events after: " + str(InputMap.action_get_events("left")))
		
	else:
		print("hotkey rebind not implemented yet")
	
	#func rebind(action, eventReceived):
	#print("Before change: " + hotkeys.get_action_key(action))
	#hotkeys.set_action_key(action, eventReceived.as_text_key_label().to_lower())
	#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer.get_node(action + "/RebindKey").text = hotkeys.get_action_key(action)
	#ResourceSaver.save(hotkeys, "res://Scenes/Resources/Settings/keybinds.tres")
	#print("After change: " + hotkeys.get_action_key(action))

	#save the key for next game boot up
	ResourceSaver.save(hotkeys, "res://Scenes/Resources/Settings/keybinds.tres")
	
	
	#Update text on the settings menu
	$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveLeft/RebindKey.text = eventRecieved.as_text_key_label().to_lower()
	
	rebindMode = false
	
	#hotkeys = load("res://Scenes/Resources/Settings/keybinds.tres")
	#print("after changes: " + hotkeys.defaultMoveLeft)
	
	
func _unhandled_input(event):
	if rebindMode == true:
		rebind(event)
	

func _on_rebind_key_1_pressed(extra_arg_0):
	#print(extra_arg_0)
	rebindMode = true
	rebindKeyToChange = extra_arg_0
