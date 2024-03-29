extends Control

@export var controls: Control

func _process(_delta):
	if Global.onGame == not true:
		controls.visible = false
	elif Global.onGame == true:
		controls.visible = true
