extends Control

@export_category("Main Menu Buttons")
@export var playButton: Button
@export var settingsButton: Button
@export var exitButton: Button

func _on_visibility_changed():
	playButton.grab_focus()

func _on_play_button_mouse_entered():
	playButton.grab_focus()

func _on_settings_button_mouse_entered():
	settingsButton.grab_focus()

func _on_exit_button_mouse_entered():
	exitButton.grab_focus()

func _on_play_button_gui_input(_event: InputEvent):
	if _event is InputEventJoypadButton:
		if _event.button_index == 0 and _event.pressed == false:
			playButton.emit_signal("pressed")

func _on_settings_button_gui_input(_event: InputEvent):
	if _event is InputEventJoypadButton:
		if _event.button_index == 0 and _event.pressed == false:
			pass

func _on_exit_button_gui_input(_event: InputEvent):
	if _event is InputEventJoypadButton:
		if _event.button_index == 0 and _event.pressed == false:
			exitButton.emit_signal("pressed")
