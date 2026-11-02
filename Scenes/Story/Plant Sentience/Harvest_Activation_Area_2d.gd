extends Area2D

var fade = 1
var drop = true
var rise = false
var mouse = false
var Harvest_Game = false
@onready var Main = $"../../.."
@onready var Petri_Dish_Outline = $"../PetriDishOutline"

func _process(delta):
	_Petri_Dish_Anim(delta)
	if mouse == true && Main.Button_Lock == false:
		Petri_Dish_Outline.visible = true
		if Input.is_action_just_pressed("Left Click"):
			# Must call the original value, setting it as another value doesn't interact with the original.
			$"../../Harvest".visible = true
	else:
		Petri_Dish_Outline.visible = false
# Operates the Animation for the computer's outline.
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
	Petri_Dish_Outline.modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	mouse = true
	if Main.Button_Lock == false:
		drop = true
		rise = false
		fade = 1

func _on_mouse_exited() -> void:
	Petri_Dish_Outline.visible = false
	mouse = false
