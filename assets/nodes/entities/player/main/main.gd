extends Control

enum buttons {PLAY, SETTINGS, EXIT}

@export var controls: Control
@export var main: Control

@export_category("Menus Control")
@export var mainmenu: Control
@export var settings: Control
@export var exit: Control

@export_category("Main Menu Buttons")
@export var playButton: Button
@export var settingsButton: Button
@export var exitButton: Button

func _ready():
	if Global.onGame == !true:
		mainmenu.visible = true

func _process(_delta):
	pass

func _on_play_button_pressed():
	Global.onGame = true
	main.visible = false

func _on_settings_button_pressed():
	mainmenu.visible = false
	settings.visible = true

func _on_exit_button_pressed():
	mainmenu.visible = false
	exit.visible = true

func _on_back_button_pressed():
	settings.visible = false
	mainmenu.visible = true

func _on_cancel_button_pressed():
	exit.visible = false
	mainmenu.visible = true
