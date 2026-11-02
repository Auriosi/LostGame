extends Sprite2D

var fade = 1
var drop = true
var rise = false
var mouse = false

var mouse_detected = false
var active = false
var mouse_down = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_Computer_Anim(delta)
	if mouse_detected == true:
		if Input.is_action_just_released("Left Click") && active == false:
			active = true
			mouse_down = true
			texture = preload("res://Sprites/Story/Plant Sentience/Sound Machine/Sound Machine Button Pressed.png")
			$LED/PointLight2D.visible = true
			$"../Camera".scale = Vector2(1,1)
			$"../AudioVisualizer".Static_Played = true
			#$"../Camera/Ungliation".stop()
		elif Input.is_action_just_released("Left Click") && active == true:
			active = false
			texture = preload("res://Sprites/Story/Plant Sentience/Sound Machine/Sound Machine Button Base.png")
			mouse_down = true
			$LED/PointLight2D.visible = false
			$"../AudioVisualizer".Static_Played = false
		$OutlineSoundMachineButton.visible = true
	else:
		$OutlineSoundMachineButton.visible = false

func _on_area_2d_mouse_entered() -> void:
	mouse_detected = true
	
	#if $"../Sequencing Game".visible == false && $"..".Button_Lock == false:
	if $"../../..".Button_Lock == false:
		#$Hover.play()
		$"OutlineSoundMachineButton".visible = true
		drop = true
		rise = false
		fade = 1
		mouse = true

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
	$"OutlineSoundMachineButton".modulate = Color(1,1,1,fade)

func _on_area_2d_mouse_exited() -> void:
	mouse_detected = false
	
	$OutlineSoundMachineButton.visible = false
	mouse = false
