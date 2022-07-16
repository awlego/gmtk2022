extends Node2D

var contains = null
var hover = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.slots.append(self)

func _exit_tree():
	hover = false
	Global.slots.erase(self)
	
func _queue_free():
	hover = false
	._queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	print("HEY")
	hover = true

func _on_Area2D_mouse_exited():
	hover = false

func can_accept():
	print(hover && (contains == null))
	return hover && (contains == null)
