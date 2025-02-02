extends State

@export var idle_state: State
@export var die_state: State

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	print("In light attack state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	
	
	return idle_state

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
