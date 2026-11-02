extends Area2D

var fade = 1
var drop = true
var rise = false
var mouse = false
var Selected = false
var Static = false
var Value = 0

var Button_Off = true
func _process(delta):
	_static_playing()
	_Switch_Anim(delta)
	if Input.is_action_just_pressed("Left Click") == true && Selected == true && Button_Off == true:
		$"../../Camera".visible = true

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
	$"../CameraButtonOutline".modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	#if $"../Sequencing Game".visible == false && $"..".Button_Lock == false:
	#$Hover.play()
	$"../CameraButtonOutline".visible = true
	drop = true
	rise = false
	fade = 1
	mouse = true
	Selected = true


func _on_mouse_exited() -> void:
	$"../CameraButtonOutline".visible = false
	mouse = false
	Selected = false

func _static_playing():
	if $"../../AudioVisualizer/Static1".playing == true:
		if $"../../AudioVisualizer".static_length < 0:
			Value = 1
	if $"../../AudioVisualizer/Static2".playing == true:
		if $"../../AudioVisualizer".static_length < 0:
			Value = 2
	if $"../../AudioVisualizer/Static3".playing == true:
		if $"../../AudioVisualizer".static_length < 0:
			Value = 3
	if $"../../AudioVisualizer/Static4".playing == true:
		if $"../../AudioVisualizer".static_length < 0:
			Value = 4
	if $"../../AudioVisualizer/Static5".playing == true:
		if $"../../AudioVisualizer".static_length < 0:
			Value = 5


func _Button_Off():
	if $"../../Button1".active == true:
		Button_Off = false
	if $"../../Button2".active == true:
		Button_Off = false
	if $"../../Button3".active == true:
		Button_Off = false
	if $"../../Button4".active == true:
		Button_Off = false
	if $"../../Button5".active == true:
		Button_Off = false
	else:
		Button_Off = true
