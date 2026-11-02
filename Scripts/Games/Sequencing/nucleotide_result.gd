extends Node2D

@onready var Nucleotide_1 = $"../Nucleotide Strain/Nucleotide Set"
@onready var Nucleotide_2 = $"../Nucleotide Strain/Nucleotide Set2"
@onready var Nucleotide_3 = $"../Nucleotide Strain/Nucleotide Set3"
@onready var Nucleotide_4 = $"../Nucleotide Strain/Nucleotide Set4"
@onready var Nucleotide_5 = $"../Nucleotide Strain/Nucleotide Set5"
@onready var Nucleotide_6 = $"../Nucleotide Strain/Nucleotide Set6"
@onready var Nucleotide_7 = $"../Nucleotide Strain/Nucleotide Set7"
@onready var Nucleotide_8 = $"../Nucleotide Strain/Nucleotide Set8"

@onready var Nucleotide2_1 = $"../Nucleotide Strain2/Nucleotide Set"
@onready var Nucleotide2_2 = $"../Nucleotide Strain2/Nucleotide Set2"
@onready var Nucleotide2_3 = $"../Nucleotide Strain2/Nucleotide Set3"
@onready var Nucleotide2_4 = $"../Nucleotide Strain2/Nucleotide Set4"
@onready var Nucleotide2_5 = $"../Nucleotide Strain2/Nucleotide Set5"
@onready var Nucleotide2_6 = $"../Nucleotide Strain2/Nucleotide Set6"
@onready var Nucleotide2_7 = $"../Nucleotide Strain2/Nucleotide Set7"
@onready var Nucleotide2_8 = $"../Nucleotide Strain2/Nucleotide Set8"

@onready var Nucleotide3_1 = $"../Nucleotide Strain3/Nucleotide Set"
@onready var Nucleotide3_2 = $"../Nucleotide Strain3/Nucleotide Set2"
@onready var Nucleotide3_3 = $"../Nucleotide Strain3/Nucleotide Set3"
@onready var Nucleotide3_4 = $"../Nucleotide Strain3/Nucleotide Set4"
@onready var Nucleotide3_5 = $"../Nucleotide Strain3/Nucleotide Set5"
@onready var Nucleotide3_6 = $"../Nucleotide Strain3/Nucleotide Set6"
@onready var Nucleotide3_7 = $"../Nucleotide Strain3/Nucleotide Set7"
@onready var Nucleotide3_8 = $"../Nucleotide Strain3/Nucleotide Set8"

@onready var Result_1 = $"Nucleotide Result/Nucleotide Result 1/Potency"
@onready var Result_2 = $"Nucleotide Result/Nucleotide Result 2/Potency"
@onready var Result_3 = $"Nucleotide Result/Nucleotide Result 3/Potency"
@onready var Result_4 = $"Nucleotide Result/Nucleotide Result 4/Potency"
@onready var Result_5 = $"Nucleotide Result/Nucleotide Result 5/Potency"
@onready var Result_6 = $"Nucleotide Result/Nucleotide Result 6/Potency"
@onready var Result_7 = $"Nucleotide Result/Nucleotide Result 7/Potency"
@onready var Result_8 = $"Nucleotide Result/Nucleotide Result 8/Potency"
@onready var Result_1_Trait = $"Nucleotide Result/Nucleotide Result 1/Trait"
@onready var Result_2_Trait = $"Nucleotide Result/Nucleotide Result 2/Trait"
@onready var Result_3_Trait = $"Nucleotide Result/Nucleotide Result 3/Trait"
@onready var Result_4_Trait = $"Nucleotide Result/Nucleotide Result 4/Trait"
@onready var Result_5_Trait = $"Nucleotide Result/Nucleotide Result 5/Trait"
@onready var Result_6_Trait = $"Nucleotide Result/Nucleotide Result 6/Trait"
@onready var Result_7_Trait = $"Nucleotide Result/Nucleotide Result 7/Trait"
@onready var Result_8_Trait = $"Nucleotide Result/Nucleotide Result 8/Trait"

