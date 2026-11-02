extends Label

var visibility = 0

func _process(delta):
	if visibility > 0:
		visibility -= 0.25 * delta
	modulate = Color(0.819, 0.197, 0.239, visibility)
