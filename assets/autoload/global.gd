extends Node

var onGame: bool = false

func _ready() -> void:
	pass

func fun():
	randomize()
	return randi_range(0, 100)

func quit():
	get_tree().quit()
