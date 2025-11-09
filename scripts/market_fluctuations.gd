extends Label

var curr_num = 0

func start_tween():
	pass

func _process(delta: float) -> void:
	text = "Market Fluctuation: " + str(curr_num)
