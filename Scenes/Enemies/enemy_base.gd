extends CharacterBody2D
class_name EnemyBase

var health = 100


func take_damage():
	queue_free()

func _on_hurt_box_area_entered(area):
	print("collide")
	take_damage()
