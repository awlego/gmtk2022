extends Unit

class_name Enemy

var pending_action
var action_set

# Override this for specific enemy
func init_action_set():
	action_set = [
		[[Global.Action.ATTACK, 8]],
		[[Global.Action.ATTACK, 5], [Global.Action.DEFEND, 5]],
		[[Global.Action.DEFEND, 10]]
	]

func do_pending_action(player):
	for action in pending_action:
		if action[0] == Global.Action.DEFEND:
			defense += action[1]
		elif action[0] == Global.Action.ATTACK:
			if player:
				player.take_damage(action[1])

func select_next_action():
	var rand = randi() % action_set.size()
	pending_action = action_set[rand]

func take_turn(player):
	var action = pending_action
	upkeep()
	select_next_action()
	do_pending_action(player)
	
func _ready():
	init_action_set()
	select_next_action()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
