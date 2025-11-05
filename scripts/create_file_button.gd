extends Button

func _on_pressed() -> void:
	Globals.draw_size = Vector2($"../Resolution/ResolutionContainer/WidthContainer/UpDownControlledValue".value, $"../Resolution/ResolutionContainer/HBoxContainer/UpDownControlledValue".value)
	get_tree().change_scene_to_file("res://scenes/main_draw_area.tscn")
