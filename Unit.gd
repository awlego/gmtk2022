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
	if (d > defense):
		defense = 0
		lose_health(d - defense)
		return
	defense -= d

func lose_health(hp):
	health = max(health - hp, 0)
	if health == 0:
		dead = true
		emit_signal("death")

func upkeep():
	defense = 0

func enter_battle(battle):
	self.battle = battle
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
