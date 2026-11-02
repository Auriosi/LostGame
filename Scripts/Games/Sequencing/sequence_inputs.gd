extends Node2D

var fade = 1
var drop = true
var rise = false
var mouse = false

var Open_Check = false # For the purpose of preventing the Sequence Input from activating if the mouse happens to be over the button before it's pressed.



func _on_mouse_entered() -> void:

	if $"../Sequencing Game".visible == false && $"..".Button_Lock == false:
		drop = true
		rise = false
		fade = 1
		mouse = true

func _on_mouse_exited() -> void:
	mouse = false


var detected = false
var input_ready = false
var activation = false

func _process(delta):
	if mouse == true:
		if Input.is_action_pressed("Left Click") && input_ready == false:
			if $".".activation == true:
				$Area2D/Interact.play()
			else:
				$Area2D/Fail.play()
	if Input.is_action_just_pressed("Change Nucleotide Set") && detected:
		Open_Check = true
	_Microscope_Anim(delta)
	if input_ready == false:
		if detected == true:
			if Input.is_action_just_pressed("Change Nucleotide Set") == true:
				if $"../../Sequencing Game".Completed_Sequences > 0:
					input_ready = true
					activation = true
	if input_ready == true:
		if activation == true:
			$SequenceInput.texture = preload("res://Sprites/Plant Development/Sequence Input [inserted].png")
			$"../../Sequencing Game".Completed_Sequences -= 1
			$"../../Sequencing Game/Result Tab/Completed Sequences Amount".text = str($"../../Sequencing Game".Completed_Sequences)
			activation = false
	else:
		$SequenceInput.texture = preload("res://Sprites/Plant Development/Sequence Input [empty].png")
		if Input.is_action_pressed("Left Click") == true && detected == true && Open_Check == true:
			if $SequenceInput.texture != preload("res://Sprites/Plant Development/Sequence Input [inserted].png"):
				$SequenceInput.modulate = Color(0.925, 0.0, 0.0, 1)
				$Area2D/Label.visible = true
			
		else:
			$SequenceInput.modulate = Color(1, 1, 1, 1)
			$Area2D/Label.visible = false
			
	if $SequenceInput.texture == preload("res://Sprites/Plant Development/Sequence Input [inserted].png"):
		$Area2D/Sprite2D.visible = false
		$Area2D/Label.visible = false

func _Microscope_Anim(delta):
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
	$Area2D/Sprite2D.modulate = Color(1,1,1,fade)

func _on_area_2d_mouse_entered() -> void:
	mouse = true
	fade = 1
	detected = true
	if $SequenceInput.texture != preload("res://Sprites/Plant Development/Sequence Input [inserted].png"):
		$Area2D/Sprite2D.visible = true
		$Area2D/Hover.play()
	

func _on_area_2d_mouse_exited() -> void:
	mouse = false
	detected = false
	$Area2D/Sprite2D.visible = false
