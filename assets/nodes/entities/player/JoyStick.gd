extends TouchScreenButton

@export var stick: Sprite2D
@onready var max_distance = shape.radius

var stick_centre: Vector2 = texture_normal.get_size() / 2

func _ready() -> void:
	set_process(false)

func _input(_event):
	if _event is InputEventScreenTouch:
		if _event.pressed:
			set_process(true)
		elif not _event.pressed:
			set_process(false)
			stick.position = stick_centre

func _process(_delta):
	stick.global_position = get_global_mouse_position()
	stick.position = stick_centre + (stick.position - stick_centre).limit_length(max_distance)

func get_joystick_dir() -> Vector2:
	var dir = stick.position - stick_centre
	return dir.normalized()
