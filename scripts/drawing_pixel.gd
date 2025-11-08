class_name DrawingPixel extends Panel

signal unhovered(idx: int)
signal hovered(idx: int)
signal pressed(idx: int)

var orig_style: StyleBoxFlat
var mouse_in := false
var mouse_pressed := false

var hov_col
var unhov_col

var idx: int

var painted := false

func _ready() -> void:
	orig_style = get_theme_stylebox("panel")
	unhov_col = orig_style.bg_color
	hov_col = Color(.95, .95, .95)

func _process(delta: float) -> void:
	if Input.is_action_pressed("left_mouse_button"):
		mouse_pressed = true
	else:
		mouse_pressed = false
	
	if mouse_in and mouse_pressed:
		emit_signal("pressed", idx)

func paint():
	if Globals.drawing_mode == "PENCIL":
		var style = StyleBoxFlat.new()
		style.bg_color = Globals.curr_col
		add_theme_stylebox_override("panel", style)
		unhov_col = style.bg_color
		var offs = -20
		hov_col = Color(max(unhov_col.r-offs, 0), max(unhov_col.g-offs, 0), max(unhov_col.b-offs, 0))
		painted = true
	elif Globals.drawing_mode == "ERASER":
		add_theme_stylebox_override("panel", orig_style)
		unhov_col = orig_style.bg_color
		hov_col = Color(.95, .95, .95)
		painted = false

func _on_mouse_entered() -> void:
	mouse_in = true
	emit_signal("hovered", idx)

func make_hov_col():
	var style = StyleBoxFlat.new()
	style.bg_color = hov_col
	add_theme_stylebox_override("panel", style)

func _on_mouse_exited() -> void:
	mouse_in = false
	emit_signal("unhovered", idx)

func make_unhov_col():
	var style = StyleBoxFlat.new()
	style.bg_color = unhov_col
	add_theme_stylebox_override("panel", style)
