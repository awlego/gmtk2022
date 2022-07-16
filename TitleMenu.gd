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

func level_selector():
	pass

func start_new_game():
	level_selector()


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Encounter.tscn")
	print("hello")
