extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Level1_pressed():
	Global.set_current_level(1)
	get_tree().change_scene("res://Encounter.tscn")

func _on_Level2_pressed():
	Global.set_current_level(2)
	get_tree().change_scene("res://Encounter.tscn")
	
func _on_Level3_pressed():
	Global.set_current_level(3)
	get_tree().change_scene("res://Encounter.tscn")
