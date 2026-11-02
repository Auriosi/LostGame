extends Area2D

var fade = 1
var drop = true
var rise = false
var mouse = false 

@onready var Main = $"../../.."
@onready var X_Ray_Machine_Outline = $"../XRayMachineOutline"

func _process(delta):
	_X_Ray_Anim(delta)
	if mouse == true && Main.Button_Lock == false:
		X_Ray_Machine_Outline.visible = true
		if Input.is_action_just_pressed("Left Click"):
			# Must call the original value, setting it as another value doesn't interact with the original.
			$"../../X_Ray".visible = true
	else:
		X_Ray_Machine_Outline.visible = false
# Operates the Animation for the X-ray machines's outline.
func _X_Ray_Anim(delta):
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
	X_Ray_Machine_Outline.modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	mouse = true
	if Main.Button_Lock == false:
		drop = true
		rise = false
		fade = 1

func _on_mouse_exited() -> void:
	X_Ray_Machine_Outline.visible = false
	mouse = false
