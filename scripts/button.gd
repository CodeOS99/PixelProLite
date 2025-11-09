extends Button

func _process(delta: float) -> void:
	visible = $"../SearchMenu".visible

func _on_pressed() -> void:
	$"../SearchMenu".visible = false
