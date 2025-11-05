extends Label

func _process(delta: float) -> void:
	self.text = str(8 + $"../../UpDownButton".change)
