extends Node2D

var Player_In_Range = false

@onready var Player = $"../Player"

@onready var Light = $Light/PointLight2D

@onready var Light_Image = $Light
@onready var Hori_Light = $"Horizontal Light"
@onready var Vert_Light = $"Vertical Light"

var falloff = 3

var flare_given = false

var Activate = false

func _ready():
	Light.color = Color(1,1,1,randf_range(0.25, 1))
	Light_Image.modulate = Color(1,1,1,randf_range(0.25, 1))
	Hori_Light.modulate = Color(1,1,1,randf_range(0.25, 1))
	Vert_Light.modulate = Color(1,1,1,randf_range(0.25, 1))

func _process(delta):
	if Player_In_Range == true && Player.flares < 3:
		Activate = true
	if Activate == true:
		if Light.energy > 0:
			Light.energy += falloff * delta
			falloff -= 10 * delta
			if Light.energy < 1:
				if flare_given == false:
					Player.flares += 1
					flare_given = true
				Light_Image.modulate = Color(1,1,1,Light.energy)
				Hori_Light.modulate = Color(1,1,1,Light.energy)
				Vert_Light.modulate = Color(1,1,1,Light.energy)
		else:
			queue_free()

func _on_area_2d_area_entered(_area: Area2D):
	Player_In_Range = true

func _on_area_2d_area_exited(_area: Area2D):
	pass#Player_In_Range = false
