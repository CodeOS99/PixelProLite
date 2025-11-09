extends Label

var curr_num = 0

func start_tween():
	pass

func _process(delta: float) -> void:
	text = "Insta-Sell Commission: " + str(curr_num)
