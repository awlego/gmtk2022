extends Node2D

var bar_red = preload("res://art/game_art/barHorizontal_red.png")
var bar_green = preload("res://art/game_art/barHorizontal_green.png")
var bar_yellow = preload("res://art/game_art/barHorizontal_yellow.png")

onready var healthbar = $HealthBar

#func _ready():
#	pass

#func _process(delta):
#	pass

func update_healthbar(value_percentage):
	var value = 100 * value_percentage
	healthbar.texture_progress = bar_green
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = bar_yellow
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = bar_red
	if value <= healthbar.max_value:
		show()
	healthbar.value = value

