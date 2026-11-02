extends Area2D

var fade = 1
var drop = true
var rise = false
var mouse = false
var Genome_Tutorial_Complete = true # Not implamented yet
func _process(delta):
	_Incubater_Anim(delta)
	if mouse == true:
		if Input.is_action_pressed("Left Click"):
			if $"../Plant Development Game".visible == false:
				$Click.play()
			$"../Plant Development Game".visible = true

func _Incubater_Anim(delta):
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
	$IncubaterOutline.modulate = Color(1,1,1,fade)


func _on_mouse_entered() -> void:
	if $"../Plant Development Game".visible == false && $"..".Button_Lock == false && Genome_Tutorial_Complete == true:
		$"../Plant Development Game/Sequence Inputs".Open_Check = false
		$"../Plant Development Game/Sequence Inputs2".Open_Check = false
		$"../Plant Development Game/Sequence Inputs3".Open_Check = false
		$Hover.play()
		$IncubaterOutline.visible = true
		drop = true
		rise = false
		fade = 1
		mouse = true

func _on_mouse_exited() -> void:
	$IncubaterOutline.visible = false
	mouse = false
