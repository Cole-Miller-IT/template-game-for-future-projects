extends State


@export var idle_state: State
#@export var bulletTime_move_state: State
#@export var die_state: State

var SPEED = 100

func enter() -> void:
	#parent.animations.play(animation_name)
	super()
	#print("In walk state")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	#Make sure the Project's keys are setup for this
	if Input.is_action_pressed("down") or Input.is_action_pressed("up") or Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		return null
	
	else:
		return idle_state


func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	# Get the input direction and handle the movement/deceleration.
	var directionHorizontal = Input.get_axis("left", "right")
	if directionHorizontal:
		parent.velocity.x = directionHorizontal * SPEED
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, SPEED)
		
	var directionVertical = Input.get_axis("up", "down")
	if directionVertical:
		parent.velocity.y = directionVertical * SPEED
	else:
		parent.velocity.y = move_toward(parent.velocity.y, 0, SPEED)
	
	parent.move_and_slide()
	
	return null
	
