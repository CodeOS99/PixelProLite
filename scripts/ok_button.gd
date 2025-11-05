extends Button

func _on_pressed() -> void:
	Globals.money -= 5
	get_tree().change_scene_to_file("res://scenes/create_new_file.tscn")
