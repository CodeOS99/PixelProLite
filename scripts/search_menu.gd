extends PanelContainer

var search_result = preload("res://scenes/search_result.tscn")

func _ready() -> void:
	var test = search_result.instantiate()
	$VBoxContainer.add_child(test)

func _on_text_edit_text_changed() -> void:
	for child in $VBoxContainer.get_children():
		if child.name != "TextEdit":
			child.queue_free()
	if len($VBoxContainer/TextEdit.text) == 0:
		return
	for k in range(1, randi_range(2, 5)):
		var res = search_result.instantiate()
		$VBoxContainer.add_child(res)
		var tex = ["[b]"+$VBoxContainer/TextEdit.text+"[/b]: A truly " + ["horrifying", "eye-opening", "gut-wrenching", "tragic", "informative"].pick_random() + " " + ["informative", "commercial", "man", "woman", "group", "viewpoint", "movie", "series", "book", "novel"].pick_random() + ".", "Anonymous Mr. [b]" + $VBoxContainer/TextEdit.text + "[/b] says, 'Pixel Pro Lite " + ["destroyed my life.", "made me a fortune.", "changed my life for good.", "was the miracle I needed.", "is an artist's dream."].pick_random() + "'.", "fo2ij4[b]"+$VBoxContainer/TextEdit.text+"[/b]l09js could be the key to " + ["a healthy life.", "find the secrets of the universe.", "find out who asked."].pick_random()].pick_random()
		res.set_text(tex)
