extends Control

func _on_new_file_fee_confirmation_ok_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/create_new_file.tscn")

func _on_new_file_fee_confirmation_cancel_pressed() -> void:
	$NewFileFeeConfirmation.visible = false
