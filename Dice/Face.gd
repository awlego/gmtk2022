extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_face(val):
	$Face/Icon.texture = val
	$Face/Icon.scale[0] = 0.9 * Global.dice_size / val.get_width()
	$Face/Icon.scale[1] = 0.9 * Global.dice_size / val.get_height()
	$Face/Icon.position[0] = Global.dice_size / 2
	$Face/Icon.position[1] = Global.dice_size / 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
