extends Node2D

var Plant_List = [Node2D, Node2D, Node2D, Node2D, Node2D, Node2D, Node2D, 
Node2D, Node2D, Node2D, Node2D, Node2D, Node2D, Node2D, 
Node2D, Node2D, Node2D, Node2D, Node2D, Node2D, Node2D,
Node2D, Node2D, Node2D, Node2D, Node2D, Node2D, Node2D,
Node2D, Node2D, Node2D, Node2D, Node2D, Node2D, Node2D]

@export var Expansion_Level_1 = false
@export var Expansion_Level_2 = false
@export var Expansion_Level_3 = false
@export var Expansion_Level_4 = false
@export var Expansion_Level_5 = false

var Expansion_Level_1_Activate = false
var Expansion_Level_2_Activate = false
var Expansion_Level_3_Activate = false
var Expansion_Level_4_Activate = false
var Expansion_Level_5_Activate = false

var Expansion_Level = 0

@export var Heat_Conditioning = false
@export var Frozen_Conditioning = false
@export var Toxic_Conditioning = false
@export var Radioactive_Conditioning = false

# SP means Scientific Points
@export var SP_Flat_Gain = float(1)
@export var SP_Multiplier = float(1)
@export var SP_Combo_Flat_Gain = float(1)
@export var SP_Combo_Excess_Multiplier = float(1)
@export var SP_Combo_Necessity = 7

# GP means Genome Points
@export var GP_Flat_Gain = float(0.25)
@export var GP_Multiplier = float(1)
@export var GP_Combo_Flat_Gain = float(0.5)
@export var GP_Combo_Excess_Multiplier = float(1)
@export var GP_Combo_Necessity = 7

# XP means Specialized Points
@export var XP_Flat_Gain = float(0)
@export var XP_Multiplier = float(1)
@export var XP_Combo_Flat_Gain = float(0.25)
@export var XP_Combo_Excess_Multiplier = float(1)
@export var XP_Combo_Necessity = 7

# Crop
@export var Crop_Flat_Gain = float(1)
@export var Crop_Multiplier = float(1)
@export var Crop_Combo_Flat_Gain = float(0)
@export var Crop_Combo_Excess_Multiplier = float(1)
@export var Crop_Combo_Necessity = 7

@export var Combo_Multiplier_Phase_1 = false
@export var Combo_Multiplier_Phase_2 = false

@export var SP_Combo_Necessity_Level_1 = false
@export var SP_Combo_Necessity_Level_2 = false
@export var SP_Combo_Necessity_Level_3 = false
@export var SP_Combo_Necessity_Level_4 = false
@export var SP_Combo_Necessity_Level_5 = false

@export var GP_Combo_Necessity_Level_1 = false
@export var GP_Combo_Necessity_Level_2 = false
@export var GP_Combo_Necessity_Level_3 = false
@export var GP_Combo_Necessity_Level_4 = false
@export var GP_Combo_Necessity_Level_5 = false

@export var XP_Combo_Necessity_Level_1 = false
@export var XP_Combo_Necessity_Level_2 = false
@export var XP_Combo_Necessity_Level_3 = false
@export var XP_Combo_Necessity_Level_4 = false
@export var XP_Combo_Necessity_Level_5 = false

var SP_Combo_Necessity_Level_1_Activate = false
var SP_Combo_Necessity_Level_2_Activate = false
var SP_Combo_Necessity_Level_3_Activate = false
var SP_Combo_Necessity_Level_4_Activate = false
var SP_Combo_Necessity_Level_5_Activate = false

var GP_Combo_Necessity_Level_1_Activate = false
var GP_Combo_Necessity_Level_2_Activate = false
var GP_Combo_Necessity_Level_3_Activate = false
var GP_Combo_Necessity_Level_4_Activate = false
var GP_Combo_Necessity_Level_5_Activate = false

var XP_Combo_Necessity_Level_1_Activate = false
var XP_Combo_Necessity_Level_2_Activate = false
var XP_Combo_Necessity_Level_3_Activate = false
var XP_Combo_Necessity_Level_4_Activate = false
var XP_Combo_Necessity_Level_5_Activate = false

var Survivability = 0
var Growth = 0
var Yield = 0
var Longevity = 0

#var Total_Flower_Value = float(0)

