extends Label

var fade = 0

func _process(delta):
	if fade < 1:
		modulate = Color(1,1,1,fade)
		fade += 0.2 * delta

func _on_button_button_down() -> void:
	get_tree().quit()
	
