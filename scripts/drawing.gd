extends Control

var pixel_size: int

var pixel = preload("res://scenes/drawing_pixel.tscn")

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

func px_hovered(idx: int):
	var affected = get_affected_indices(idx, Globals.radius)
	
	for px_idx in affected:
		var px = $GridContainer.get_child(px_idx-1)
		px.make_hov_col()

func px_unhovered(idx: int):
	var affected = get_affected_indices(idx, Globals.radius)
	
	for px_idx in affected:
		var px = $GridContainer.get_child(px_idx-1)
		px.make_unhov_col()

func px_clicked(idx: int):
	var affected = get_affected_indices(idx, Globals.radius)
	
	for px_idx in affected:
		var px = $GridContainer.get_child(px_idx-1)
		px.paint()

func get_affected_indices(idx: int, radius: int):
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
