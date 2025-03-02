class_name Keybinds
extends Resource


####### Make sure to set these in the inspector/editor #############
@export var defaultMoveLeft: String = "KEY_A"
@export var defaultMoveRight: String = "KEY_D"
@export var defaultMoveUp: String = "KEY_W"
@export var defaultMoveDown: String = "KEY_S"
#@export var defaultLightAttack = "LMB"

var keybindsDict = {"left": defaultMoveLeft, 
					"right": defaultMoveRight,
					"up": defaultMoveUp,
					"down": defaultMoveDown,
					#"lightAttack": defaultLightAttack,
					}
	


	

#Apply all the saved keybinds to the InputMap of the game
func applyStoredKeybinds():
	print(keybindsDict)
	var tempEvent = InputEventKey.new()
	for action in keybindsDict.keys():
		print("\nxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		print("action: " + str(action))
		InputMap.action_erase_events(action)
		
		#this
		tempEvent.keycode = OS.get_keycode_string(int(keybindsDict[action]))
		
		print("key to rebind as: " + str(tempEvent))
		InputMap.action_add_event(action, tempEvent)
	