var SP_S4_sets = 0
var SP_S5_sets = 0
var SP_S6_sets = 0
var GP_S4_sets = 0
var GP_S5_sets = 0
var GP_S6_sets = 0
var XP_S4_sets = 0
var XP_S5_sets = 0
var XP_S6_sets = 0
var Crop_S4_sets = 0
var Crop_S5_sets = 0
var Crop_S6_sets = 0

var SP_S4 = 0
var SP_S5 = 0
var SP_S6 = 0
var GP_S4 = 0
var GP_S5 = 0
var GP_S6 = 0
var XP_S4 = 0
var XP_S5 = 0
var XP_S6 = 0
var Crop_S4 = 0
var Crop_S5 = 0
var Crop_S6 = 0

@export var Seconds_To_Sequence = float(5)

var Sequence_Time = float(0)
var Sequence_Timer = false

var Sequence_Timer_Max = float(5)

var reset = true

func _ready():
	Survivability = $"../Sequencing Game".Survivability
	Growth = $"../Sequencing Game".Growth
	Yield = $"../Sequencing Game".Yield
	Longevity = $"../Sequencing Game".Longevity
	


	Plant_List = [$"Plant Sections36", $"Plant Sections29", $"Plant Sections28", $"Plant Sections26", $"Plant Sections27", $"Plant Sections30", $"Plant Sections42",
	$"Plant Sections35", $"Plant Sections24", $"Plant Sections23", $"Plant Sections21", $"Plant Sections22", $"Plant Sections25", $"Plant Sections41", 
	$"Plant Sections33", $"Plant Sections15", $"Plant Sections9", $"Plant Sections5", $"Plant Sections6", $"Plant Sections19", $"Plant Sections39", 
	$"Plant Sections31", $"Plant Sections13", $"Plant Sections7", $"Plant Sections", $"Plant Sections2", $"Plant Sections17", $"Plant Sections37", 
	$"Plant Sections32", $"Plant Sections14", $"Plant Sections8", $"Plant Sections3", $"Plant Sections4", $"Plant Sections18", $"Plant Sections38",
	$"Plant Sections34", $"Plant Sections16", $"Plant Sections12", $"Plant Sections10", $"Plant Sections11", $"Plant Sections20", $"Plant Sections40",
	$"Plant Sections48", $"Plant Sections46", $"Plant Sections45", $"Plant Sections43", $"Plant Sections44", $"Plant Sections47", $"Plant Sections49"]

func _on_close_button_sequencing_pressed() -> void:
	$Label.visible = false
	visible = false

