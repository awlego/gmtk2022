extends Node

func get_starting_dice():
	var dice = []
	
	# Die 1
	dice.append([
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Strike"]
	])
	
	# Die 2
	dice.append([
		Global.Faces["Defend"],
		Global.Faces["Defend"],
		Global.Faces["Defend"],
		Global.Faces["Defend"],
		Global.Faces["Defend"],
		Global.Faces["Defend"]
	])
	
	# Die 3
	dice.append([
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Defend"],
		Global.Faces["Defend"],
		Global.Faces["Defend"]
	])
	
	# Die 4
	dice.append([
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Defend"],
		Global.Faces["Defend"],
		Global.Faces["Defend"]
	])
	
	# Die 5
	dice.append([
		Global.Faces["Defend"],
		Global.Faces["Defend"],
		Global.Faces["Defend"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"]
	])
	
	# Die 6
	dice.append([
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Strike"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"]
	])
	
	# Die 7
	dice.append([
		Global.Faces["Shields Up!"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"],
		Global.Faces["Shields Up!"]
	])
	
	# Die 8
	dice.append([
		Global.Faces["Medicate"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"],
		Global.Faces["Miss!"],
		Global.Faces["Medicate"]
	])

	return dice

func _init():
	Global.Player.dice_collection = get_starting_dice()
