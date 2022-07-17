extends Node
#
#export var level_selector: PackedScene = preload("res://LevelSelector.tscn")
#export var upgrade_shop: PackedScene = preload("res://UpgradeShop/UpgradeShop.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
#	var instance = level_selector.instance()
#	add_child(instance)
#	instance = upgrade_shop.instance()
#	add_child(instance)
	assert(get_tree().change_scene("res://TitleMenu.tscn") == OK)