func _process(delta):
	
	if SP_Combo_Necessity_Level_1 == true && SP_Combo_Necessity_Level_1_Activate == false:
		SP_Combo_Necessity -= 1
		SP_Combo_Necessity_Level_1_Activate = true
	if SP_Combo_Necessity_Level_2 == true && SP_Combo_Necessity_Level_2_Activate == false:
		SP_Combo_Necessity -= 1
		SP_Combo_Necessity_Level_2_Activate = true
	if SP_Combo_Necessity_Level_3 == true && SP_Combo_Necessity_Level_3_Activate == false:
		SP_Combo_Necessity -= 1
		SP_Combo_Necessity_Level_3_Activate = true
	if SP_Combo_Necessity_Level_4 == true && SP_Combo_Necessity_Level_4_Activate == false:
		SP_Combo_Necessity -= 1
		SP_Combo_Necessity_Level_4_Activate = true
	if SP_Combo_Necessity_Level_5 == true && SP_Combo_Necessity_Level_5_Activate == false:
		SP_Combo_Necessity -= 1
		SP_Combo_Necessity_Level_5_Activate = true
	
	if GP_Combo_Necessity_Level_1 == true && GP_Combo_Necessity_Level_1_Activate == false:
		GP_Combo_Necessity -= 1
		GP_Combo_Necessity_Level_1_Activate = true
	if GP_Combo_Necessity_Level_2 == true && GP_Combo_Necessity_Level_2_Activate == false:
		GP_Combo_Necessity -= 1
		GP_Combo_Necessity_Level_2_Activate = true
	if GP_Combo_Necessity_Level_3 == true && GP_Combo_Necessity_Level_3_Activate == false:
		GP_Combo_Necessity -= 1
		GP_Combo_Necessity_Level_3_Activate = true
	if GP_Combo_Necessity_Level_4 == true && GP_Combo_Necessity_Level_4_Activate == false:
		GP_Combo_Necessity -= 1
		GP_Combo_Necessity_Level_4_Activate = true
	if GP_Combo_Necessity_Level_5 == true && GP_Combo_Necessity_Level_5_Activate == false:
		GP_Combo_Necessity -= 1
		GP_Combo_Necessity_Level_5_Activate = true
	
	if XP_Combo_Necessity_Level_1 == true && XP_Combo_Necessity_Level_1_Activate == false:
		XP_Combo_Necessity -= 1
		XP_Combo_Necessity_Level_1_Activate = true
	if XP_Combo_Necessity_Level_2 == true && XP_Combo_Necessity_Level_2_Activate == false:
		XP_Combo_Necessity -= 1
		XP_Combo_Necessity_Level_2_Activate = true
	if XP_Combo_Necessity_Level_3 == true && XP_Combo_Necessity_Level_3_Activate == false:
		XP_Combo_Necessity -= 1
		XP_Combo_Necessity_Level_3_Activate = true
	if XP_Combo_Necessity_Level_4 == true && XP_Combo_Necessity_Level_4_Activate == false:
		XP_Combo_Necessity -= 1
		XP_Combo_Necessity_Level_4_Activate = true
	if XP_Combo_Necessity_Level_5 == true && XP_Combo_Necessity_Level_5_Activate == false:
		XP_Combo_Necessity -= 1
		XP_Combo_Necessity_Level_5_Activate = true
	
	if Expansion_Level_1 == true && Expansion_Level_1_Activate == false:
		Expansion_Level += 1
		Expansion_Level_1_Activate = true
	if Expansion_Level_2 == true && Expansion_Level_2_Activate == false:
		Expansion_Level += 1
		Expansion_Level_2_Activate = true
	if Expansion_Level_3 == true && Expansion_Level_3_Activate == false:
		Expansion_Level += 1
		Expansion_Level_3_Activate = true
	if Expansion_Level_4 == true && Expansion_Level_4_Activate == false:
		Expansion_Level += 1
		Expansion_Level_4_Activate = true
	if Expansion_Level_5 == true && Expansion_Level_5_Activate == false:
		Expansion_Level += 1
		Expansion_Level_5_Activate = true
	
	$"LED Stat Board/Longevity Stat".text = str($"../Sequencing Game".Longevity)
	$"LED Stat Board/Growth Stat".text = str($"../Sequencing Game".Growth)
	$"LED Stat Board/Yield Stat".text = str($"../Sequencing Game".Yield)
	$"LED Stat Board/Survivability Stat".text = str($"../Sequencing Game".Survivability)
	
	Sequence_Timer_Max = Seconds_To_Sequence
	$Label/TextureProgressBar.max_value = Sequence_Timer_Max
	if Sequence_Timer == true && $".".visible == true:
		if Sequence_Time < Sequence_Timer_Max:
			if Sequence_Time < 0 == false:
				Sequence_Time += 1 * delta
			$Label.visible = true
			$Label/TextureProgressBar.value = Sequence_Time
			$"Reset Button".disabled = true
		elif Sequence_Time >= Sequence_Timer_Max:
			_iteration()
			$Label.visible = false
			$Label/TextureProgressBar.value = 0
			Sequence_Time = 0
			Sequence_Timer = false
			$"Reset Button".disabled = false
	else:
		Sequence_Time = 0
		Sequence_Timer = false

	if Input.is_action_just_pressed("Close Menu"):
		visible = false
	if Heat_Conditioning == true:
		$"Climate Button".set_item_disabled(1, false)
		if Frozen_Conditioning == true:
			$"Climate Button".set_item_disabled(2, false)
			if Toxic_Conditioning == true:
				$"Climate Button".set_item_disabled(3, false)
				if Radioactive_Conditioning == true:
					$"Climate Button".set_item_disabled(4, false)
	else:
		$"Climate Label".text = "None"
		$"Climate Button".disabled = true
	
	if $"Sequence Inputs".input_ready == false or $"Sequence Inputs2".input_ready == false or $"Sequence Inputs3".input_ready == false:
		$"Iterate Button".disabled = true
		$"Reset Button".disabled = false
	else:
		reset = false
		$"Iterate Button".disabled = false


