class_name Keybinds
extends Resource


@export var defaultMoveLeft: InputEventKey
var defaultMoveRight = "d"
var defaultMoveUp = "w"
var defaultMoveDown = "s"
var defaultLightAttack = "LMB"

var keybindsDict = {"left": defaultMoveLeft, 
					#"right": defaultMoveRight,
					#"up": defaultMoveUp,
					#"down": defaultMoveDown,
					#"lightAttack": defaultLightAttack,
					}
	

#Apply all the saved keybinds to the InputMap of the game
func applyStoredKeybinds():
	#var tempEvent = InputEventKey.new()
	for action in keybindsDict:
		print("\nxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		print("action: " + str(action))
		InputMap.action_erase_events(action)
		
		
		#tempEvent.keycode = keybindsDict[action]
		#print("tempevent: ")
		#print(tempEvent)
		
		InputMap.action_add_event(action, tempEvent)
	
