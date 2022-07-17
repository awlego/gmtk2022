extends Node2D

#export var bubble : PackedScene
#const DieResource = preload("res://Dice/Die.tscn")

#export(PackedScene) var die_scene
export var die_scene: PackedScene = preload("res://Dice/Die.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
