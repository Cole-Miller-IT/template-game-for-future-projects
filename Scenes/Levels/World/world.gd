extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("settingsMenu"):
		if $SettingsMenu.visible == false:
			#print("bring up settings menu")
			#get_tree().paused = true
			$SettingsMenu.visible = true
			
		else:
			#print("bring down settings menu")
			#get_tree().paused = true
			$SettingsMenu.visible = false
