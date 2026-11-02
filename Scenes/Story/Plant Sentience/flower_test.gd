extends Node2D

var Skew_Max = 0.5
var Rotate_Max = 0.5
var Acceleration = 0
var Acceleration_Speed = 0.05
var Acceleration_Max = 0.1
var Acceleration_Min = -0.1
var Acceleration_True = true


@onready var Stem_1 = $"Stem 1"
@onready var Stem_2 = $"Stem 1/Stem 2"
@onready var Stem_3 = $"Stem 1/Stem 2/Stem 3"
@onready var Flower = $"Stem 1/Stem 2/Stem 3/Flower"

func _process(delta):
	if (Acceleration < Acceleration_Max) && Acceleration_True == true:
		Acceleration += Acceleration_Speed * delta
	elif Acceleration > Acceleration_Min:
		Acceleration_True = false
		Acceleration -= Acceleration_Speed * delta
	else:
		Acceleration_True = true
	Stem_1.rotation_degrees += Acceleration * delta
	Stem_2.rotation_degrees += Acceleration * delta
	Stem_3.rotation_degrees += Acceleration * delta
