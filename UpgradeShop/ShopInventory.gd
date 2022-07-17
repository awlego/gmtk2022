extends Node2D

signal update_selection
var faces
var i

func _ready():
	faces = [$f1, $f2, $f3]
	for i in range(len(faces)):
		faces[i].i = i
		faces[i].connect("face_click", self, "on_face_click")
		faces[i].set_face(Global.random_face())
	
func select(i):
	deselect()
	faces[i].set_shader_width(2.0)
	self.i = i
	emit_signal("update_selection", faces[i].face)

func deselect():
	if self.i != null:
		faces[self.i].set_shader_width(0.0)
	emit_signal("update_selection", null)

func set_face(face, i):
	faces[i].set_face(face)
	faces[i].show()

func unset_face(i):
	faces[i].set_face(null)
	faces[i].hide()
	if self.i == i:
		self.i = null
	

func on_face_click(event, i):
	if event.button_index == BUTTON_LEFT:
		select(i)
	elif event.button_index == BUTTON_RIGHT:
		deselect()
	pass

# Called when the node enters the


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
