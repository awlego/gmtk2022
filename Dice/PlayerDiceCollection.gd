extends Node2D

#var selected_slot = null
export var die_scene: PackedScene = preload("res://Dice/Die.tscn")
var dice = []
var i
signal die_selected

# Called when the node enters the scene tree for the first time.
# eventually this needs to take die objects to pass them in -- not creating them
# from scratch
func _ready():
	var dc = Global.Player.dice_collection
#	$DieSlot6.hide()
#	$DieSlot7.hide()
#	$DieSlot8.hide()
#	$DieSlot9.hide()
#	$DieSlot10.hide()
	
	for i in range(len(dc)):
		var GrabbedInstance = die_scene.instance()
		GrabbedInstance.init_faces(dc[i])
		GrabbedInstance.position.x = (i%5) * 64 + 30
		GrabbedInstance.position.y = 30 + 64 * (i / 5)
#		GrabbedInstance.scale.x = 1.5
#		GrabbedInstance.scale.y = 1.5
		GrabbedInstance.home_slot = i
		GrabbedInstance.slot_index = i
		GrabbedInstance.add_to_group("PlayerDice")
		#Attach it to the tree
		self.add_child(GrabbedInstance)
		dice.append(GrabbedInstance)
	
func select(index): 
#	dice[i].is_selected = false
	if i != null:
		dice[i].deselect()
	i = index
	dice[i].select()
	emit_signal("die_selected", dice[i])
#	for child in get_tree().get_nodes_in_group("PlayerDice"):
#		if child.slot_index == index:
#			selected_slot = index
#			child.get_node("Simple").set_shader_width(2.0)
#		if child.slot_index != index:
#			child.get_node("Simple").set_shader_width(0.0)

	
func deselect():
	if i == null:
		return
	dice[i].deselect()
	i = null
	emit_signal("die_selected", null)
#	for child in get_tree().get_nodes_in_group("PlayerDice"):
#		if child.slot_index == index:
#			selected_slot = null
#			child.get_node("Simple").set_shader_width(0.0)

func get_selected_die():
	if i != null:
		return dice[i]
	return null
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
