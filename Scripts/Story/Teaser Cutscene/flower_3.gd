extends Node2D

var Legs_Skewing_Right = true
var Skew = 0.01


var Breath_in = true
var Breath = 0.005

func _process(delta):
	Breathing(delta)
	#Skewing(delta)

func Breathing(delta):
# 1.02 / 1.00 / 0.98
# 0.01 - abs(1 - $"Right Leg/Main Sprout".scale.y)
# >  / 0.01 
# 0.005 / 0.01 / 0.005
	Breath = 0.005 - ((abs(1 - $"Bottom/Left Leg".scale.y)) / 8)
	if Breath_in == true:
		if $"Bottom/Left Leg".scale.y < 1.02:
			$"Bottom/Left Leg".scale.y += Breath * delta
			$"Bottom/Right Leg".scale.y += Breath * delta
		else:
			Breath_in = false
	else:
		if $"Bottom/Left Leg".scale.y > 0.98:
			$"Bottom/Left Leg".scale.y -= Breath * delta
			$"Bottom/Right Leg".scale.y -= Breath * delta
		else:
			Breath_in = true

func Skewing(delta):
	Skew = 0.01 - ( abs($"Bottom/Left Leg".skew) / 20)
	if Legs_Skewing_Right == true:
		if $"Bottom/Left Leg".skew < 0.1:
			$"Bottom/Left Leg".skew += Skew * delta
			$"Bottom/Left Leg".skew += Skew * delta
			$"Bottom/Right Leg".skew += Skew * delta
			
			#$"Left Leg/Left Sprout".skew += (Skew / 2) * delta
			#$"Right Leg/Main Sprout".skew += (Skew / 2) * delta
			#$"Right Leg/Right Sprout".skew += (Skew / 2) * delta
			
			#$"Left Leg/Left Sprout/Left Bulb".skew += (Skew / 4) * delta
			#$"Right Leg/Main Sprout/Main Bulb".skew += (Skew / 4) * delta
			#$"Right Leg/Right Sprout/Right Bulb".skew += (Skew / 4) * delta
		else:
			Legs_Skewing_Right = false
	if Legs_Skewing_Right == false:
		if $"Bottom/Left Leg".skew > -0.1:
			$"Bottom/Left Leg".skew -= Skew * delta
			$"Bottom/Left Leg".skew -= Skew * delta 
			$"Bottom/Right Leg".skew -= Skew * delta
		else:
			Legs_Skewing_Right = true
