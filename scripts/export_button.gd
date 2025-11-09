extends Button
@export var export_popup: Control
@export var cost: int = 25
var bought := false

func _ready() -> void:
	export_popup.cancel_pressed.connect(func():
		export_popup.visible = false
	)
	
	export_popup.ok_pressed.connect(func():
		if Globals.money >= cost:
			Globals.money -= cost
			bought = true
			export_popup.visible = false
	)
	
	if not OS.has_feature("web"):
		$"../../../../../FileDialog".current_dir = "/"
		$"../../../../../FileDialog".current_file = "export.png"

func _on_pressed() -> void:
	if not bought:
		export_popup.visible = true
		return
	
	if OS.has_feature("web"):
		# web:download immediately
		_export_image()
	else:
		# desktop:show file dialog
		$"../../../../../FileDialog".visible = true

func _on_file_dialog_file_selected(path: String) -> void:
	_export_image(path)

func _export_image(path: String = "") -> void:
	var img = Image.create(Globals.draw_size[0], Globals.draw_size[1], false, Image.FORMAT_RGBA8)
	for i in range(Globals.draw_size[0]):
		for j in range(Globals.draw_size[1]):
			var px = $"../../../../../Drawing/GridContainer".get_child(i * Globals.draw_size[0] + j)
			if px.painted:
				img.set_pixel(i, j, px.unhov_col)
	
	if OS.has_feature("web"):
		var buffer = img.save_png_to_buffer()
		JavaScriptBridge.download_buffer(buffer, "my_drawing.png", "image/png")
		$"../../../../../ExportSuccessDialogue".visible = true
	else:
		var error = img.save_png(path)
		if error != OK:
			$"../../../../../ExportFailDialogue".visible = true
		else:
			$"../../../../../ExportSuccessDialogue".visible = true
