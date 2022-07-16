extends Node

var attack = preload("res://art/Weapon.png")
var defend = preload("res://art/shield.png")
var dice_size = 90.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_level : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_current_level(value):
	current_level = value
	
func get_current_level():
	return current_level
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