func _on_iterate_button_pressed() -> void:
	Sequence_Timer = true
	$"Climate Button".disabled = true
	$"Iterate Button/Interact".play()

func _iteration():
	for i in range(0, 49):
		Plant_List[i]._SurviveChance()
		if Plant_List[i].healthy == true:
			Plant_List[i]._EvolveChance()
	_Vertical_Check()
	_Horizontal_Check()
	_Diagonal_Check()
	_Anti_Diagonal_Check()
	$"Climate Button".disabled = true
	#check for combos once while plants are unhealthy.


func _on_climate_button_item_selected(index: int) -> void:
	$"Climate Button/Interact".play()
	for i in range(0, 49):
		Plant_List[i]._modulation(index)


func _on_reset_button_pressed() -> void:
	$"Reset Button/Interact".play()
	if reset == false:
		for i in range(0, 49):
			Plant_List[i].iteration = 0
			Plant_List[i].evolve = true
			Plant_List[i].healthy = true
			Plant_List[i].stage[0] = "Stage 1"
			Plant_List[i].stage[1] = 0
			Plant_List[i].evolve_chance = 100
			Plant_List[i].survival_chance = 100
			Plant_List[i].reset = true

		$"Sequence Inputs".input_ready = false
		$"Sequence Inputs2".input_ready = false
		$"Sequence Inputs3".input_ready = false
		$"Reset Button".disabled = true

		if Combo_Multiplier_Phase_2 == true:
			$"..".Scientific_Research_Points += SP_Multiplier * float(SP_S4_sets) / (SP_Combo_Necessity * SP_Combo_Necessity) + SP_Combo_Flat_Gain
			$"..".Genome_Research_Points += GP_Multiplier * float(GP_S4_sets) / (GP_Combo_Necessity * GP_Combo_Necessity) + GP_Combo_Flat_Gain
			$"..".Specialized_Research_Points += XP_Multiplier * float(XP_S4_sets) / (XP_Combo_Necessity * XP_Combo_Necessity) + XP_Combo_Flat_Gain
			

		if Combo_Multiplier_Phase_1 == true:
			$"..".Scientific_Research_Points += SP_Multiplier * float(SP_S5_sets) / (SP_Combo_Necessity * SP_Combo_Necessity) + SP_Combo_Flat_Gain
			$"..".Genome_Research_Points += GP_Multiplier * float(GP_S5_sets) / (GP_Combo_Necessity * GP_Combo_Necessity) + GP_Combo_Flat_Gain
			$"..".Specialized_Research_Points += XP_Multiplier * float(XP_S5_sets) / (XP_Combo_Necessity * XP_Combo_Necessity) + XP_Combo_Flat_Gain

		$"..".Scientific_Research_Points += SP_Multiplier * float(SP_S6_sets) / (SP_Combo_Necessity * SP_Combo_Necessity) + SP_Combo_Flat_Gain
		$"..".Genome_Research_Points += GP_Multiplier * float(GP_S6_sets) / (GP_Combo_Necessity * GP_Combo_Necessity) + GP_Combo_Flat_Gain
		$"..".Specialized_Research_Points += XP_Multiplier * float(XP_S6_sets) / (XP_Combo_Necessity * XP_Combo_Necessity) + XP_Combo_Flat_Gain
		SP_S4_sets = 0
		SP_S5_sets = 0
		SP_S6_sets = 0
		GP_S4_sets = 0
		GP_S5_sets = 0
		GP_S6_sets = 0
		XP_S4_sets = 0
		XP_S5_sets = 0
		XP_S6_sets = 0
		if Heat_Conditioning == true:
			$"Climate Button".disabled = false
		reset = true

func _Vertical_Check():
	SP_S4 = 0
	SP_S5 = 0
	SP_S6 = 0
	GP_S4 = 0
	GP_S5 = 0
	GP_S6 = 0
	XP_S4 = 0
	XP_S5 = 0
	XP_S6 = 0
	
	for i in range(0, 7):
		for j in range(0, 7):
				if Plant_List[7 * j + i].stage[0] == "Stage 4":
					_4th_Phase_Check()
				if Plant_List[7 * j + i].stage[0] == "Stage 5":
					_5th_Phase_Check()
				if Plant_List[7 * j + i].stage[0] == "Stage 6":
					_6th_Phase_Check()
		SP_S4 = 0
		SP_S5 = 0
		SP_S6 = 0
		GP_S4 = 0
		GP_S5 = 0
		GP_S6 = 0
		XP_S4 = 0
		XP_S5 = 0
		XP_S6 = 0

