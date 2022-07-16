extends Node


var health = 3000
var defense = 0
var next_action = 0
var strength = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func do_pending_action():
	if next_action == 0:
		$"../Player".health -= 	5
	elif next_action == 1:
		defense += 7
		$"../EnemyShieldStrength".text = str(defense)
	
	
func select_next_action():
	var rand = randi() % 2
	get_parent().get_node("EnemyIntent").set_intent(rand)
	next_action = rand
	
func upkeep():
	defense = 0

func take_turn():
	upkeep()
	do_pending_action()
	next_action = select_next_action()
	

	
