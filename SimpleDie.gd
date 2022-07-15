extends Node2D

var attack = preload("res://art/Weapon.png")
var defend = preload("res://art/shield.png")
#var faces = [attack, attack, defend, defend, defend, defend]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_face(value):
	$Sprite.texture = value
	$Sprite.scale[0] = 40.0/value.get_width()
	$Sprite.scale[1] = 40.0/value.get_height()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