@onready var Result2_1 = $"Nucleotide Result2/Nucleotide Result 1/Potency"
@onready var Result2_2 = $"Nucleotide Result2/Nucleotide Result 2/Potency"
@onready var Result2_3 = $"Nucleotide Result2/Nucleotide Result 3/Potency"
@onready var Result2_4 = $"Nucleotide Result2/Nucleotide Result 4/Potency"
@onready var Result2_5 = $"Nucleotide Result2/Nucleotide Result 5/Potency"
@onready var Result2_6 = $"Nucleotide Result2/Nucleotide Result 6/Potency"
@onready var Result2_7 = $"Nucleotide Result2/Nucleotide Result 7/Potency"
@onready var Result2_8 = $"Nucleotide Result2/Nucleotide Result 8/Potency"
@onready var Result2_1_Trait = $"Nucleotide Result2/Nucleotide Result 1/Trait"
@onready var Result2_2_Trait = $"Nucleotide Result2/Nucleotide Result 2/Trait"
@onready var Result2_3_Trait = $"Nucleotide Result2/Nucleotide Result 3/Trait"
@onready var Result2_4_Trait = $"Nucleotide Result2/Nucleotide Result 4/Trait"
@onready var Result2_5_Trait = $"Nucleotide Result2/Nucleotide Result 5/Trait"
@onready var Result2_6_Trait = $"Nucleotide Result2/Nucleotide Result 6/Trait"
@onready var Result2_7_Trait = $"Nucleotide Result2/Nucleotide Result 7/Trait"
@onready var Result2_8_Trait = $"Nucleotide Result2/Nucleotide Result 8/Trait"

@onready var Result3_1 = $"Nucleotide Result3/Nucleotide Result 1/Potency"
@onready var Result3_2 = $"Nucleotide Result3/Nucleotide Result 2/Potency"
@onready var Result3_3 = $"Nucleotide Result3/Nucleotide Result 3/Potency"
@onready var Result3_4 = $"Nucleotide Result3/Nucleotide Result 4/Potency"
@onready var Result3_5 = $"Nucleotide Result3/Nucleotide Result 5/Potency"
@onready var Result3_6 = $"Nucleotide Result3/Nucleotide Result 6/Potency"
@onready var Result3_7 = $"Nucleotide Result3/Nucleotide Result 7/Potency"
@onready var Result3_8 = $"Nucleotide Result3/Nucleotide Result 8/Potency"
@onready var Result3_1_Trait = $"Nucleotide Result3/Nucleotide Result 1/Trait"
@onready var Result3_2_Trait = $"Nucleotide Result3/Nucleotide Result 2/Trait"
@onready var Result3_3_Trait = $"Nucleotide Result3/Nucleotide Result 3/Trait"
@onready var Result3_4_Trait = $"Nucleotide Result3/Nucleotide Result 4/Trait"
@onready var Result3_5_Trait = $"Nucleotide Result3/Nucleotide Result 5/Trait"
@onready var Result3_6_Trait = $"Nucleotide Result3/Nucleotide Result 6/Trait"
@onready var Result3_7_Trait = $"Nucleotide Result3/Nucleotide Result 7/Trait"
@onready var Result3_8_Trait = $"Nucleotide Result3/Nucleotide Result 8/Trait"

@onready var Base = $".."

var Potencies = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,]
var Traits = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",]

var Longevity = 0
var Growth = 0
var Yield = 0
var Survivability = 0
var Positive = 0

var Nucleotide_Strain = 0
var Nucleotide_Strain2 = 0
var Nucleotide_Strain3 = 0

#Nucleotide Strain
var NS1_Longevity = 0
var NS1_Growth = 0
var NS1_Yield = 0
var NS1_Survivability = 0

var NS2_Longevity = 0
var NS2_Growth = 0
var NS2_Yield = 0
var NS2_Survivability = 0

var NS3_Longevity = 0
var NS3_Growth = 0
var NS3_Yield = 0
var NS3_Survivability = 0

var Sequence_Time = 0
var Sequence_Timer = false

var Sequence_Timer_Max = 15 

var Max_Range = 8

func _process(delta):
	Sequence_Timer_Max = Base.Seconds_To_Sequence
	$Label/TextureProgressBar.max_value = Sequence_Timer_Max
	if Sequence_Timer == true && $".".visible == true:
		if Sequence_Time < Sequence_Timer_Max:
			if Sequence_Time < 0 == false:
				$"../Tutorial Tab/Tutorial Button".disabled = true
				Sequence_Time += 1 * delta
				$"Finalize Button".disabled = true
			$Label.visible = true
			$Label/TextureProgressBar.value = Sequence_Time
		elif Sequence_Time >= Sequence_Timer_Max:
			$"../Tutorial Tab/Tutorial Button".disabled = false
			_Sequence()
			$Label.visible = false
			$Label/TextureProgressBar.value = 0
			Sequence_Time = 0
			Sequence_Timer = false
	else:
		$"../Tutorial Tab/Tutorial Button".disabled = false
		Sequence_Time = 0
		Sequence_Timer = false

