extends Label

var time = 5
func _process(delta):
	if visible == true:
		if time > 0:
			time -= delta * 1
			modulate = Color(1, 1, 1, time / 5)
		else:
			visible = false
