
class_name PlayerState

var max_health = 100
var health = 70
var gold = 50

func _init(max_health, starting_health, starting_gold):
	self.max_health = max_health
	health = min(starting_health, max_health)
	gold = starting_gold