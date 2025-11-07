extends Button

@export var new_file_fee_confirmation_node: Control

func _on_pressed() -> void:
	new_file_fee_confirmation_node.visible = true
