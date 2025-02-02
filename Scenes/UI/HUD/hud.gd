extends VBoxContainer


signal playerHotbarSwap

var currentItemFocus = 1
var health = 100
var energy = 100
var gold = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func hotbar_pressed(hotbarKey):
	#On press or hotkey press emit a signal that every button will use but pass in the value of the slot item to know what to do with the equipped item
	
	#Emit signal to the player class to swap items
	emit_signal("playerHotbarSwap", hotbarKey) #1 for item 1, #2 for item 2, etc..
	
	#Change the hud to focus/highlight that item on the hotbar
	changeHotbarFocus(hotbarKey)
	

func changeHotbarFocus(value):
	print("Changing hotbar focus to button/slot " + str(value))
	
	#changes all of the buttons
	$HotBar/HBoxContainer/Slot1.get_theme_stylebox("normal").bg_color = Color(0, 0.565, 0) 


func _on_slot_1_pressed():
	hotbar_pressed(1)


func _on_slot_2_pressed():
	hotbar_pressed(2)


func _on_slot_3_pressed():
	hotbar_pressed(3)


func _on_slot_4_pressed():
	hotbar_pressed(4)


func _on_slot_5_pressed():
	hotbar_pressed(5)
