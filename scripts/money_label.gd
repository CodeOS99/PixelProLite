extends Label

func _process(delta: float) -> void:
	text = "Money left: " + str(Globals.money)
