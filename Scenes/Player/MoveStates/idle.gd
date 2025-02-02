extends State

@export var walk_state: State
#@export var bulletTime_move_state: State
#@export var die_state: State

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	#print("In idle state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('left') or Input.is_action_just_pressed('right') or Input.is_action_just_pressed('up') or Input.is_action_just_pressed('down'):		
		return walk_state
		
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
