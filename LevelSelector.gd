extends Node

var beaten_image = load("res://art/game_art/mini_dragon1_cleaned_transparent_bw.png")

#export var level: PackedScene = preload("res://Level.tscn")
#func generate_levels():
#	for i in range(6)
#		var GrabbedInstance = level.instance()
#		GrabbedInstance.init_faces(dc[i])
#		GrabbedInstance.position.x = (i%5) * 64 + 30
#		GrabbedInstance.position.y = 30 + 64 * (i / 5)
##		GrabbedInstance.scale.x = 1.5
##		GrabbedInstance.scale.y = 1.5
#		GrabbedInstance.home_slot = i
#		GrabbedInstance.slot_index = i
#		GrabbedInstance.add_to_group("Levels")
#		#Attach it to the tree
#		self.add_child(GrabbedInstance)
#	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_parent().get_children())
#	
	if Global.unlocked_levels.has(1):
		$Level1.disabled = false
	if Global.unlocked_levels.has(2):
		$Level2.disabled = false
	if Global.unlocked_levels.has(3):
		$Level3.disabled = false
	if Global.unlocked_levels.has(4):
		$Level4.disabled = false
	if Global.unlocked_levels.has(5):
		$Level5.disabled = false
	if Global.unlocked_levels.has(6):
		$Level6.disabled = false
	if Global.unlocked_levels.has(7):
		$Level7.disabled = false
	if Global.unlocked_levels.has(8):
		$Level8.disabled = false
	
	if Global.beaten_levels.has(1):
		$Level1.disabled = true
		$Level1.texture_disabled = beaten_image
	if Global.beaten_levels.has(2):
		$Level2.disabled = true
		$Level2.texture_disabled = beaten_image
	if Global.beaten_levels.has(3):
		$Level3.disabled = true
		$Level3.texture_disabled = beaten_image
	if Global.beaten_levels.has(4):
		$Level4.disabled = true
		$Level4.texture_disabled = beaten_image
	if Global.beaten_levels.has(5):
		$Level5.disabled = true
		$Level5.texture_disabled = beaten_image
	if Global.beaten_levels.has(6):
		$Level6.disabled = true
		$Level6.texture_disabled = beaten_image
	if Global.beaten_levels.has(7):
		$Level7.disabled = true
		$Level7.texture_disabled = beaten_image
	if Global.beaten_levels.has(8):
		$Level8.disabled = true
		$Level8.texture_disabled = beaten_image
		
	pass # Replace with function body.

#func _update_level_states():
#	$Level1.disabled = true
#	$Level1.texture_disabled = beaten_image

func unlock_level(id):
	Global.unlocked_levels.append(id)
	pass
	
func mark_beaten(id):
	Global.beaten_levels.append(id)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# don't do it this way kids, this is bad
func mark_level_cleared(level : int):
	if Global.current_level == 1:
		mark_beaten(1)
		unlock_level(2)
		unlock_level(3)
	if Global.current_level == 2:
		mark_beaten(2)
		unlock_level(4)
	if Global.current_level == 3:
		mark_beaten(3)
		unlock_level(4)
	if Global.current_level == 4:
		mark_beaten(4)
		unlock_level(5)
	if Global.current_level == 5:
		mark_beaten(5)
		unlock_level(6)
		unlock_level(7)
	if Global.current_level == 6:
		mark_beaten(6)
		unlock_level(8)
	if Global.current_level == 7:
		mark_beaten(7)
		unlock_level(8)
	if Global.current_level == 8:
		mark_beaten(8)
		# TODO YOU WIN PAGE

func _on_Level1_pressed():
	Global.set_current_level(1)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)

func _on_Level2_pressed():
	Global.set_current_level(2)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)
	
func _on_Level3_pressed():
	Global.set_current_level(3)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)

func _on_Level4_pressed():
	Global.set_current_level(4)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)

func _on_Level5_pressed():
	Global.set_current_level(5)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)
	
func _on_Level6_pressed():
	Global.set_current_level(6)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)
	
func _on_Level7_pressed():
	Global.set_current_level(7)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)

func _on_Level8_pressed():
	Global.set_current_level(8)
	assert(get_tree().change_scene("res://Battle/Encounter.tscn") == OK)
	

func _on_DEBUG_go_to_shop_pressed():
	assert(get_tree().change_scene("res://UpgradeShop/UpgradeShop.tscn") == OK)
