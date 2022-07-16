extends Node

enum Action {
	ATTACK				#0
	DEFEND				#1
	STRENGTH			#2
	HEAL				#3
	DAMAGE				#4
	MODIFY_ADJACENT     #5
	MODIFY_OPPOSITE     #6
}

var attack = preload("res://art/Weapon.png")
var defend = preload("res://art/shield.png")
var Face = preload("res://Dice/Face.gd")
var Faces = {}

func _init_faces():
	Faces["Strike"] = Face.new("Strike", attack, "Attack for 5 damage", [[Action.ATTACK, 5]])
	Faces["Defend"] = Face.new("Defend", defend, "Block 5 damage", [[Action.DEFEND, 5]])
	Faces["Shields Up!"] = Face.new("Shields Up!", defend, "Block 5. Adjacent Faces Block 3.",
		[[Action.DEFEND, 5], [Action.MODIFY_ADJACENT, [Action.DEFEND, 3]]])
	Faces["Double Edged Sword"] = Face.new("Double Edged Sword", attack, "Attack 10. Opposite Face: Take 2 damage.",
		[[Action.ATTACK, 10], [Action.MODIFY_OPPOSITE, [Action.DAMAGE, 2]]])
	

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
