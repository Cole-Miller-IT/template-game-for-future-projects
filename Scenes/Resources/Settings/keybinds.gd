class_name Keybinds
extends Resource


const MOVE_LEFT : String = "left"
const MOVE_RIGHT : String = "right"
const MOVE_UP : String = "up"
const MOVE_DOWN : String = "down"
const LIGHT_ATTACK : String = "lightAttack"

@export var defaultMoveLeft = "a"
var defaultMoveRight = "d"
var defaultMoveUp = "w"
var defaultMoveDown = "s"
#var defaultLightAttack = "LMB"
	

#Apply all the saved keybinds to the InputMap of the game
func applyStoredKeybinds():
	#for all keybinds #make dict to hold them		 #####store the keybinds as events
	#update input map
	#InputMap.action_erase_events("left")
	#var tempEvent = InputEventKey.new()
	#tempEvent.keycode = defaultMoveLeft #
	#InputMap.action_add_event("left", tempEvent)
	pass
	
