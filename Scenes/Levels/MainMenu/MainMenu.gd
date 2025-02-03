extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Music.play()


func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/World/world.tscn")


func _on_options_pressed():
	pass