func _Horizontal_Check():
	SP_S4 = 0
	SP_S5 = 0
	SP_S6 = 0
	GP_S4 = 0
	GP_S5 = 0
	GP_S6 = 0
	XP_S4 = 0
	XP_S5 = 0
	XP_S6 = 0
	
	for i in range(0, 7):
		for j in range(0, 7):
			if Plant_List[7 * i + j].stage[0] == "Stage 4":
				_4th_Phase_Check()
			if Plant_List[7 * i + j].stage[0] == "Stage 5":
				_5th_Phase_Check()
			if Plant_List[7 * i + j].stage[0] == "Stage 6":
				_6th_Phase_Check()
		SP_S4 = 0
		SP_S5 = 0
		SP_S6 = 0
		GP_S4 = 0
		GP_S5 = 0
		GP_S6 = 0
		XP_S4 = 0
		XP_S5 = 0
		XP_S6 = 0

func _Diagonal_Check():
	SP_S4 = 0
	SP_S5 = 0
	SP_S6 = 0
	GP_S4 = 0
	GP_S5 = 0
	GP_S6 = 0
	XP_S4 = 0
	XP_S5 = 0
	XP_S6 = 0
	
	for i in range(0, 7):
		for j in range(0, 7):
			if j <= i: 
				if Plant_List[(7 - i - 1) * 1 + (7 * j) + j].stage[0] == "Stage 4":
					_4th_Phase_Check()
				if Plant_List[(7 - i - 1) * 1 + (7 * j) + j].stage[0] == "Stage 5":
					_5th_Phase_Check()
				if Plant_List[(7 - i - 1) * 1 + (7 * j) + j].stage[0] == "Stage 6":
					_6th_Phase_Check()
			SP_S4 = 0
			SP_S5 = 0
			SP_S6 = 0
			GP_S4 = 0
			GP_S5 = 0
			GP_S6 = 0
			XP_S4 = 0
			XP_S5 = 0
			XP_S6 = 0
		for j in range(0, 7):
			if i <= j:
				if (7 - i - 1) * 1 + (7 * j) + j <= 48:
					if Plant_List[(7 - i - 1) * 1 + (7 * j) + j].stage[0] == "Stage 4":
						_4th_Phase_Check()
					if Plant_List[(7 - i - 1) * 1 + (7 * j) + j].stage[0] == "Stage 5":
						_5th_Phase_Check()
					if Plant_List[(7 - i - 1) * 1 + (7 * j) + j].stage[0] == "Stage 6":
						_6th_Phase_Check()

				SP_S4 = 0
				SP_S5 = 0
				SP_S6 = 0
				GP_S4 = 0
				GP_S5 = 0
				GP_S6 = 0
				XP_S4 = 0
				XP_S5 = 0
				XP_S6 = 0

func _Anti_Diagonal_Check():
	SP_S4 = 0
	SP_S5 = 0
	SP_S6 = 0
	GP_S4 = 0
	GP_S5 = 0
	GP_S6 = 0
	XP_S4 = 0
	XP_S5 = 0
	XP_S6 = 0
	
	for i in range(0, 7):
		for j in range(0, 7):
			if i >= j:
				if Plant_List[i + 7 * (j) - j].stage[0] == "Stage 4":
					_4th_Phase_Check()
				if Plant_List[i + 7 * (j) - j].stage[0] == "Stage 5":
					_5th_Phase_Check()
				if Plant_List[i + 7 * (j) - j].stage[0] == "Stage 6":
					_6th_Phase_Check()

			SP_S4 = 0
			SP_S5 = 0
			SP_S6 = 0
			GP_S4 = 0
			GP_S5 = 0
			GP_S6 = 0
			XP_S4 = 0
			XP_S5 = 0
			XP_S6 = 0
		for j in range(0, 7):
			if j >= i:
				if 7 * j + 13 - j <= 48:
					if Plant_List[7 * j + 13 - j].stage[0] == "Stage 4":
						_4th_Phase_Check()
					if Plant_List[7 * j + 13 - j].stage[0] == "Stage 5":
						_5th_Phase_Check()
					if Plant_List[7 * j + 13 - j].stage[0] == "Stage 6":
						_6th_Phase_Check()

				SP_S4 = 0
				SP_S5 = 0
				SP_S6 = 0
				GP_S4 = 0
				GP_S5 = 0
				GP_S6 = 0
				XP_S4 = 0
				XP_S5 = 0
				XP_S6 = 0

