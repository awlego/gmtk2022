extends Node2D

var die
var faces

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
