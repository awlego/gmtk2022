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

func start_new_game():
	Global.game_started = true
	assert(get_tree().change_scene("res://LevelSelector.tscn") == OK)

func _on_PlayButton_pressed():
	start_new_game()
	

