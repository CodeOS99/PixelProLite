extends Control

@export var min_change: int
@export var max_change: int
@export var change := 0

func _on_up_button_pressed() -> void:
	change += 1
	
	if max_change:
		if change > max_change:
			change = max_change

func _on_down_button_pressed() -> void:
	change -= 1
	
	if min_change:
		if change < min_change:
			change = min_change
