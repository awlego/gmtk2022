extends Node

enum Action {
	ATTACK				#0
	DEFEND				#1
	MODIFY_ADJACENT     #2
	MODIFY_OPPOSITE     #3
}

var attack = preload("res://art/Weapon.png")
var defend = preload("res://art/shield.png")
var Face = preload("res://Dice/Face.gd")
var Faces = {}

func _init_faces():
	Faces["Strike"] = Face.new(attack, "Attack for 5 damage", [[Action.ATTACK, 5]])
	Faces["Defend"] = Face.new(defend, "Block 5 damage", [[Action.DEFEND, 5]])

var dice_size = 90.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_level : int = 0
var slots = []

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

func _init():
	._init()
	_init_faces()
