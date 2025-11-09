extends Label

var curr_num = 0

@export var instaText = true

func start_tween():
	var t = get_tree().create_tween()
	t.tween_property(self, "curr_num", Globals.money, Globals.typewriter_time)

func _process(delta: float) -> void:
	if not instaText:
		text = "Money left: " + str(curr_num)
	else:
		text = "Money left: " + str(Globals.money)
