extends PanelContainer

var mouse_in := false
var mouse_pressed := false
var offset := Vector2(0, 0)

func _process(delta: float) -> void:
	if mouse_in and mouse_pressed:
		self.global_position = get_viewport().get_mouse_position() + offset
	
	if Input.is_action_pressed("left_mouse_button"):
		mouse_pressed = true
		offset = self.global_position - get_viewport().get_mouse_position()
	elif Input.is_action_just_released("left_mouse_button"):
		mouse_pressed = false

func _on_mouse_entered() -> void:
	mouse_in = true

func _on_mouse_exited() -> void:
	mouse_in = false
