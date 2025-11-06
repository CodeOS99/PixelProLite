extends Button

func _on_pressed() -> void:
	var style = StyleBoxFlat.new()
	style.bg_color = Globals.curr_col
	add_theme_stylebox_override("normal", style)
