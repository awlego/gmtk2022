extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var next_dice_slot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerHealth.text = str($Player.health)
	$PlayerEnergy.text = str($Player.energy)
	$EnemyHealth.text = str($Enemy.health)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_RollButton_pressed():
	roll_dice()


func roll_dice():
	# decrement energy
	$Player.energy -= 1
	$PlayerEnergy.text = str($Player.energy)
	
	# roll selected die
	var dice_roll = randi() % 6
	var dice_slots = get_tree().get_nodes_in_group("DiceSlots")
	var dice_to_roll = dice_slots[next_dice_slot]
	dice_to_roll.frame = dice_roll
	$EnemyHealth.text = str(int($EnemyHealth.text) - (dice_roll + 1))
	next_dice_slot += 1
	
	# do effect of rolled die
	# check for victory (where exactly should this live?)
	
	# if energy = 0, end turn and start enemy turn
	
	
#
#func enemy_turn():
#	enemy.do_current_action()
#	enemy.select_next_action()
#	# go start player turn, which means resetting their energy/cds
	
func game_over():
	# display end of game info and return to home screen
	pass
	
func round_cleared():
	# display round victory info and return to stage selection
	pass