func _on_sequence_button_button_up() -> void:
	$"../Sequence Button/Interact".play()
	Sequence_Timer = true

func _Nucleotide_Result_Func():
	if $"..".Specific_Potency == true:
		Result_1.text = str(Nucleotide_1.Stats[0])
		Result_1.modulate = Nucleotide_1.modulation
		Result_2.text = str(Nucleotide_2.Stats[0])
		Result_2.modulate = Nucleotide_2.modulation
		Result_3.text = str(Nucleotide_3.Stats[0])
		Result_3.modulate = Nucleotide_3.modulation
		Result_4.text = str(Nucleotide_4.Stats[0])
		Result_4.modulate = Nucleotide_4.modulation
		Result_5.text = str(Nucleotide_5.Stats[0])
		Result_5.modulate = Nucleotide_5.modulation
		Result_6.text = str(Nucleotide_6.Stats[0])
		Result_6.modulate = Nucleotide_6.modulation
		Result_7.text = str(Nucleotide_7.Stats[0])
		Result_7.modulate = Nucleotide_7.modulation
		Result_8.text = str(Nucleotide_8.Stats[0])
		Result_8.modulate = Nucleotide_8.modulation
		
		Result2_1.text = str(Nucleotide2_1.Stats[0])
		Result2_1.modulate = Nucleotide2_1.modulation
		Result2_2.text = str(Nucleotide2_2.Stats[0])
		Result2_2.modulate = Nucleotide2_2.modulation
		Result2_3.text = str(Nucleotide2_3.Stats[0])
		Result2_3.modulate = Nucleotide2_3.modulation
		Result2_4.text = str(Nucleotide2_4.Stats[0])
		Result2_4.modulate = Nucleotide2_4.modulation
		Result2_5.text = str(Nucleotide2_5.Stats[0])
		Result2_5.modulate = Nucleotide2_5.modulation
		Result2_6.text = str(Nucleotide2_6.Stats[0])
		Result2_6.modulate = Nucleotide2_6.modulation
		Result2_7.text = str(Nucleotide2_7.Stats[0])
		Result2_7.modulate = Nucleotide2_7.modulation
		Result2_8.text = str(Nucleotide2_8.Stats[0])
		Result2_8.modulate = Nucleotide2_8.modulation
		
		Result3_1.text = str(Nucleotide3_1.Stats[0])
		Result3_1.modulate = Nucleotide3_1.modulation
		Result3_2.text = str(Nucleotide3_2.Stats[0])
		Result3_2.modulate = Nucleotide3_2.modulation
		Result3_3.text = str(Nucleotide3_3.Stats[0])
		Result3_3.modulate = Nucleotide3_3.modulation
		Result3_4.text = str(Nucleotide3_4.Stats[0])
		Result3_4.modulate = Nucleotide3_4.modulation
		Result3_5.text = str(Nucleotide3_5.Stats[0])
		Result3_5.modulate = Nucleotide3_5.modulation
		Result3_6.text = str(Nucleotide3_6.Stats[0])
		Result3_6.modulate = Nucleotide3_6.modulation
		Result3_7.text = str(Nucleotide3_7.Stats[0])
		Result3_7.modulate = Nucleotide3_7.modulation
		Result3_8.text = str(Nucleotide3_8.Stats[0])
		Result3_8.modulate = Nucleotide3_8.modulation
		
		Result_1_Trait.text = str(Nucleotide_1.Stats[1])
		Result_1_Trait.modulate = Nucleotide_1.modulation_2
		Result_2_Trait.text = str(Nucleotide_2.Stats[1])
		Result_2_Trait.modulate = Nucleotide_2.modulation_2
		Result_3_Trait.text = str(Nucleotide_3.Stats[1])
		Result_3_Trait.modulate = Nucleotide_3.modulation_2
		Result_4_Trait.text = str(Nucleotide_4.Stats[1])
		Result_4_Trait.modulate = Nucleotide_4.modulation_2
		Result_5_Trait.text = str(Nucleotide_5.Stats[1])
		Result_5_Trait.modulate = Nucleotide_5.modulation_2
		Result_6_Trait.text = str(Nucleotide_6.Stats[1])
		Result_6_Trait.modulate = Nucleotide_6.modulation_2
		Result_7_Trait.text = str(Nucleotide_7.Stats[1])
		Result_7_Trait.modulate = Nucleotide_7.modulation_2
		Result_8_Trait.text = str(Nucleotide_8.Stats[1])
		Result_8_Trait.modulate = Nucleotide_8.modulation_2
		
		Result2_1_Trait.text = str(Nucleotide2_1.Stats[1])
		Result2_1_Trait.modulate = Nucleotide2_1.modulation_2
		Result2_2_Trait.text = str(Nucleotide2_2.Stats[1])
		Result2_2_Trait.modulate = Nucleotide2_2.modulation_2
		Result2_3_Trait.text = str(Nucleotide2_3.Stats[1])
		Result2_3_Trait.modulate = Nucleotide2_3.modulation_2
		Result2_4_Trait.text = str(Nucleotide2_4.Stats[1])
		Result2_4_Trait.modulate = Nucleotide2_4.modulation_2
		Result2_5_Trait.text = str(Nucleotide2_5.Stats[1])
		Result2_5_Trait.modulate = Nucleotide2_5.modulation_2
		Result2_6_Trait.text = str(Nucleotide2_6.Stats[1])
		Result2_6_Trait.modulate = Nucleotide2_6.modulation_2
		Result2_7_Trait.text = str(Nucleotide2_7.Stats[1])
		Result2_7_Trait.modulate = Nucleotide2_7.modulation_2
		Result2_8_Trait.text = str(Nucleotide2_8.Stats[1])
		Result2_8_Trait.modulate = Nucleotide2_8.modulation_2
		
		Result3_1_Trait.text = str(Nucleotide3_1.Stats[1])
		Result3_1_Trait.modulate = Nucleotide3_1.modulation_2
		Result3_2_Trait.text = str(Nucleotide3_2.Stats[1])
		Result3_2_Trait.modulate = Nucleotide3_2.modulation_2
		Result3_3_Trait.text = str(Nucleotide3_3.Stats[1])
		Result3_3_Trait.modulate = Nucleotide3_3.modulation_2
		Result3_4_Trait.text = str(Nucleotide3_4.Stats[1])
		Result3_4_Trait.modulate = Nucleotide3_4.modulation_2
		Result3_5_Trait.text = str(Nucleotide3_5.Stats[1])
		Result3_5_Trait.modulate = Nucleotide3_5.modulation_2
		Result3_6_Trait.text = str(Nucleotide3_6.Stats[1])
		Result3_6_Trait.modulate = Nucleotide3_6.modulation_2
		Result3_7_Trait.text = str(Nucleotide3_7.Stats[1])
		Result3_7_Trait.modulate = Nucleotide3_7.modulation_2
		Result3_8_Trait.text = str(Nucleotide3_8.Stats[1])
		Result3_8_Trait.modulate = Nucleotide3_8.modulation_2
	else:
		if Nucleotide_1.Stats[0] > 0:
			Result_1.text = str("+")
			Result_1.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result_1.text = str("-")
			Result_1.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide_2.Stats[0] > 0:
			Result_2.text = str("+")
			Result_2.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result_2.text = str("-")
			Result_2.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide_3.Stats[0] > 0:
			Result_3.text = str("+")
			Result_3.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result_3.text = str("-")
			Result_3.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide_4.Stats[0] > 0:
			Result_4.text = str("+")
			Result_4.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result_4.text = str("-")
			Result_4.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide_5.Stats[0] > 0:
			Result_5.text = str("+")
			Result_5.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result_5.text = str("-")
			Result_5.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide_6.Stats[0] > 0:
			Result_6.text = str("+")
			Result_6.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result_6.text = str("-")
			Result_6.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide_7.Stats[0] > 0:
			Result_7.text = str("+")
			Result_7.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result_7.text = str("-")
			Result_7.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide_8.Stats[0] > 0:
			Result_8.text = str("+")
			Result_8.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result_8.text = str("-")
			Result_8.modulate = Color(0.726, 0.0, 0.0, 1.0)

		if Nucleotide2_1.Stats[0] > 0:
			Result2_1.text = str("+")
			Result2_1.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result2_1.text = str("-")
			Result2_1.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide2_2.Stats[0] > 0:
			Result2_2.text = str("+")
			Result2_2.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result2_2.text = str("-")
			Result2_2.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide2_3.Stats[0] > 0:
			Result2_3.text = str("+")
			Result2_3.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result2_3.text = str("-")
			Result2_3.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide2_4.Stats[0] > 0:
			Result2_4.text = str("+")
			Result2_4.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result2_4.text = str("-")
			Result2_4.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide2_5.Stats[0] > 0:
			Result2_5.text = str("+")
			Result2_5.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result2_5.text = str("-")
			Result2_5.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide2_6.Stats[0] > 0:
			Result2_6.text = str("+")
			Result2_6.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result2_6.text = str("-")
			Result2_6.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide2_7.Stats[0] > 0:
			Result2_7.text = str("+")
			Result2_7.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result2_7.text = str("-")
			Result2_7.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide2_8.Stats[0] > 0:
			Result2_8.text = str("+")
			Result2_8.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result2_8.text = str("-")
			Result2_8.modulate = Color(0.726, 0.0, 0.0, 1.0)

		if Nucleotide3_1.Stats[0] > 0:
			Result3_1.text = str("+")
			Result3_1.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result3_1.text = str("-")
			Result3_1.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide3_2.Stats[0] > 0:
			Result3_2.text = str("+")
			Result3_2.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result3_2.text = str("-")
			Result3_2.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide3_3.Stats[0] > 0:
			Result3_3.text = str("+")
			Result3_3.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result3_3.text = str("-")
			Result3_3.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide3_4.Stats[0] > 0:
			Result3_4.text = str("+")
			Result3_4.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result3_4.text = str("-")
			Result3_4.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide3_5.Stats[0] > 0:
			Result3_5.text = str("+")
			Result3_5.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result3_5.text = str("-")
			Result3_5.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide3_6.Stats[0] > 0:
			Result3_6.text = str("+")
			Result3_6.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result3_6.text = str("-")
			Result3_6.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide3_7.Stats[0] > 0:
			Result3_7.text = str("+")
			Result3_7.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result3_7.text = str("-")
			Result3_7.modulate = Color(0.726, 0.0, 0.0, 1.0)
		if Nucleotide3_8.Stats[0] > 0:
			Result3_8.text = str("+")
			Result3_8.modulate = Color(0.0, 0.395, 0.059, 1.0)
		else:
			Result3_8.text = str("-")
			Result3_8.modulate = Color(0.726, 0.0, 0.0, 1.0)
		
		Result_1_Trait.text = str(Nucleotide_1.Stats[1])
		Result_1_Trait.modulate = Nucleotide_1.modulation_2
		Result_2_Trait.text = str(Nucleotide_2.Stats[1])
		Result_2_Trait.modulate = Nucleotide_2.modulation_2
		Result_3_Trait.text = str(Nucleotide_3.Stats[1])
		Result_3_Trait.modulate = Nucleotide_3.modulation_2
		Result_4_Trait.text = str(Nucleotide_4.Stats[1])
		Result_4_Trait.modulate = Nucleotide_4.modulation_2
		Result_5_Trait.text = str(Nucleotide_5.Stats[1])
		Result_5_Trait.modulate = Nucleotide_5.modulation_2
		Result_6_Trait.text = str(Nucleotide_6.Stats[1])
		Result_6_Trait.modulate = Nucleotide_6.modulation_2
		Result_7_Trait.text = str(Nucleotide_7.Stats[1])
		Result_7_Trait.modulate = Nucleotide_7.modulation_2
		Result_8_Trait.text = str(Nucleotide_8.Stats[1])
		Result_8_Trait.modulate = Nucleotide_8.modulation_2
		
		Result2_1_Trait.text = str(Nucleotide2_1.Stats[1])
		Result2_1_Trait.modulate = Nucleotide2_1.modulation_2
		Result2_2_Trait.text = str(Nucleotide2_2.Stats[1])
		Result2_2_Trait.modulate = Nucleotide2_2.modulation_2
		Result2_3_Trait.text = str(Nucleotide2_3.Stats[1])
		Result2_3_Trait.modulate = Nucleotide2_3.modulation_2
		Result2_4_Trait.text = str(Nucleotide2_4.Stats[1])
		Result2_4_Trait.modulate = Nucleotide2_4.modulation_2
		Result2_5_Trait.text = str(Nucleotide2_5.Stats[1])
		Result2_5_Trait.modulate = Nucleotide2_5.modulation_2
		Result2_6_Trait.text = str(Nucleotide2_6.Stats[1])
		Result2_6_Trait.modulate = Nucleotide2_6.modulation_2
		Result2_7_Trait.text = str(Nucleotide2_7.Stats[1])
		Result2_7_Trait.modulate = Nucleotide2_7.modulation_2
		Result2_8_Trait.text = str(Nucleotide2_8.Stats[1])
		Result2_8_Trait.modulate = Nucleotide2_8.modulation_2
		
		Result3_1_Trait.text = str(Nucleotide3_1.Stats[1])
		Result3_1_Trait.modulate = Nucleotide3_1.modulation_2
		Result3_2_Trait.text = str(Nucleotide3_2.Stats[1])
		Result3_2_Trait.modulate = Nucleotide3_2.modulation_2
		Result3_3_Trait.text = str(Nucleotide3_3.Stats[1])
		Result3_3_Trait.modulate = Nucleotide3_3.modulation_2
		Result3_4_Trait.text = str(Nucleotide3_4.Stats[1])
		Result3_4_Trait.modulate = Nucleotide3_4.modulation_2
		Result3_5_Trait.text = str(Nucleotide3_5.Stats[1])
		Result3_5_Trait.modulate = Nucleotide3_5.modulation_2
		Result3_6_Trait.text = str(Nucleotide3_6.Stats[1])
		Result3_6_Trait.modulate = Nucleotide3_6.modulation_2
		Result3_7_Trait.text = str(Nucleotide3_7.Stats[1])
		Result3_7_Trait.modulate = Nucleotide3_7.modulation_2
		Result3_8_Trait.text = str(Nucleotide3_8.Stats[1])
		Result3_8_Trait.modulate = Nucleotide3_8.modulation_2

