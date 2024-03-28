extends Node

enum displaymode {WIN, MIN, MAX, FULL, EXC}

func _ready():
	pass

func _process(_delta):
	pass

func get_display_mode():
	DisplayServer.window_get_mode()

func set_display_mode(_mode: int):
	match _mode:
		displaymode.WIN:
			DisplayServer.call_deferred("window_set_mode", displaymode.WIN)

		displaymode.MIN:
			DisplayServer.call_deferred("window_set_mode", displaymode.MIN)

		displaymode.MAX:
			DisplayServer.call_deferred("window_set_mode", displaymode.MAX)

		displaymode.FULL:
			DisplayServer.call_deferred("window_set_mode", displaymode.FULL)

		displaymode.EXC:
			DisplayServer.call_deferred("window_set_mode", displaymode.EXC)
