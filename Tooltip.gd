class_name Tooltip
extends Node

var size = Vector2(0,0)
export var tooltip_path: NodePath
onready var tooltip = get_node(tooltip_path)

func _init() -> void:
	pass

func _ready() -> void:
	$TTBackground.rect_size = size

func _mouse_entered():
	var mpos = get_viewport().get_mouse_position()
	var wsize = get_viewport().size
	var xd = 100
	var yd = 100
	if mpos.x > wsize.x/2:
		xd *= -1
	if mpos.y > wsize.y/2:
		yd *= -1
	self.rect_position = Vector2(xd, yd)
	tooltip.show()
	$TTBackground.show()
	if tooltip.size:
		$TTBackground.rect_size = tooltip.size
	else:
		$TTBackground.rect_size = size
	
func _mouse_exited():
	tooltip.hide()
	$TTBackground.hide()
