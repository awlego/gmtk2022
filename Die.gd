extends Node2D

var faces = [$SimpleDie.attack, $SimpleDie.attack, $SimpleDie.attack, 
$SimpleDie.defend, $SimpleDie.defend, $SimpleDie.defend]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Unfold/Background/F1.set_face(faces[0])
	$Unfold/Background/F2.set_face(faces[1])
	$Unfold/Background/F3.set_face(faces[2])
	$Unfold/Background/F4.set_face(faces[3])
	$Unfold/Background/F5.set_face(faces[4])
	$Unfold/Background/F6.set_face(faces[5])
	$Unfold.popup()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	$Unfold.popup()
	print("HI")
	pass # Replace with function body.
