extends Label

func _ready() -> void:
	text = "Total Price: " + str(Globals.total_price) + "A"
