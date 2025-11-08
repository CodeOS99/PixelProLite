extends VBoxContainer

func _ready() -> void:
	for i in range(0, get_child_count()):
		get_child(i).modulate.a = 0
		var t = create_tween()
		t.tween_property(get_child(i), "modulate", Color(1, 1, 1, 1), 1).set_delay(i*1)
