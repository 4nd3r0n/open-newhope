extends CharacterBody2D

@export_category("Main Menu")
@export var main: Control

@export_category("Movement")
@export var vel: float = 180
@export var sprint: float = 360
@export var acce: float = 20
@export var fric: float = 50

@export_category("Jumping")
@export var jump: float = 600

@export_category("Gravity")
@export var gravity: float = 2000

enum pMode {MENU, GAME, DEAD}
var playerMode: int = pMode.MENU

func _process(_delta):
	if Global.onGame == !true:
		playerMode = pMode.MENU
	elif Global.onGame == true:
		playerMode = pMode.GAME

func _physics_process(_delta):
	match playerMode:
		pMode.MENU:
			velocity.y += gravity * _delta
			velocity.x = lerp(velocity.x, 0.0, _delta * acce)

		pMode.GAME:
			if Input.is_action_pressed("ui_right"):
				if Input.is_action_pressed("ui_sprint"):
					velocity.x = lerp(velocity.x, sprint, _delta * acce)
				else:
					velocity.x = lerp(velocity.x, vel, _delta * acce)
			elif Input.is_action_pressed("ui_left"):
				if Input.is_action_pressed("ui_sprint"):
					velocity.x = lerp(velocity.x, -sprint, _delta * acce)
				else:
					velocity.x = lerp(velocity.x, -vel, _delta * acce)
			else:
				velocity.x = lerp(velocity.x, 0.0, _delta * acce)

			if is_on_floor():
				if Input.is_action_just_pressed("ui_jump"):
					velocity.y = -jump

				if Input.is_action_pressed("ui_down"):
					pass

			velocity.y += gravity * _delta

			if Input.is_action_pressed("ui_menu"):
				Global.onGame = false
				main.visible = true

		pMode.DEAD:
			velocity.y += gravity * _delta
			velocity.x = lerp(velocity.x, 0.0, _delta * acce)

	move_and_slide()
