extends CharacterBody2D

@export_category("Main Menu")
@export var main: Control

@export_category("Movement")
@export var vel: float = 140
@export var sprint: float = 280
@export var acce: float = 20
@export var fric: float = 300

@export_category("Jumping")
@export var jump: float = 650
@export var av_jump: bool = false
@export var coyote_timer: Timer

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
			velocity.x = move_toward(velocity.x , 0.0, fric * _delta)

		pMode.GAME:
			if Input.is_action_pressed("ui_right"):
				if Input.is_action_pressed("ui_sprint"):
					velocity.x = move_toward(velocity.x, sprint, (sprint * 2) * _delta)
				else:
					velocity.x = move_toward(velocity.x, vel, (vel * 2) * _delta)
			elif Input.is_action_pressed("ui_left"):
				if Input.is_action_pressed("ui_sprint"):
					velocity.x = move_toward(velocity.x, -sprint, (sprint * 2) * _delta)
				else:
					velocity.x = move_toward(velocity.x, -vel, (vel * 2) * _delta)
			else:
				velocity.x = move_toward(velocity.x , 0.0, fric * _delta)
			
			if is_on_floor():
				if Input.is_action_just_pressed("ui_jump"):
					velocity.y = move_toward(velocity.y, -jump, jump)

				if Input.is_action_pressed("ui_down"):
					pass
			
			elif not is_on_floor():
				pass

			velocity.y += gravity * _delta

			if Input.is_action_pressed("ui_menu"):
				Global.onGame = false
				main.visible = true

		pMode.DEAD:
			velocity.y += gravity * _delta
			velocity.x = move_toward(velocity.x , 0.0, fric * _delta)

	move_and_slide()

func _on_timer_timeout():
	pass
