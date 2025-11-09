extends Label

var curr_num = 0

func start_tween():
	var t = get_tree().create_tween()
	t.tween_property(self, "curr_num", Globals.total_gain, Globals.typewriter_time)

func _process(delta: float) -> void:
	text = "Net Gain: " + str(curr_num) + "A"
