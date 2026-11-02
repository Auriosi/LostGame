extends Node2D

@onready var Game_Start = $"../Menu Scene".Game_Start

@export var Petal_1 = preload("res://Sprites/Particles/Petal_1.png")
@export var Petal_2 = preload("res://Sprites/Particles/Petal_2.png")
@export var Petal_3 = preload("res://Sprites/Particles/Petal_3.png")
@export var Petal_4 = preload("res://Sprites/Particles/Petal_4.png")
@export var Petal_5 = preload("res://Sprites/Particles/Petal_5.png")
@export var Petal_6 = preload("res://Sprites/Particles/Petal_6.png")

var rotation_speed = 0
var movement_speed = 0

func _ready():
	var Petal_Choice = randi() % 6
	if Petal_Choice == 0:
		$Sprite2D.texture = Petal_1
	elif Petal_Choice == 1:
		$Sprite2D.texture = Petal_2
	elif Petal_Choice == 2:
		$Sprite2D.texture = Petal_3
	elif Petal_Choice == 3:
		$Sprite2D.texture = Petal_4
	elif Petal_Choice == 4:
		$Sprite2D.texture = Petal_5
	elif Petal_Choice == 5:
		$Sprite2D.texture = Petal_6
	position.y = -600
	position.x = (randi() % 1700) - 850
	rotation_degrees = randi() % 360
	rotation_speed = randi() % 160 - 80
	movement_speed = randi() % 40 + 60

func _process(delta):
	Game_Start = $"../Menu Scene".Game_Start
	if Game_Start == true:
		queue_free()
	rotation_degrees += rotation_speed * delta
	position.y += movement_speed * delta
	if position.y > 600:
		queue_free()
