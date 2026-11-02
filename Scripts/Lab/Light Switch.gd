extends Button

var fade = 1
var drop = true
var rise = false
var mouse = false

@onready var Light_1 = $"../Ceiling Light"
@onready var Light_2 = $"../Ceiling Light2"
@onready var Light_3 = $"../Ceiling Light3"
@onready var Modulation = $"../CanvasModulate"

var on = true

func _process(delta):
	_Button_Anim(delta)

func _Button_Anim(delta):
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
	$"Switch Outline".modulate = Color(1,1,1,fade)

func _on_pressed() -> void:
	if $"..".Button_Lock == false:
		if on == true:
			$"Light Switch On".play()
			on = false
			Light_1.enabled = false
			Light_2.enabled = false
			Light_3.enabled = false
			#Modulation.color = Color(0.1,0.1,0.1,255)
			icon = preload("res://Sprites/Lab/Light Switch (Off).png")
		else:
			$"Light Switch Off".play()
			on = true
			Light_1.enabled = true
			Light_2.enabled = true
			Light_3.enabled = true
			#Modulation.color = Color(0.5,0.5,0.5,255)
			icon = preload("res://Sprites/Lab/Light Switch (On).png")


func _on_mouse_entered() -> void:
	if $"../Sequencing Game".visible == false && $"..".Button_Lock == false:
		$Hover.play()
		$"Switch Outline".visible = true
		drop = true
		rise = false
		fade = 1
		mouse = true

func _on_mouse_exited() -> void:
	$"Switch Outline".visible = false
	mouse = false
