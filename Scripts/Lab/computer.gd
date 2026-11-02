extends Area2D

	
var First_Entry = true

var fade = 1
var drop = true
var rise = false
var mouse = false
var Genome_Tutorial_Complete = true # Not implamented yet
func _process(delta):
	_Computer_Anim(delta)
	if mouse == true:
		if Input.is_action_pressed("Left Click"):
			if $"../Research Tree".visible == false:
				$Click.play()
			$"../Research Tree".visible = true
			if $"..".Stats_Active == true:
				$"../Research Tree/CanvasLayer".visible = true
			

func _Computer_Anim(delta):
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
	$ComputerOutline.modulate = Color(1,1,1,fade)


func _on_mouse_entered() -> void:
	if $"../Research Tree".visible == false && $"..".Button_Lock == false && Genome_Tutorial_Complete == true:
		$Hover.play()
		$ComputerOutline.visible = true
		drop = true
		rise = false
		fade = 1
		mouse = true

func _on_mouse_exited() -> void:
	$ComputerOutline.visible = false
	mouse = false
