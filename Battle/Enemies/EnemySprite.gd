extends AnimatedSprite

export var height = 200
export var width = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	print(frames)
#	scale.x = width * 1.0 / frames["Swing"][0].texture.get_width()
#	scale.y = height * 1.0 / frames["Swing"][0].texture.get_height()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
