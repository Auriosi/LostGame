extends Area2D

var fade = 1
var drop = true
var rise = false
var mouse = false

func _process(delta):
	_Petri_Dish_Anim(delta)
	#if mouse == true:
		#if Input.is_action_pressed("Left Click"):
			#if $"../Sequencing Game".visible == false:
				#$Click.play()
			#$"../Sequencing Game".visible = true
			

func _Petri_Dish_Anim(delta):
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
	$"../PetriDishOutline".modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	#if $"../Sequencing Game".visible == false && $"..".Button_Lock == false:
	if $"../../..".Button_Lock == false:
		#$Hover.play()
		$"../PetriDishOutline".visible = true
		drop = true
		rise = false
		fade = 1
		mouse = true


func _on_mouse_exited() -> void:
	$"../PetriDishOutline".visible = false
	mouse = false
