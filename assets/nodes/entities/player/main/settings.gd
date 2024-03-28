extends Control

@export var backButton: Button

func _input(_event: InputEvent):
	if _event is InputEventJoypadButton:
		if _event.button_index == 2 and _event.pressed == false:
			backButton.emit_signal("pressed")

func _on_visibility_changed():
	backButton.grab_focus()

func _on_back_button_mouse_entered():
	backButton.grab_focus()

func _on_back_button_gui_input(_event: InputEvent):
	if _event is InputEventJoypadButton:
		if _event.button_index == 0 and _event.pressed == false:
			backButton.emit_signal("pressed")