func _Potency_Finalization():
	$"Finalize Button".disabled = true
	
	NS1_Longevity = 0
	NS1_Growth = 0
	NS1_Yield = 0
	NS1_Survivability = 0
	NS2_Longevity = 0
	NS2_Growth = 0
	NS2_Yield = 0
	NS2_Survivability = 0
	NS3_Longevity = 0
	NS3_Growth = 0
	NS3_Yield = 0
	NS3_Survivability = 0

	Longevity = 0
	Growth = 0
	Yield = 0
	Survivability = 0
	Positive = 0
	Nucleotide_Strain = 0
	Nucleotide_Strain2 = 0
	Nucleotide_Strain3 = 0
	
	for i in range(0,8):
		if Potencies[i] >= 0:
			Nucleotide_Strain += 1
		if Traits[i] == "Longevity":
			NS1_Longevity += 1
		if Traits[i] == "Growth":
			NS1_Growth += 1
		if Traits[i] == "Yield":
			NS1_Yield += 1
		if Traits[i] == "Survivability":
			NS1_Survivability += 1
	for i in range(8,16):
		if Potencies[i] >= 0:
			Nucleotide_Strain2 += 1
		if Traits[i] == "Longevity":
			NS2_Longevity += 1
		if Traits[i] == "Growth":
			NS2_Growth += 1
		if Traits[i] == "Yield":
			NS2_Yield += 1
		if Traits[i] == "Survivability":
			NS2_Survivability += 1
	for i in range(16,24):
		if Potencies[i] >= 0:
			Nucleotide_Strain3 += 1
		if Traits[i] == "Longevity":
			NS3_Longevity += 1
		if Traits[i] == "Growth":
			NS3_Growth += 1
		if Traits[i] == "Yield":
			NS3_Yield += 1
		if Traits[i] == "Survivability":
			NS3_Survivability += 1
	for i in range(0, Max_Range):
		if Traits[i] == "Longevity":
			Longevity += Potencies[i]
			if Potencies[i] >= $"..".Major_Potency_Min:
				Positive += 1
		if Traits[i] == "Growth":
			Growth += Potencies[i]
			if Potencies[i] >= $"..".Major_Potency_Min:
				Positive += 1
		if Traits[i] == "Yield":
			Yield += Potencies[i]
			if Potencies[i] >= $"..".Major_Potency_Min:
				Positive += 1
		if Traits[i] == "Survivability":
			Survivability += Potencies[i]
			if Potencies[i] >= $"..".Major_Potency_Min:
				Positive += 1
		i += 1
	$Longevity.text = str(Longevity)
	$Growth.text = str(Growth)
	$Yield.text = str(Yield)
	$Survivability.text = str(Survivability)
	if $"..".Second_Nucleotide_Strain == true && $"..".Third_Nucleotide_Strain == true:
		if Nucleotide_Strain == 8 && Nucleotide_Strain2 == 8 && Nucleotide_Strain3 == 8:
			$"Finalize Button".disabled = false
	elif $"..".Second_Nucleotide_Strain == true && $"..".Third_Nucleotide_Strain == false:
		if Nucleotide_Strain == 8 && Nucleotide_Strain2 == 8:
			$"Finalize Button".disabled = false
	else:
		for i in range(0,8):
			if Nucleotide_Strain == 8:
				$"Finalize Button".disabled = false

