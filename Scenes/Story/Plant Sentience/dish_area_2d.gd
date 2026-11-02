extends Area2D

var fade = 1
var drop = true
var rise = false
var mouse = false

@onready var Main = $"../../.."
@onready var Plate_Outline = $"../PlateAndNeedles(outline)"

func _process(delta):
	_Computer_Anim(delta)
	if mouse == true:
		Plate_Outline.visible = true
		if Input.is_action_just_pressed("Left Click"):
			# Must call the original value, setting it as another value doesn't interact with the original.
			pass # Code Not Ready Yet !!! WORK IN PROGRESS!!!
	else:
		Plate_Outline.visible = false
# Operates the Animation for the computer's outline.
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
	Plate_Outline.modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	mouse = true
	drop = true
	rise = false
	fade = 1

func _on_mouse_exited() -> void:
	mouse = false
