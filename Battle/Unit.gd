extends Node2D

class_name Unit
signal death

# unit stats
var max_health = 10
var health = 10
var defense = 0
var dead = false
var battle

func take_damage(d):
	print(name + " is taking " + str(d) + " damage, oh no!")
	print(str(defense) + " defense ready for action.")
	if (d > defense):
		lose_health(d - defense)
		defense = 0
		return
	print("No damage taken, phew!")
	defense -= d
	update_hpbar()

func lose_health(hp):
	print("Oh no, " + name + " lost " + str(hp) + " health!")
	health = max(health - hp, 0)
	print("New hp: " + str(health))
	if health == 0:
		dead = true
		emit_signal("death")
	update_hpbar()

func gain_defense(d):
	print(name + " is shielding for " + str(d) + " defense!")
	defense += d

func heal(h):
	print("Aaaah, " + name + " is healing up " + str(h) + "health.")
	if health == max_health:
		return
	health = min(health + h, max_health)
	update_hpbar()

func upkeep():
	defense = 0

func enter_battle(battle):
	self.battle = battle
	
# Called when the node enters the scene tree for the first time.
func _ready():
	update_hpbar()


func update_hpbar():
	var hpbar = get_node("HealthDisplay")
	if hpbar:
		var p = 1.0 * health / max_health
		hpbar.update_healthbar(p)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
