extends Node2D

var dragging = false
var home
var faces = [Global.attack, Global.attack, Global.attack, 
Global.defend, Global.defend, Global.defend]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background/F1.set_face(faces[0])
	$Background/F2.set_face(faces[1])
	$Background/F3.set_face(faces[2])
	$Background/F4.set_face(faces[3])
	$Background/F5.set_face(faces[4])
	$Background/F6.set_face(faces[5])
	$Background.hide()
	$Simple.set_face(faces[0])
	home = position
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		position = Vector2(mousepos.x, mousepos.y)
#	else:
#		position = home
	pass

func roll():
	var roll = randi() % 6
	$Simple.set_face(faces[roll])
	return roll


func _on_Interact_mouse_entered():
	$Background.show()
	pass # Replace with function body.


func _on_Interact_mouse_exited():
	$Background.hide()
	pass # Replace with function body.


func _on_Interact_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		dragging = event.pressed
		if !dragging:
			$Interact/Tween.interpolate_property(self, "position", Vector2(position), 
				Vector2(home), 0.2, Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Interact/Tween.start()
	pass # Replace with function body.
