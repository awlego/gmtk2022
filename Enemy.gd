extends Node


var health = 30
var defense = 0
var next_action = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func do_pending_action():
	pass
	

func select_next_action():
	var rand = randi() % 2
	$EnemyIntent.enemy_intent(rand)

func take_turn():
	do_pending_action()
	next_action = select_next_action()
	

	
