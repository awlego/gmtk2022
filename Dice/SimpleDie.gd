extends Node2D

var selectable = false
var hoverable = false
var face
var i
signal face_click

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_face(value):
	face = value
	var x = value
	if value != null && "art" in value:
		x = value.art
	$Sprite.texture = x
	if x:
#		print("RRRRRRRRRRRRR", 40.0/x.get_width())
		$Sprite.scale[0] = 40.0/x.get_width()
		$Sprite.scale[1] = 40.0/x.get_height()
	#$Tooltip/FaceTooltip.set_face(face)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && "pressed" in event && event.pressed:
		emit_signal("face_click", event, i)
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	pass # Replace with function body.


func set_shader_width(value : float):
	$BlankFace.material.set("shader_param/outline_width", value)
