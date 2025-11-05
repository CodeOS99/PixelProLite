extends HBoxContainer

func _process(delta: float) -> void:
	$PanelContainer/Label.text = str($UpDownButton.change + 0)
