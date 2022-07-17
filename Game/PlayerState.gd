
class_name PlayerState

var max_health = 100
var health = 100
var gold = 50
var dice_collection

func _init(max_health, starting_health, starting_gold):
	self.max_health = max_health
	health = min(starting_health, max_health)
	gold = starting_gold

