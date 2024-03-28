extends Control

@export_category("Load Main Scene")
@export_file("*.tscn") var main_scene

@export_category("Animation Node")
@export var animationScreen: AnimationPlayer

func _ready() -> void:
	animationScreen.play("SplashScreen")

func _on_animation_screen_animation_finished(anim_name):
	if anim_name == "SplashScreen":
		get_tree().call_deferred("change_scene_to_file", main_scene)
	else:
		pass
