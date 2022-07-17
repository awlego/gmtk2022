extends Node2D

var selected_slot = null
export var die_scene: PackedScene = preload("res://Dice/Die.tscn")

# Called when the node enters the scene tree for the first time.
# eventually this needs to take die objects to pass them in -- not creating them
# from scratch
func _ready():
	$DieSlot6.hide()
	$DieSlot7.hide()
	$DieSlot8.hide()
	$DieSlot9.hide()
	$DieSlot10.hide()
	
	for i in range(5):
		var GrabbedInstance = die_scene.instance()
		GrabbedInstance.position.x = i * 64 + 30
		GrabbedInstance.position.y = 30
#		GrabbedInstance.scale.x = 1.5
#		GrabbedInstance.scale.y = 1.5
		GrabbedInstance.home_slot = i
		GrabbedInstance.slot_index = i
		GrabbedInstance.add_to_group("PlayerDice")
		#Attach it to the tree
		self.add_child(GrabbedInstance)
	
func select(index):
	for child in get_tree().get_nodes_in_group("PlayerDice"):
		if child.slot_index == index:
			selected_slot = index
			child.get_node("Simple").set_shader_width(2.0)
		if child.slot_index != index:
			child.get_node("Simple").set_shader_width(0.0)

	
func deselect(index):
	for child in get_tree().get_nodes_in_group("PlayerDice"):
		if child.slot_index == index:
			selected_slot = null
			child.get_node("Simple").set_shader_width(0.0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
