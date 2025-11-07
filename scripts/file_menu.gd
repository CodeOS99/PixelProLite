extends Button

func _on_pressed() -> void:
	$"../FileMenuContents".visible = not $"../FileMenuContents".visible
	
	if $"../FileMenuContents".visible:
		add_theme_color_override("font_color", Color(0, 0, 1))
		add_theme_color_override("font_focus_color", Color(0, 0, 1))
		add_theme_color_override("font_hover_color", Color(0, 0, 1))
	else:
		add_theme_color_override("font_color", Color(1, 1, 1))
		add_theme_color_override("font_focus_color", Color(1, 1, 1))
		add_theme_color_override("font_hover_color", Color(1, 1, 1))
