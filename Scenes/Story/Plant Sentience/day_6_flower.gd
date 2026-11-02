extends Node2D

var Skew_Max = 0.5
var Rotate_Max = 0.5
var Acceleration = 0
var Acceleration_Speed = 0.05
var Acceleration_Max = 0.1
var Acceleration_Min = -0.1
var Acceleration_True = true

var State = str("Seeking")
var Leaf_1_Scale_Acceleration = 0
var Leaf_1_Skew_Acceleration = 0

var Leaf_2_Scale_Acceleration = 0
var Leaf_2_Skew_Acceleration = 0

@onready var Stem_1 = $"Stem 1"
@onready var Stem_2 = $"Stem 1/Stem 2"
@onready var Stem_3 = $"Stem 1/Stem 2/Stem 3"
@onready var Flower = $"Stem 1/Stem 2/Stem 3/Flower"

@onready var Leaf_1 = $"Stem 1/Stem 2/Leaf 1"
@onready var Leaf_1_Target_Scale_Y = 1.1
@onready var Leaf_1_Base_Scale_Y = 1
@onready var Leaf_1_Target_Skew = -5
@onready var Leaf_1_Base_Skew = 0

@onready var Leaf_2 = $"Stem 1/Stem 2/Stem 3/Leaf 2"
@onready var Leaf_2_Target_Scale_Y = 1.1
@onready var Leaf_2_Base_Scale_Y = 1
@onready var Leaf_2_Target_Skew = 5
@onready var Leaf_2_Base_Skew = 0

func _process(delta):

	if Input.is_action_just_pressed("Move Down"):
		if State == str("Seeking"):
			State = str("Idle")
		else:
			State = str("Seeking")
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
	if State == "Seeking":
		_Leaf_Targets(delta)
	if State == "Idle": 
		_Leaf_Base(delta)

func _Leaf_Targets(delta):
	## Leaf 1
	# Scale to Target
	if Leaf_1.scale.y < Leaf_1_Target_Scale_Y:
		Leaf_1.scale.y += Leaf_1_Scale_Acceleration * delta
		if Leaf_1_Scale_Acceleration < 0.1:
			Leaf_1_Scale_Acceleration += 0.02 * delta
	elif Leaf_1.scale.y > Leaf_1_Target_Scale_Y:
		Leaf_1_Scale_Acceleration = 0
		Leaf_1.scale.y = Leaf_1_Target_Scale_Y
	# Skew to Target
	if Leaf_1.skew > deg_to_rad(Leaf_1_Target_Skew):
		Leaf_1.skew += Leaf_1_Skew_Acceleration * delta
		if Leaf_1_Skew_Acceleration > -0.1:
			Leaf_1_Skew_Acceleration -= 0.02 * delta
		elif Leaf_1.skew < deg_to_rad(Leaf_1_Target_Skew):
			Leaf_1_Skew_Acceleration = 0
			Leaf_1.skew = deg_to_rad(Leaf_1_Target_Skew)
		if Leaf_1_Skew_Acceleration > 0:
			Leaf_1_Skew_Acceleration = 0
	## Leaf 2
	# Scale to Target
	if Leaf_2.scale.y < Leaf_2_Target_Scale_Y:
		Leaf_2.scale.y += Leaf_2_Scale_Acceleration * delta
		if Leaf_2_Scale_Acceleration < 0.1:
			Leaf_2_Scale_Acceleration += 0.02 * delta
	elif Leaf_2.scale.y > Leaf_2_Target_Scale_Y:
		Leaf_2_Scale_Acceleration = 0
		Leaf_2.scale.y = Leaf_2_Target_Scale_Y
	# Skew to Target
	if Leaf_2.skew < deg_to_rad(Leaf_2_Target_Skew):
		Leaf_2.skew += Leaf_2_Skew_Acceleration * delta
		if Leaf_2_Skew_Acceleration < 0.1:
			Leaf_2_Skew_Acceleration += 0.02 * delta
		elif Leaf_2.skew > deg_to_rad(Leaf_2_Target_Skew):
			Leaf_2_Skew_Acceleration = 0
			Leaf_2.skew = deg_to_rad(Leaf_2_Target_Skew)
		if Leaf_2_Skew_Acceleration < 0:
			Leaf_2_Skew_Acceleration = 0

func _Leaf_Base(delta):
	## Leaf 1
	# Scale to Base
	if Leaf_1.scale.y > Leaf_1_Base_Scale_Y:
		Leaf_1.scale.y += Leaf_1_Scale_Acceleration * delta
		if Leaf_1_Scale_Acceleration > -0.1:
			Leaf_1_Scale_Acceleration -= 0.02 * delta
	elif Leaf_1.scale.y < Leaf_1_Base_Scale_Y:
		Leaf_1_Scale_Acceleration = 0
		Leaf_1.scale.y = Leaf_1_Base_Scale_Y
	# Skew to Base
	if Leaf_1.skew < deg_to_rad(Leaf_1_Base_Skew):
		Leaf_1.skew += Leaf_1_Skew_Acceleration * delta
		if Leaf_1_Skew_Acceleration < 0.1:
			Leaf_1_Skew_Acceleration += 0.02 * delta
		elif Leaf_1.skew > deg_to_rad(Leaf_1_Base_Skew):
			Leaf_1_Skew_Acceleration = 0
			Leaf_1.skew = deg_to_rad(Leaf_1_Base_Skew)
		if Leaf_1_Skew_Acceleration < 0:
			Leaf_1_Skew_Acceleration = 0
	## Leaf 2
	# Scale to Base
	if Leaf_2.scale.y > Leaf_2_Base_Scale_Y:
		Leaf_2.scale.y += Leaf_2_Scale_Acceleration * delta
		if Leaf_2_Scale_Acceleration > -0.1:
			Leaf_2_Scale_Acceleration -= 0.02 * delta
	elif Leaf_2.scale.y < Leaf_2_Base_Scale_Y:
		Leaf_2_Scale_Acceleration = 0
		Leaf_2.scale.y = Leaf_2_Base_Scale_Y
	# Skew to Base
	if Leaf_2.skew > deg_to_rad(Leaf_2_Base_Skew):
		Leaf_2.skew += Leaf_2_Skew_Acceleration * delta
		if Leaf_2_Skew_Acceleration > -0.1:
			Leaf_2_Skew_Acceleration -= 0.02 * delta
		elif Leaf_2.skew < deg_to_rad(Leaf_2_Base_Skew):
			Leaf_2_Skew_Acceleration = 0
			Leaf_2.skew = deg_to_rad(Leaf_2_Base_Skew)
		if Leaf_2_Skew_Acceleration > 0:
			Leaf_2_Skew_Acceleration = 0
