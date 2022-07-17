extends Node2D

#export var bubble : PackedScene
#const DieResource = preload("res://Dice/Die.tscn")

#export(PackedScene) var die_scene
export var die_scene: PackedScene = preload("res://Dice/Die.tscn")
var upgrade

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerDiceCollection.connect("die_selected", self, "on_die_selected")
	$UnfoldInterface.connect("update_selection", self, "on_face_update")
	$ShopInventory.connect("update_selection", self, "on_upgrade_select")
	on_face_update(null)
	on_upgrade_select(upgrade)
	on_die_selected(null)
	pass




## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_die_selected(selected_die):
	$UnfoldInterface.display_die(selected_die)
	
func on_face_update(face):
	$FaceTooltip.set_face(face)

func on_upgrade_select(upgrade):
	$NewFaceTooltip.set_face(upgrade)
	self.upgrade = upgrade

func on_upgrade_button():
	if upgrade == null:
		return
	if $PlayerDiceCollection.i != null && $UnfoldInterface.i != null:
		$UnfoldInterface.upgrade_selection(upgrade)
		
	pass # Replace with function body.


func on_return_button():
	assert(get_tree().change_scene("res://LevelSelector.tscn") == OK)
	pass # Replace with function body.
