extends Tree


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	var tree = Tree.new()
#	var root = tree.create_item()
#	tree.set_hide_root(false)
#	var child1 = tree.create_item(root)
#	var child2 = tree.create_item(root)
#	var subchild1 = tree.create_item(child1)
#	subchild1.set_text(0, "Subchild1")

onready var tree = get_node(".")

func _ready():
	var root = tree.create_item()
	root.set_text(0, "ROOT")
	var child1 = tree.create_item(root)
	var child2 = tree.create_item(root)
	var subchild1 = tree.create_item(child1)
	subchild1.set_text(0, "Subchild1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
