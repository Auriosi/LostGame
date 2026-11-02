extends Area2D

var fade = 1
var drop = true
var rise = false
var mouse = false
var Selected = false

func _process(delta):
	_Switch_Anim(delta)
	if Input.is_action_just_pressed("Left Click") == true && Selected == true:
		$"../..".visible = false

func _Switch_Anim(delta):
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
	$"../SwitchOutline".modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	#if $"../Sequencing Game".visible == false && $"..".Button_Lock == false:
	#$Hover.play()
	$"../SwitchOutline".visible = true
	drop = true
	rise = false
	fade = 1
	mouse = true
	Selected = true


func _on_mouse_exited() -> void:
	$"../SwitchOutline".visible = false
	mouse = false
	Selected = false
