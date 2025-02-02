extends Node2D


#State machines
@onready var movementStateMachine = $MovementStateMachine
@onready var actionStateMachine = $ActionStateMachine

#Ingame stats
var health = 100

#Signals
signal updatePlayerHealth


# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	movementStateMachine.init(self)
	actionStateMachine.init(self)
	
	hurtFlash()
	
	
#pass the input/processing to the state machines
func _unhandled_input(event: InputEvent) -> void:
	movementStateMachine.process_input(event)
	actionStateMachine.process_input(event)


func _physics_process(delta: float) -> void:
	movementStateMachine.process_physics(delta)
	actionStateMachine.process_physics(delta)


func _process(delta: float) -> void:
	movementStateMachine.process_frame(delta)
	actionStateMachine.process_frame(delta)


func hurtFlash():
	$Sprite2D.material.set_shader_parameter("flash_modifier", 0.7)
	$Sprite2D.material.set_shader_parameter("flash_color", Vector4(1, 0, 0, 1))
	$HurtFlashTimer.start(1)


func _on_hurt_flash_timer_timeout():
	$Sprite2D.material.set_shader_parameter("flash_modifier", 0.0)


func take_damage(value):
	print(value)
	hurtFlash()
	
	#update UI
	#emit_signal("updatePlayerHealth", (health - value))
	
	#health -= value
	
	#print(health)
	#if health <= 0 and dying == false:
		#print("player died")
		#dying = true
		
		#movementStateMachine.change_state(dieStateMove)
		#actionStateMachine.change_state(dieStateAction)


func _on_hurt_box_area_entered(area):
	print("take damage")
	#take_damage(area.)
