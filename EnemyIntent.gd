extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

onready var enemy_intent = get_node("EnemyIntent")

func switch_texture(num):

	if (num == 0):
		enemy_intent.set_texture(Global.attack)

	elif(num == 1):
		enemy_intent.set_texture(Global.defend)

	else:
		print("Error you shouldn't be here")
