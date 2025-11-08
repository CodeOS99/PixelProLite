extends Label

func _ready() -> void:
	text = "Total Received: " + str(Globals.total_received) + "A"
