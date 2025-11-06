extends Control

var pixel_size: int

var pixel = preload("res://scenes/drawing_pixel.tscn")

func _ready() -> void:
	var available_area = get_viewport().size/2
	var pixel_size = ceil(min(available_area[0]/Globals.draw_size[0], available_area[1]/Globals.draw_size[1]))
	print(pixel_size)
	$GridContainer.columns = Globals.draw_size[0]
	for i in range(Globals.draw_size[0] * Globals.draw_size[1]):
		var px: Panel = pixel.instantiate()
		$GridContainer.add_child(px)
		px.custom_minimum_size = Vector2(pixel_size, pixel_size)
