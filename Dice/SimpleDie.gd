extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_face(value):
	var x = value
	if "art" in value:
		x = value.art
	$Sprite.texture = x
	$Sprite.scale[0] = 40.0/x.get_width()
	$Sprite.scale[1] = 40.0/x.get_height()
