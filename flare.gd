extends Node2D

var ignition = true
var active = false


var timer_max = 30
var timer = timer_max
var light = 0
var target_light_amount = 1.5

@onready var Flare_Image = $"Flare Image"
@onready var Hori_Image = $"Hori Image"
@onready var Vert_Image = $"Vert Image"
@onready var Flare_Light = $"Flare Light"


func _process(delta):
	Flare_Image.modulate = Color(1,1,1,float(light * timer) / timer_max)
	Hori_Image.modulate = Color(1,1,1,float(light * timer) / timer_max)
	Vert_Image.modulate = Color(1,1,1,float(light * timer) / timer_max)
	Flare_Light.color = Color(1,1,1,float(light * timer) / timer_max)
	if ignition == true:
		if light < target_light_amount - 0.1:
			target_light_amount = 1.5
		else:
			active = true
			ignition = false
	if active == true:
		target_light_amount = 1
		timer -= 1 * delta

	if light < target_light_amount:
		light += (target_light_amount - light) * delta * 1
	if light > target_light_amount:
		light += (target_light_amount - light) * delta
		
	
