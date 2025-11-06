extends Button

var bought := false
var cost := 10

func _on_pressed() -> void:
	if bought:
		Globals.drawing_mode = "ERASER"
		return
	$Popup.visible = true

func _on_popup_ok_pressed() -> void:
	if Globals.money >= cost:
		Globals.money -= cost
		bought = true
		$Popup.queue_free()

func _on_popup_cancel_pressed() -> void:
	$Popup.visible = false
