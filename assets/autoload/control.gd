extends Node

func _ready() -> void:
	pass

func _process(_delta):
	if Input.is_action_pressed("ui_fullscreen"):
		if Config.get_display_mode() == 0:
			Config.set_display_mode(2)
		elif Config.get_display_mode() == 2:
			Config.set_display_mode(0)
