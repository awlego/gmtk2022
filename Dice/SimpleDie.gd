extends Node2D

var selectable = false
var hoverable = false
var face

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_face(value):
	face = value
	var x = value
	if "art" in value:
		x = value.art
	$Sprite.texture = x
	if x:
		$Sprite.scale[0] = 40.0/x.get_width()
		$Sprite.scale[1] = 40.0/x.get_height()
	#$Tooltip/FaceTooltip.set_face(face)


func _on_Area2D_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	pass # Replace with function body.
