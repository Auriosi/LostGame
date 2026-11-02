extends Node2D
var a = 0

var MOUSE = Vector2(0,0)
var NEEDLE_POSITION = Vector2(0,0)
var Button_Lock = false
var Toggle = false

func _process(_delta):
	MOUSE = get_global_mouse_position()
	NEEDLE_POSITION = $Needle.global_position
	if Input.is_action_just_pressed("Open Menu"):
		visible = false
	# Logic for the Button Toggle variable in the Harvest Game
	if Input.is_action_just_released("Left Click"):
		Toggle = false
func _input(event): # Credit to p7f.
	if $Needle.visible == true:
		if event is InputEventMouseMotion:
			if event.relative.x > 0:
				if NEEDLE_POSITION.x < 1120:
					$Needle.position.x += 5
					$Needle.position.y += 5
			if event.relative.x < 0:
				if NEEDLE_POSITION.x > 950:
					$Needle.position.x -= 5
					$Needle.position.y -= 5
