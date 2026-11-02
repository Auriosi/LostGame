extends Button

func _process(_delta):
	if $"../Settings Menu".visible == true or $"..".UI_animation_timer < 100:
		disabled = true
	else:
		disabled = false