func _4th_Phase_Check():
	SP_S4 += 1
	GP_S4 += 1
	XP_S4 += 1
	if SP_S4 >= SP_Combo_Necessity:
		SP_S4_sets += 1
		SP_S4 = 0
		if SP_S4 > SP_Combo_Necessity:
			SP_S4_sets *= (SP_Combo_Excess_Multiplier * SP_S4 - SP_Combo_Necessity)
	if GP_S4 >= GP_Combo_Necessity:
		GP_S4_sets += 1
		GP_S4 = 0
		if GP_S4 > GP_Combo_Necessity:
			GP_S4_sets *= (GP_Combo_Excess_Multiplier * GP_S4 - GP_Combo_Necessity)
	if XP_S4 >= XP_Combo_Necessity:
		XP_S4_sets += 1
		XP_S4 = 0
		if XP_S4 > XP_Combo_Necessity:
			XP_S4_sets *= (XP_Combo_Excess_Multiplier * XP_S4 - XP_Combo_Necessity)

func _5th_Phase_Check():
	SP_S5 += 1
	GP_S5 += 1
	XP_S5 += 1
	if SP_S5 >= SP_Combo_Necessity:
		SP_S5_sets += 1
		SP_S5 = 0
		if SP_S5 > SP_Combo_Necessity:
			SP_S5_sets *= (SP_Combo_Excess_Multiplier * SP_S4 - SP_Combo_Necessity)
	if GP_S5 >= GP_Combo_Necessity:
		GP_S5_sets += 1
		GP_S5 = 0
		if GP_S5 > GP_Combo_Necessity:
			GP_S5_sets *= (GP_Combo_Excess_Multiplier * GP_S4 - GP_Combo_Necessity)
	if XP_S5 >= XP_Combo_Necessity:
		XP_S5_sets += 1
		XP_S5 = 0
		if XP_S5 > XP_Combo_Necessity:
			XP_S5_sets *= (XP_Combo_Excess_Multiplier * XP_S4 - XP_Combo_Necessity)

func _6th_Phase_Check():
	SP_S6 += 1
	GP_S6 += 1
	XP_S6 += 1
	if SP_S6 >= SP_Combo_Necessity:
		SP_S6_sets += 1
		SP_S6 = 0
		if SP_S6 > SP_Combo_Necessity:
			SP_S6_sets *= (SP_Combo_Excess_Multiplier * SP_S4 - SP_Combo_Necessity)
	if GP_S6 >= GP_Combo_Necessity:
		GP_S6_sets += 1
		GP_S6 = 0
		if GP_S6 > GP_Combo_Necessity:
			GP_S6_sets *= (GP_Combo_Excess_Multiplier * GP_S4 - GP_Combo_Necessity)
	if XP_S6 >= XP_Combo_Necessity:
		XP_S6_sets += 1
		XP_S6 = 0
		if XP_S6 > XP_Combo_Necessity:
			XP_S6_sets *= (XP_Combo_Excess_Multiplier * XP_S4 - XP_Combo_Necessity)


func _on_close_button_sequencing_mouse_entered() -> void:
	$"Close Button Sequencing/Hover".play()


func _on_tutorial_button_mouse_entered() -> void:
	$"Tutorial Button/Hover".play()


func _on_left_movement_mouse_entered() -> void:
	$"Tutorial Tab/Node2D/Left Movement/Hover".play()


func _on_right_movement_mouse_entered() -> void:
	$"Tutorial Tab/Node2D/Right Movement/Hover".play()


func _on_iterate_button_mouse_entered() -> void:
	if $"Iterate Button".disabled == false:
		$"Iterate Button/Hover".play()


func _on_reset_button_mouse_entered() -> void:
	if $"Reset Button".disabled == false:
		$"Reset Button/Hover".play()


func _on_climate_button_mouse_entered() -> void:
	if Heat_Conditioning == true && $"Climate Button".disabled == false:
		$"Climate Button/Hover".play()


func _on_close_button_sequencing_button_up() -> void:
	$"Close Button Sequencing/Close".play()
