extends Node2D

func intend(actions):
	var defend = false
	var attack = ""
	for action in actions:
		if action[0] == Global.Action.ATTACK:
			if len(attack) > 0:
				attack += " + "
			attack += str(action[1])
		elif action[0] == Global.Action.DEFEND:
			defend = true
	
	$Defend.visible = defend
	$Attack.visible = len(attack) > 0
	$Label.text = attack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
