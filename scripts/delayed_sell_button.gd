extends Button

func _on_delayed_sell_commission_popup_ok_pressed() -> void:
	disabled = true
	$"../InstaSellButton".disabled = true
	$"../../../../../DelayedSellDialog".visible = true
	$"../../../../../DelayedSellCommissionPopup".visible = false
	
	Globals.resolution_bonus = floor((Globals.draw_size[0] * Globals.draw_size[1])/100 * 7)
	Globals.col_mastery = floor(Globals.n_max_unique_cols ** 1.5 * 2.4)
	
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

	Globals.effort_bonus = (n_painted/(Globals.draw_size[0]*Globals.draw_size[1])) * 23
	Globals.detail_bonus = (edge_count/(Globals.draw_size[0]*Globals.draw_size[1]))*18
	Globals.total_price = Globals.base_price + Globals.resolution_bonus + Globals.col_mastery + Globals.effort_bonus + Globals.detail_bonus
	Globals.market_fluctuations = randf_range(.9, 1.1)
	Globals.total_received = ceil(Globals.total_price * Globals.market_fluctuations)
	Globals.insta_sell_commision = .9
	Globals.total_gain = ceil(Globals.total_price * Globals.market_fluctuations * Globals.insta_sell_commision)
	
	Globals.sale_type = "Delayed "
	
	var init_time = randi_range(5, 11)
	var t = get_tree().create_timer(init_time)
	t.timeout.connect(func():
		get_tree().change_scene_to_file("res://scenes/sell.tscn")
	)
	$"../../../../../ProgressBar".timer = t
	$"../../../../../ProgressBar".total_time = init_time
	$"../../../../../ProgressBar".visible = true

func _on_delayed_sell_commission_popup_cancel_pressed() -> void:
	$"../../../../../DelayedSellCommissionPopup".visible = false

func _on_pressed() -> void:
	$"../../../../../DelayedSellCommissionPopup".visible = true
