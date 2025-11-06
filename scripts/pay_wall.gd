extends PanelContainer
signal removed

@export var cost_to_remove := 40

func _ready() -> void:
	$VBoxContainer/CostLabel.text = str(cost_to_remove) + "?"

func _on_buy_button_pressed() -> void:
	if Globals.money >= cost_to_remove:
		Globals.money -= cost_to_remove
		removed.emit()
		self.queue_free()
