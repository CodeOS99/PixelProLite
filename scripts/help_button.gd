extends Button

func _on_pressed() -> void:
	$"../HelpMenu".visible = not $"../HelpMenu".visible
	
	#if 
	
