extends Control

var pixel_size: int

var pixel = preload("res://scenes/drawing_pixel.tscn")
var unique_colors: Array[Color] = []
var is_painting := false

@onready var popup = $"../Popup"

func _ready() -> void:
	var available_area = get_viewport().size/2
	var pixel_size = ceil(min(available_area[0]/Globals.draw_size[0], available_area[1]/Globals.draw_size[1]))
	$GridContainer.columns = Globals.draw_size[0]
	for i in range(Globals.draw_size[0] * Globals.draw_size[1]):
		var px: DrawingPixel = pixel.instantiate()
		$GridContainer.add_child(px)
		px.custom_minimum_size = Vector2(pixel_size, pixel_size)
		px.idx = i+1
		px.hovered.connect(px_hovered)
		px.unhovered.connect(px_unhovered)
		px.pressed.connect(px_clicked)
	
	popup.ok_pressed.connect(func():
		if Globals.money >= 5:
			Globals.n_max_unique_cols += 1
			Globals.money -= 5
			popup.visible = false
	)
	popup.cancel_pressed.connect(func():
		popup.visible = false
	)
	popup.text = "You have reached your current color limit of\n" + str(Globals.n_max_unique_cols) + " colors.\nPlease pay an additional 5A for another color."

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and not event.pressed:
		if is_painting:
			is_painting = false
			$"../Paint".stop()

func px_hovered(idx: int):
	var affected = get_affected_indices(idx)
	
	for px_idx in affected:
		var px = $GridContainer.get_child(px_idx-1)
		px.make_hov_col()

func px_unhovered(idx: int):
	var affected = get_affected_indices(idx)
	
	for px_idx in affected:
		var px = $GridContainer.get_child(px_idx-1)
		px.make_unhov_col()

func px_clicked(idx: int):
	if Globals.curr_col not in unique_colors and Globals.drawing_mode == "PENCIL":
		if len(unique_colors) < Globals.n_max_unique_cols:
			unique_colors.append(Globals.curr_col)
		else:
			popup.text = "You have reached your current color limit of\n" + str(Globals.n_max_unique_cols) + " colors.\nPlease pay an additional 5A for another color."
			popup.visible = true
			popup.global_position = get_viewport().get_mouse_position()
			return
	if not is_painting:
		is_painting = true
		if not $"../Paint".playing:
			$"../Paint".play()
	
	var affected = get_affected_indices(idx)
	
	for px_idx in affected:
		var px = $GridContainer.get_child(px_idx-1)
		px.paint()

func get_affected_indices(idx: int):
	var radius = $"../HBoxContainer/VBoxContainer/VSlider".value if Globals.drawing_mode == "PENCIL" else $"../HBoxContainer/VBoxContainer2/VSlider".value if Globals.drawing_mode == "ERASER" else 1
	if radius == 0:
		return [idx]
	var affected = []
	var columns = int(Globals.draw_size[0])
	var rows = int(Globals.draw_size[1])
	
	var center_x = (idx-1)%columns
	var center_y = floor((idx-1)/columns)
	
	for dy in range(-radius, radius+1):
		for dx in range(-radius, radius+1):
			var dist = sqrt(dx*dx + dy*dy)
			
			if dist <= radius:
				var x = center_x+dx
				var y = center_y+dy
				
				if x >= 0 and x < columns and y >= 0 and y < rows:
					var _idx = y*columns+x+1
					affected.append(_idx)
	return affected
