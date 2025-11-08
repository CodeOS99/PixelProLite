extends Label

func _ready() -> void:
	text = "Net Gain: " + str(Globals.total_gain) + "A"
