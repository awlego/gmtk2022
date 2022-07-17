extends Control

func set_face(face):
	if face == null:
		hide()
		return
	$ColorRect/Name.text = face.name
	$ColorRect/Desc.text = face.desc
	show()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
