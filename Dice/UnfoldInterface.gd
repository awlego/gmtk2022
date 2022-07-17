extends Node2D

var die
var faces
var i
signal update_selection

func display_die(die):
	self.die = die
	update()

func update():
	if die == null:
		for face in faces:
			face.set_face(null)
	else:
		for i in range(6):
			faces[i].set_face(die.faces[i])

# Called when the node enters the scene tree for the first time.
func _ready():
	faces = [$f1, $f2, $f3, $f4, $f5, $f6]
	for face in faces:
		face.connect("face_click", self, "on_face_click")
	for i in range(len(faces)):
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

func on_face_click(event, i):
	if event.button_index == BUTTON_LEFT:
		select(i)
	elif event.button_index == BUTTON_RIGHT:
		deselect()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
