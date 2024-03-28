extends Area2D

@export var player: CharacterBody2D

func _on_body_entered(_body):
	player.position = Vector2(295, 500)
