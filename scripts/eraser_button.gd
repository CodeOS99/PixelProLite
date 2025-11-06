extends Button

var bought := false

func _on_pressed() -> void:
	if bought:
		Globals.drawing_mode = "ERASER"
