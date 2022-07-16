extends Unit

# (relatively) static stats
var max_energy = 3
var energy = max_energy

#var dice_pool = [] # this will be the array of dice that we load

func init(gPlayer):
	max_health = gPlayer.max_health
	health = gPlayer.health
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init(Global.Player)
	$HP.text = str(health) + "/" + str(max_health)
	pass # Replace with function body.

func end_turn():
	pass

func upkeep():
	.upkeep()
	energy = max_energy

func death():
	pass

func roll(die):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HP_draw():
	$HP.text = str(health) + "/" + str(max_health)
	pass # Replace with function body.
