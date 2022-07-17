extends Node2D

#export var bubble : PackedScene
#const DieResource = preload("res://Dice/Die.tscn")

#export(PackedScene) var die_scene
export var die_scene: PackedScene = preload("res://Dice/Die.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var GrabedInstance = die_scene.instance()
	#You could now make changes to the new instance if you wanted
#	CurrentEntry.name = "Die1"
	GrabedInstance.position.x = 700
	GrabedInstance.position.y = 700
	GrabedInstance.scale.x = 1.5
	GrabedInstance.scale.y = 1.5
	#Attach it to the tree
	self.add_child(GrabedInstance)
	
	var GrabedInstance2 = die_scene.instance()
	#You could now make changes to the new instance if you wanted
#	CurrentEntry.name = "Die1"
	GrabedInstance2.position.x = 800
	GrabedInstance2.position.y = 700
	#Attach it to the tree
	self.add_child(GrabedInstance2)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
