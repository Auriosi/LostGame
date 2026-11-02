extends Button

var fade = 1
var drop = true
var rise = false
var mouse = false

var open = true
var button_pause = false

func _on_pressed() -> void:
	if $"..".Button_Lock == false:
		if open == true && $AnimatedSprite2D.frame == 12:
			button_pause = true
			open = false
			$AnimatedSprite2D.animation = "Closing"
			$AnimatedSprite2D.play()
		elif $AnimatedSprite2D.frame == 12:
			button_pause = true
			open = true
			$AnimatedSprite2D.animation = "Opening"
			$AnimatedSprite2D.play()

func _process(delta):
	if $AnimatedSprite2D.frame == 0 && $AnimatedSprite2D.animation == "Closing":
		$"WindowsOpen(outline)".visible = false
		$"WindowsOpen(outline)".texture = preload("res://Sprites/Lab/Windows_open (outline ~ open).png")
		size.y = 50
		if $Opening.playing == false:
			$Opening.play()
	elif $AnimatedSprite2D.frame == 0 && $AnimatedSprite2D.animation == "Opening":
		$"WindowsOpen(outline)".visible = false
		$"WindowsOpen(outline)".texture = preload("res://Sprites/Lab/Windows_open (outline).png")
		size.y = 8
		if $Closing.playing == false:
			$Closing.play()
			
	if $AnimatedSprite2D.frame == 12:
		if mouse == true:
			$"WindowsOpen(outline)".visible = true
		$".".disabled = false
	else:
		$".".disabled = true
	_Blind_Anim(delta)
		
	if button_pause == true:
		if $AnimatedSprite2D.frame == 12:
			button_pause = false

func _Blind_Anim(delta):
	if drop == true:
		fade -= 0.5 * delta
	elif rise == true:
		fade += 0.5 * delta
	if fade > 1:
		rise = false
		drop = true
	if fade < 0.5:
		drop = false
		rise = true
	$"WindowsOpen(outline)".modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	if $"../Sequencing Game".visible == false && $"..".Button_Lock == false && $AnimatedSprite2D.frame == 12:
		$Hover.play()
		$"WindowsOpen(outline)".visible = true
		drop = true
		rise = false
		fade = 1
		mouse = true

func _on_mouse_exited() -> void:
	$"WindowsOpen(outline)".visible = false
	mouse = false
