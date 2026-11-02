extends Area2D

var fade = 1
var drop = true
var rise = false
var mouse = false
var toggle = false

@onready var Open = $"../Open"
@onready var Closed_Outline = $"../Book(closed)(outline)"
@onready var Closed = $"../Closed"
@onready var Main = $"../.."

func _process(delta):
	_Open_Anim(delta)
	if mouse == true && Closed.visible == true:
		Closed_Outline.visible = true
		
		if Input.is_action_just_pressed("Left Click") && Main.Toggle == false:
			
			Closed.visible = false
			Open.visible = true
			Main.Toggle = true
	else:
		Closed_Outline.visible = false
# Operates the Animation for the computer's outline.
func _Open_Anim(delta):
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
	Closed_Outline.modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	mouse = true
	drop = true
	rise = false
	fade = 1

func _on_mouse_exited() -> void:
	mouse = false
