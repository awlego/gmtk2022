extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func _on_RollButton_pressed():
	
	var dice_roll = randi() % 6
	$DiceSprite.frame = dice_roll
	

