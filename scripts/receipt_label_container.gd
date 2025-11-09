extends VBoxContainer

func _ready() -> void:
	for i in range(0, get_child_count()):

		get_child(i).modulate.a = 0
		var t = create_tween()
		t.tween_property(get_child(i), "modulate", Color(1, 1, 1, 1), 1).set_delay(i*1)
		if get_child(i) is Label:
			t.tween_callback(func():
				get_child(i).start_tween()
				var sound = $"../MoneyCounter".duplicate()
				add_child(sound)
				sound.play()
				sound.finished.connect(sound.queue_free)
			)
	Globals.money += Globals.total_gain

func _on_new_file_fee_confirmation_ok_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/create_new_file.tscn")

func _on_new_file_fee_confirmation_cancel_pressed() -> void:
	$"../NewFileFeeConfirmation".visible = false
