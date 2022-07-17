extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var next_dice_slot = 0
const MAX_HEALTH = 10000
var selected_die

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.game_started == true:
		$Music.play()
	
	var enemy = load("res://Battle/Enemies/Goblin.tscn").instance()
	add_child(enemy)
	enemy.name = "enemy"
	enemy.position.x = 800
	enemy.position.y = 650
	enemy.enter_battle(self)
	
	var player_unit = load("res://Battle/Player.tscn").instance()
	add_child(player_unit)
	player_unit.name = "player"
	$player.position.x = 300
	$player.position.y = 500
	$player.scale.x = 200.0 / $player/Sprite.texture.get_width()
	$player.scale.y = 300.0 / $player/Sprite.texture.get_height()
	$player.enter_battle(self)
	
	$UnfoldInterface.connect("update_selection", self, "on_face_update")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# I could just update all text here... it's less efficient but it means I don't
# have to do the update everywhere else -- all the updates are here in one function
#func _process(delta):
#	$PlayerHealth.text = str($Player.health)
#	$PlayerEnergy.text = str($Player.energy)
#	$EnemyHealth.text = str($Enemy.health)
#	pass

#func select_die(die):
#	$UnfoldInterface.display_die(die)
#	selected_die = die
	
func _on_RollButton_pressed():
	roll_dice()

func start_player_turn():
	$player.upkeep()

func roll_dice():
	var selected_die = $PlayerDiceCollection.get_selected_die()
	if selected_die == null:
		return
		
	# ideally this is a cost of the dice and is handled in 
	# the actions, but for now all actions cost 1 energy
	$player.energy -= 1
	$PlayerEnergy.text = str($player.energy)
	print($PlayerDiceCollection.i)
	
#	$PlayerDiceCollection 
#	var selected_dice = $PlayerDiceCollection.get_selected_die()
#	for child in get_tree().get_nodes_in_group("PlayerDice"):
#		if child.slot_index == $PlayerDiceCollection.selected_slot:
#			selected_dice = child
#
	var actions = selected_die.roll()
	print(actions)
	print($PlayerDiceCollection.dice[0].is_selected)
	player_actions(actions)
#	
	# check for victory (where exactly should this live?)
	if $enemy.health == 0:
		round_cleared()
	
	# if energy = 0, end turn and start enemy turn
	if $player.energy == 0:
		enemy_turn()

func player_actions(actions):
	action_processing(actions, $player, $enemy)

func enemy_actions(actions):
	action_processing(actions, $enemy, $player)

func action_processing(actions, source, target):
	for action in actions:
		var n = action[1]
		match action[0]:
			Global.Action.ATTACK:
				target.take_damage(n)
			Global.Action.DEFEND:
				source.gain_defense(n)
			Global.Action.DAMAGE:
				source.lose_health(n)
			Global.Action.HEAL:
				source.heal(n)
	

func enemy_turn():
	enemy_actions($enemy.take_turn())
	
	if $player.health == 0:
		game_over()

	# go start player turn, which means resetting their energy/cds
	start_player_turn()


func game_over():
	$MessageBox.text = "Game over!"
	$Music.stop()
	$ReturnHomeButton.show()
	# display end of game info and return to home screen

func round_cleared():
	$MessageBox.text = "You beat the encounter!"
	$ReturnLevelSelectButton.show()
	# display round victory info and return to stage selection
	pass



func _on_ReturnHomeButton_pressed():
	# game over
	assert(get_tree().change_scene("res://TitleMenu.tscn") == OK)


func _on_ReturnLevelSelectButton_pressed():
	# signal that we've cleared the level
	
#	var level_selector = get_tree().get_root().find_node("LevelSelector")
##	var level_selector = get_node("res://LevelSelector.gd")
#	print(level_selector)
#	level_selector.mark_level_cleared(Global.get_current_level())
	assert(get_tree().change_scene("res://LevelSelector.tscn") == OK)

func _on_PlayerDiceCollection_die_selected(selected_die):
	print(selected_die)
	$UnfoldInterface.display_die(selected_die)
	
func on_face_update(new_face):
	$FaceTooltip.set_face(new_face)
