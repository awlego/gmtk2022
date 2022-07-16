extends Node2D

var hp
var max_hp

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = get_parent().health
	max_hp = get_parent().max_health
	
func new_health(health):
	hp = health
	update()

func new_max(max_health):
	max_hp = max_health
	update()

func update():
	var p = 1.0 * hp / max_hp
	$MeshInstance2D/MeshInstance2D.mesh.size.x = $MeshInstance2D.mesh.size.x * p
	$Label.text = str(hp)
