extends Label

func _ready() -> void:
	text = "Insta-Sell Commission: " + str(1-Globals.insta_sell_commision)
