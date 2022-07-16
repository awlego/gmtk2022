extends Control

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
	$Face.set_face(faces[0])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Dice_mouse_entered():
	$Background.show()


func _on_Dice_mouse_exited():
	$Background.hide()

func get_drag_data(position):
	var data = {}
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = $Face/Face.texture
	drag_texture.rect_size = Vector2(100, 100)
	
	set_drag_preview(drag_texture)
	
	return data
