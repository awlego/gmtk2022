extends Node2D

var die
var faces
var i
signal update_selection

func display_die(die):
	if (self.die == die):
		if (die == null):
			update()
		return
	self.die = die
	update()

func update():
	deselect()
	if die == null:
		hide_faces()
#		for face in faces:
#			face.set_face(null)
	else:
		show_faces()
		for i in range(6):
			faces[i].set_face(die.faces[i])

# Called when the node enters the scene tree for the first time.
func _ready():
	faces = [$f1, $f2, $f3, $f4, $f5, $f6]
	for i in range(len(faces)):
		faces[i].connect("face_click", self, "on_face_click")
		faces[i].i = i

func select(i):
	deselect()
	faces[i].set_shader_width(2.0)
	self.i = i
	emit_signal("update_selection", faces[i].face)

func deselect():
	if self.i != null:
		faces[self.i].set_shader_width(0.0)
	emit_signal("update_selection", null)

func hide_faces():
	for face in faces:
		face.hide()

func show_faces():
	for face in faces:
		face.show()

func on_face_click(event, i):
	if event.button_index == BUTTON_LEFT:
		select(i)
	elif event.button_index == BUTTON_RIGHT:
		deselect()
	pass

func upgrade_selection(new_face):
	if die && i != null:
		die.faces[i] = new_face
		update()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
