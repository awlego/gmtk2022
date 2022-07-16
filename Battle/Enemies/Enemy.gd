extends Unit

class_name Enemy

var pending_action
var action_set

# Override this for specific enemy
func init_enemy():
	action_set = [
		[[Global.Action.ATTACK, 8]],
		[[Global.Action.ATTACK, 5], [Global.Action.DEFEND, 5]],
		[[Global.Action.DEFEND, 10], [Global.Action.HEAL, 3]]
	]
	max_health = 50
	health = 50

func select_next_action():
	var rand = randi() % action_set.size()
	pending_action = action_set[rand]
	$EnemyIntent.intend(pending_action)

func take_turn():
	var action = pending_action
	upkeep()
	select_next_action()
	return action
	
func _ready():
	init_enemy()
	._ready()
	select_next_action()
