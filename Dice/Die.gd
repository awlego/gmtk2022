extends Node2D

var dragging = false
var home
var home_slot = null
var faces = [
	Global.Faces["Double Edged Sword"], 
	Global.Faces["Strike"], 
	Global.Faces["Strike"], 
	Global.Faces["Strike"], 
	Global.Faces["Strike"],
	Global.Faces["Shields Up!"]]

# FACES:
# 1 0 4
#   2
#   5
#   3
# Opposite: 5-i
# Adjacent: All except i and 5-i
func opposite_face(i):
	return 5-i

func adjacent_faces(i):
	var faces = range(6)
	faces.erase(i)
	faces.erase(opposite_face(i))
	return faces

# Takes array of 6 Global.Face
func init_faces(faces):
	self.faces = faces

# Takes index 0..5 and Global.Face
func set_face(i, face):
	faces[i] = face

# Called when the node enters the scene tree for the first time.
func _ready():
	$Background/F1.set_face(faces[0])
	$Background/F2.set_face(faces[1])
	$Background/F3.set_face(faces[2])
	$Background/F4.set_face(faces[3])
	$Background/F5.set_face(faces[4])
	$Background/F6.set_face(faces[5])
	$Background.hide()
	$Simple.set_face(faces[0])
	home = position
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		position = Vector2(mousepos.x, mousepos.y)
#	else:
#		position = home
	pass

func roll():
	var roll = randi() % 6
	$Simple.set_face(faces[roll])
	
	return get_effect(roll)

func get_effect(i):
	var effects = []
	for effect in faces[i].effects:
		if effect[0] != Global.Action.MODIFY_OPPOSITE && effect[0] != Global.Action.MODIFY_ADJACENT:
			effects.append(effect)
#	effects.append_array(faces[i].effects)
	for effect in faces[opposite_face(i)].effects:
		if effect[0] == Global.Action.MODIFY_OPPOSITE:
			effects.append(effect[1])
	for face in adjacent_faces(i):
		for effect in faces[face].effects:
			if effect[0] == Global.Action.MODIFY_ADJACENT:
				effects.append(effect[1])
	print(effects)
	return effects

func _on_Interact_mouse_entered():
	$Background.show()
	pass # Replace with function body.


func _on_Interact_mouse_exited():
	$Background.hide()
	pass # Replace with function body.


func _on_Interact_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		dragging = event.pressed
		if !dragging:
			for slot in Global.slots:
				if slot.can_accept():
					var rel_home = slot.get_parent().position
					var abs_home = slot.get_parent().get_parent().position
					var slot_scaling = slot.get_parent().get_parent().scale
					home = slot.get_parent().get_parent().position
					home = rel_home * slot_scaling + abs_home
					home[0] += (30 * slot_scaling.x)
					home[1] += (30 * slot_scaling.y)
					print(home)
					if home_slot:
						home_slot.contains = null
					home_slot = slot
					slot.contains = self
					break
			$Interact/Tween.interpolate_property(self, "position", Vector2(position), 
				Vector2(home), 0.2, Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Interact/Tween.start()
	pass # Replace with function body.
