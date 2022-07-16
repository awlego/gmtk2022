extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Level1_pressed():
	Global.set_current_level(1)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)

func _on_Level2_pressed():
	Global.set_current_level(2)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)
	
func _on_Level3_pressed():
	Global.set_current_level(3)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)



func _on_Button_pressed():
	pass # Replace with function body.


func _on_DEBUG_go_to_shop_pressed():
	assert(get_tree().change_scene("res://UpgradeShop/UpgradeShop.tscn") == OK)
