extends ProgressBar

var timer: SceneTreeTimer
var total_time: int

func _process(delta: float) -> void:
	if timer:
		value = 100 - timer.time_left/total_time * 100
