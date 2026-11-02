extends Node2D

@onready var Game_Start = $"../Menu Scene".Game_Start

@export var Particle_1 = preload("res://Sprites/Particles/Particle Color 1.png")
@export var Particle_2 = preload("res://Sprites/Particles/Particle Color 2.png")
@export var Particle_3 = preload("res://Sprites/Particles/Particle Color 3.png")
@export var Particle_4 = preload("res://Sprites/Particles/Particle Color 4.png")
@export var Particle_5 = preload("res://Sprites/Particles/Particle Color 5.png")
@export var Particle_6 = preload("res://Sprites/Particles/Particle Color 6.png")

var y_speed = 0
var x_speed = 0
var incrament = 0

func _ready():
	var Particle_Choice = randi() % 6
	if Particle_Choice == 0:
		$Sprite2D.texture = Particle_1
	elif Particle_Choice == 1:
		$Sprite2D.texture = Particle_2
	elif Particle_Choice == 2:
		$Sprite2D.texture = Particle_3
	elif Particle_Choice == 3:
		$Sprite2D.texture = Particle_4
	elif Particle_Choice == 4:
		$Sprite2D.texture = Particle_5
	elif Particle_Choice == 5:
		$Sprite2D.texture = Particle_6
	position.y = -600
	position.x = (randi() % 1700) - 850
	y_speed = randi() % 20 + 30
	x_speed = randi() % 20 - 9.5
	incrament = randi() % 30 - 14.5

func _process(delta):
	Game_Start = $"../Menu Scene".Game_Start
	incrament -= randi() % 2 - 0.5
	position.y += y_speed * delta
	position.x += (x_speed + incrament) * delta
	if position.y > 600 or Game_Start == true:
		queue_free()