func _on_finalize_button_pressed() -> void:
	$"Finalize Button/Interact".play()
	$"..".Longevity += Longevity
	$"..".Growth += Growth
	$"..".Yield += Yield
	$"..".Survivability += Survivability
	if Nucleotide_Strain == 8:
		$"..".Completed_Sequences += 1
	if Nucleotide_Strain2 == 8:
		$"..".Completed_Sequences += 1
	if Nucleotide_Strain3 == 8:
		$"..".Completed_Sequences += 1
	$"Completed Sequences Amount".text = str($"..".Completed_Sequences)
	$".".visible = false
	$"../Close Button Sequencing".disabled = false

func _Sequence():
	_Nucleotide_Result_Func()
	Potencies = [Nucleotide_1.Stats[0], Nucleotide_2.Stats[0], Nucleotide_3.Stats[0], Nucleotide_4.Stats[0], Nucleotide_5.Stats[0], Nucleotide_6.Stats[0], Nucleotide_7.Stats[0],
	Nucleotide_8.Stats[0], Nucleotide2_1.Stats[0], Nucleotide2_2.Stats[0], Nucleotide2_3.Stats[0], Nucleotide2_4.Stats[0], Nucleotide2_5.Stats[0], Nucleotide2_6.Stats[0],
	Nucleotide2_7.Stats[0], Nucleotide2_8.Stats[0], Nucleotide3_1.Stats[0], Nucleotide3_2.Stats[0], Nucleotide3_3.Stats[0], Nucleotide3_4.Stats[0], Nucleotide3_5.Stats[0], 
	Nucleotide3_6.Stats[0], Nucleotide3_7.Stats[0], Nucleotide3_8.Stats[0]]
	Traits = [Nucleotide_1.Stats[1], Nucleotide_2.Stats[1], Nucleotide_3.Stats[1], Nucleotide_4.Stats[1], Nucleotide_5.Stats[1], Nucleotide_6.Stats[1], Nucleotide_7.Stats[1],
	Nucleotide_8.Stats[1], Nucleotide2_1.Stats[1], Nucleotide2_2.Stats[1], Nucleotide2_3.Stats[1], Nucleotide2_4.Stats[1], Nucleotide2_5.Stats[1], Nucleotide2_6.Stats[1],
	Nucleotide2_7.Stats[1], Nucleotide2_8.Stats[1], Nucleotide3_1.Stats[1], Nucleotide3_2.Stats[1], Nucleotide3_3.Stats[1], Nucleotide3_4.Stats[1], Nucleotide3_5.Stats[1], 
	Nucleotide3_6.Stats[1], Nucleotide3_7.Stats[1], Nucleotide3_8.Stats[1]]
	_Potency_Finalization()
	if $"..".First_Sequence == false:
		$"..".First_Sequence = true


func _on_finalize_button_mouse_entered() -> void:
	if $"Finalize Button".disabled == false:
		$"Finalize Button/Hover".play()


func _on_close_button_mouse_entered() -> void:
	$"Close Button/Hover".play()


func _on_refresh_button_down() -> void:
	pass # Replace with function body.
