extends Node

@export_category("Load Main Scene")
@export_file("*.tscn") var load_splashscreen = null
@export_file("*.tscn") var load_mainscreen = null

@export_category("Load Egg Scene")
@export var egg: int
@export_file("*.tscn") var load_egg = null

func _ready() -> void:
	var fun: int = Global.fun()
	load_scene(fun)

func load_scene(_fun):
	var loadss: bool = true

	match _fun:
		egg:
			get_tree().call_deferred("change_scene_to_file", load_egg)

		_:
			if loadss == true:
				get_tree().call_deferred("change_scene_to_file", load_splashscreen)
			else:
				get_tree().call_deferred("change_scene_to_file", load_mainscreen)
