extends HBoxContainer

@export var min_change: int
@export var max_change: int

var value = 0

func _ready() -> void:
	$UpDownButton.min_change = min_change
	$UpDownButton.max_change = max_change

func _process(delta: float) -> void:
	$PanelContainer/Label.text = str($UpDownButton.change + 0)
	value = $UpDownButton.change
