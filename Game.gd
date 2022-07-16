extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	assert(get_tree().change_scene("res://TitleMenu.tscn") == OK)



	

