extends CanvasLayer


var rebindMode = false
var rebindKeyToChange = ""

@onready var hotkeys = Keybinds.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	#Read hotkey resource data and assign the buttons the correct keys to display on the rebind button
	if hotkeys:
		hotkeys = ResourceLoader.load("res://Scenes/Resources/Settings/keybinds.tres")
		
		for action in hotkeys.keybindsDict:
			#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveLeft/RebindKey.text = hotkeys.keybindsDict[action].as_text_key_label().to_lower()
			#print("action: " + str(action))
			pass
		
		#put in the for loop above later
		#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveLeft/RebindKey.text = hotkeys.keybindsDict["left"]
		#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveRight/RebindKey1.text = hotkeys.defaultMoveRight
		#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveUp/RebindKey1.text = hotkeys.defaultMoveUp
		#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveDown/RebindKey1.text = hotkeys.defaultMoveDown
		#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/LightAttack/RebindKey1.text = hotkeys.defaultLightAttack
	
		
		
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
	#rebind the key to the given key by the user
	if rebindKeyToChange == "moveLeft":
		hotkeys.keybindMoveLeft = eventRecieved.as_text_key_label() #Change the stored hotkey to the new hotkey
		setInputMapEvent("left", eventRecieved)
		
	elif rebindKeyToChange == "moveRight":
		hotkeys.keybindMoveRight = eventRecieved.as_text_key_label() #Change the stored hotkey to the new hotkey
		setInputMapEvent("right", eventRecieved)
		
	elif rebindKeyToChange == "moveUp":
		hotkeys.keybindMoveUp = eventRecieved.as_text_key_label() #Change the stored hotkey to the new hotkey
		setInputMapEvent("up", eventRecieved)
		
	elif rebindKeyToChange == "moveDown":
		hotkeys.keybindMoveDown = eventRecieved.as_text_key_label() #Change the stored hotkey to the new hotkey
		setInputMapEvent("down", eventRecieved)
		
	#elif rebindKeyToChange == "lightAttack":
		
		
	else:
		print("hotkey rebind not implemented yet")

	#save the key for next game boot up
	ResourceSaver.save(hotkeys, "res://Scenes/Resources/Settings/keybinds.tres")
	
	#Update text on the settings menu 	#####Make variable#########
	#$MarginContainer/VBoxContainer/TabContainer/Keybinds/MarginContainer/VBoxContainer/MoveLeft/RebindKey.text = eventRecieved.as_text_key_label().to_lower()
	
	rebindMode = false
	
#Remove previous keybinds for the action and set a new keybind
func setInputMapEvent(action:String, event:InputEvent):
	InputMap.action_erase_events(action)
	InputMap.action_add_event(action, event)
	
	
func _unhandled_input(event):
	if rebindMode == true:
		rebind(event)
	

func _on_rebind_key_1_pressed(extra_arg_0):
	#print(extra_arg_0)
	rebindMode = true
	rebindKeyToChange = extra_arg_0
