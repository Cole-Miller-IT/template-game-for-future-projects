extends State

@export var light_attack_state: State
@export var die_state: State

signal settingsMenu

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In idle action state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('lightAttack'):
		return light_attack_state
		
	if Input.is_action_just_pressed("settingsMenu"):
		settingsMenu.emit()
		
	
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
