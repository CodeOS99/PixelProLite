extends Label

func _ready() -> void:
	text = "Market Fluctuation: " + str(Globals.market_fluctuations)
