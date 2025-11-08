extends Button

var accepted_terms = false

func _on_insta_sell_commission_popup_ok_pressed() -> void:
	accepted_terms = true
	
	Globals.resolution_bonus = (Globals.draw_size[0] * Globals.draw_size[1])/100 * 5
	Globals.col_mastery = Globals.n_max_unique_cols ** 1.5 * 2
	
	var n_painted = 0
	var edge_count = 0
	for i in range(Globals.draw_size[0]):
		for j in range(Globals.draw_size[1]):
			var px = $"../../../../../Drawing/GridContainer".get_child(i*Globals.draw_size[0] + j)
			if px.painted:
				n_painted += 1
				
				if j != Globals.draw_size[1]-1:
					var right_px = $"../../../../../Drawing/GridContainer".get_child(i*Globals.draw_size[0] + j+1)
					if right_px.painted:
						if px.unhov_col != right_px.unhov_col:
							edge_count += 1
				
				if i != Globals.draw_size[0]-1:
					var down_px = $"../../../../../Drawing/GridContainer".get_child((i+1)*Globals.draw_size[0] + j)
					if down_px.painted:
						if px.unhov_col != down_px.unhov_col:
							edge_count += 1

	Globals.effort_bonus = (n_painted/(Globals.draw_size[0]*Globals.draw_size[1])) * 20
	Globals.detail_bonus = (edge_count/(Globals.draw_size[0]*Globals.draw_size[1]))*15
	Globals.total_price = Globals.base_price + Globals.resolution_bonus + Globals.col_mastery + Globals.effort_bonus + Globals.detail_bonus
	Globals.market_fluctuations = randf_range(.8, 1.2)
	Globals.total_received = ceil(Globals.total_price * Globals.market_fluctuations)
	Globals.insta_sell_commision = .75
	Globals.total_gain = ceil(Globals.total_price * Globals.market_fluctuations * Globals.insta_sell_commision)

	get_tree().change_scene_to_file("res://scenes/insta_sell.tscn")

func _on_insta_sell_commission_popup_cancel_pressed() -> void:
	$"../../../../../InstaSellCommissionPopup".visible = false

func _on_pressed() -> void:
	print("yes")
	$"../../../../../InstaSellCommissionPopup".visible = true
