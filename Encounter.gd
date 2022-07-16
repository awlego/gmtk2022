extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var next_dice_slot = 0
const MAX_HEALTH = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerHealth.text = str($Player.health)
	$PlayerEnergy.text = str($Player.energy)
	$EnemyHealth.text = str($Enemy.health)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# I could just update all text here... it's less efficient but it means I don't
# have to do the update everywhere else -- all the updates are here in one function
#func _process(delta):
#	$PlayerHealth.text = str($Player.health)
#	$PlayerEnergy.text = str($Player.energy)
#	$EnemyHealth.text = str($Enemy.health)
#	pass

func _on_RollButton_pressed():
	roll_dice()

func start_player_turn():
	$Player.energy = $Player.max_energy
	next_dice_slot = 0
	# reset dice animations
	# refresh dice cds
	# enable buttons

func end_player_turn():
	# disable buttons
	pass

func roll_dice():
	$Die.roll()
	# decrement energy
	$Player.energy -= 1
	$PlayerEnergy.text = str($Player.energy)
	
	# roll selected die
	var dice_roll = randi() % 6
	var dice_slots = get_tree().get_nodes_in_group("DiceSlots")
	var dice_to_roll = dice_slots[next_dice_slot]
	dice_to_roll.frame = dice_roll
	$Enemy.health -= (dice_roll + 1)
	$Enemy.health = clamp($Enemy.health, 0, MAX_HEALTH)
	$EnemyHealth.text = str($Enemy.health)
	next_dice_slot += 1
	
	# do effect of rolled die
	# check for victory (where exactly should this live?)
	if $Enemy.health == 0:
		round_cleared()
	
	# if energy = 0, end turn and start enemy turn
	if $Player.energy == 0:
		end_player_turn()
		enemy_turn()
	
#
func enemy_turn():
	$Player.health -= 3
	$Player.health = clamp($Player.health, 0, MAX_HEALTH)
	$PlayerHealth.text = str($Player.health)

	if $Player.health == 0:
		game_over()

	# go start player turn, which means resetting their energy/cds
	start_player_turn()
	
func game_over():
	$MessageBox.text = "Game over!"
	# display end of game info and return to home screen
	pass
	
func round_cleared():
	$MessageBox.text = "You beat the encounter!"
	# display round victory info and return to stage selection
	
	pass

