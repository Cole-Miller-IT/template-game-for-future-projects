class_name Keybinds
extends Resource


####### Make sure to set these in the inspector/editor #############
@export var keybindMoveLeft: String = "A"
@export var keybindMoveRight: String = "D"
@export var keybindMoveUp: String = "W"
@export var keybindMoveDown: String = "S"
#@export var defaultLightAttack = "LMB"

var keybindsDict = {}


#Apply all the saved keybinds to the InputMap of the game
func applyStoredKeybinds():
	#Put here so that the saved keybinds get reloaded to the dictionary
	keybindsDict = {"left": keybindMoveLeft, 
					"right": keybindMoveRight,
					"up": keybindMoveUp,
					"down": keybindMoveDown,
					#"lightAttack": defaultLightAttack,
					}
					
	print("Stored Keybinds: " + str(keybindsDict))
	for action in keybindsDict.keys():
		#print("\nxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		#print("action: " + str(action))
		InputMap.action_erase_events(action)
		
		#Turn the event into the stored keybind by converting the char into the ascii int equivalent
		var tempEvent = InputEventKey.new()
		tempEvent.keycode = keybindsDict[action].unicode_at(0) #position 0
		
		#print("key to rebind as: " + str(tempEvent))
		InputMap.action_add_event(action, tempEvent)
		
	print("Applied stored keybinds successfully")
	
