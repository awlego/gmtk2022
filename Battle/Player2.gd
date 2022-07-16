extends Node

# (relatively) static stats
var max_health = 100
var max_energy = 3

# stats
var health = 50
var defense = 0
var energy = max_energy

var active_dice_slots = 3

#var dice_pool = [] # this will be the array of dice that we load


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func end_turn():
	pass

func start_turn():
	defense = 0
	energy = max_energy

func take_damage(d):
	health -= d
	if health <= 0:
		death()

func death():
	pass

func roll(die):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
