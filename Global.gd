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

var game_started = false

var attack = preload("res://art/game_art/Weapon.png")
var defend = preload("res://art/game_art/shield.png")
var placeholder = preload("res://art/game_art/blank_dice.png")
var Face = preload("res://Dice/Face.gd")
var Faces = {}
var Player = preload("res://Game/PlayerState.gd").new(100, 100, 100)

func _init_faces():
	# Tier 0
	Faces["Miss!"] = Face.new("Miss!", null, "No effect", [])
	# Tier 1 ~ 5 stats
	Faces["Strike"] = Face.new("Strike", attack, "Attack for 5 damage", [[Action.ATTACK, 5]])
	Faces["Defend"] = Face.new("Defend", defend, "Block 5 damage", [[Action.DEFEND, 5]])
	# Tier 2 ~ 6-10 stats
	Faces["Shields Up!"] = Face.new("Shields Up!", defend, "Block 2. Adjacent Faces Block 2.",
		[[Action.DEFEND, 2], [Action.MODIFY_ADJACENT, [Action.DEFEND, 2]]])
	Faces["Double Edged Sword"] = Face.new("Double Edged Sword", attack, "Attack 12. Opposite Face: Take 2 damage.",
		[[Action.ATTACK, 12], [Action.MODIFY_OPPOSITE, [Action.DAMAGE, 2]]])
	Faces["Medicate"] = Face.new("Medicate (with beer)", placeholder, "Heal 10. Adjacent: Take 1 damage.",
		[[Action.HEAL, 10], [Action.MODIFY_ADJACENT, [Action.DAMAGE, 1]]])
	Faces["Tantrum"] = Face.new("Tantrum", placeholder, "Attack 1 on all faces of this die.",
		[[Action.ATTACK, 1], [Action.MODIFY_ADJACENT, [Action.ATTACK, 1]], [Action.MODIFY_OPPOSITE, [Action.ATTACK, 1]]])
	Faces["Brothers in Arms"] = Face.new("Brothers in Arms", placeholder, "Attack 2. Strengthen attacks on adjacent faces by 1.",
		[[Action.ATTACK, 2], [Action.MODIFY_ADJACENT, [Action.STRENGTH, 1]]])
	# Tier 3 ~ 11+
	Faces["Blood Sacrifice"] = Face.new("Blood Sacrifice", placeholder, 
		"Take 5 damage. Opposite: Take 5 damage. Adjacent: Deal 6 damage.",
		[[Action.DAMAGE, 5], [Action.MODIFY_OPPOSITE, [Action.DAMAGE, 5]], [Action.MODIFY_ADJACENT, [Action.ATTACK, 6]]])

var face_tiers = []
func init_face_tiers():
	face_tiers.append(["Miss!"])
	face_tiers.append(["Strike", "Defend"])
	face_tiers.append(["Shields Up!", "Double Edged Sword", "Medicate", "Tantrum", "Brothers in Arms"])
	face_tiers.append(["Blood Sacrifice"])

func random_face(t2=0.9, t3=0.1):
	var r = randi() % 100 / 100.0
	r += t2
	if r > 1.0:
		return Faces[face_tiers[2][randi() % face_tiers[2].size()]]
	return Faces[face_tiers[3][randi() % face_tiers[3].size()]]

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
	init_face_tiers()
	#var startdice = load("res://StarterDice.gd")
#	Player.dice_collection = load("res://StarterDice.gd").new().get_starting_dice()
#	print(Player.dice_collection)
