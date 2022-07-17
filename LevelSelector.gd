extends Node


# Called when the node enters the scene tree for the first time.

func generate_levels():
	pass

func _ready():
	generate_levels()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# don't do it this way kids, this is bad
func mark_level_cleared(level : int):
	if Global.current_level == 1:
		$Level1.disabled = true
	if Global.current_level == 2:
		$Level2.disabled = true
	if Global.current_level == 3:
		$Level3.disabled = true
	if Global.current_level == 4:
		$Level4.disabled = true
	if Global.current_level == 5:
		$Level5.disabled = true
	if Global.current_level == 6:
		$Level6.disabled = true
		
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
