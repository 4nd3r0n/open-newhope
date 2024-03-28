extends Control

@export var cancelButton: Button
@export var exitButton: Button

func _input(_event: InputEvent):
	if _event is InputEventJoypadButton:
		if _event.button_index == 2 and _event.pressed == false:
			cancelButton.emit_signal("pressed")

func _on_visibility_changed():
	cancelButton.grab_focus()

func _on_exit_button_pressed():
	Global.quit()

func _on_cancel_button_mouse_entered():
	cancelButton.grab_focus()

func _on_exit_button_mouse_entered():
	exitButton.grab_focus()

func _on_cancel_button_gui_input(_event: InputEvent):
	if _event is InputEventJoypadButton:
		if _event.button_index == 0 and _event.pressed == false:
			cancelButton.emit_signal("pressed")

func _on_exit_button_gui_input(_event: InputEvent):
	if _event is InputEventJoypadButton:
		if _event.button_index == 0 and _event.pressed == false:
			exitButton.emit_signal("pressed")
