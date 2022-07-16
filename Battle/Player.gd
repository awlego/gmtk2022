extends Unit

# (relatively) static stats
var max_energy = 3
var energy = max_energy

#var dice_pool = [] # this will be the array of dice that we load

func init(gPlayer):
	max_health = gPlayer.max_health
	health = gPlayer.health
	
func sync():
	Global.Player.health = health

# Called when the node enters the scene tree for the first time.
func _ready():
	init(Global.Player)
	$HP.text = str(health) + "/" + str(max_health)
	._ready()
	pass # Replace with function body.

func lose_health(h):
	.lose_health(h)
	sync()

func heal(h):
	.heal(h)
	sync()

func end_turn():
	pass

func upkeep():
	.upkeep()
	energy = max_energy

func death():
	pass

func roll(die):
	if energy:
		energy -= 1
		return die.roll()
	return []
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HP_draw():
	$HP.text = str(health) + "/" + str(max_health)
	pass # Replace with function body.
