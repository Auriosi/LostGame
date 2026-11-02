extends Node2D

@export var Specific_Potency = false
# If active, can see numbers after sequencing, else can only see positive negative.
@export var Previous_Positive = false
@export var Previous_Potency = false
# Previous_Potency Prerequisites:	Previous_Positive
@export var Real_Time_Trait = false
@export var Real_Time_Positive = false
# Real_Time_Positive Prerequisites:	Previous_Positive
@export var Real_Time_Potency = false
# Real_Time_Potency Prerequisites: 	Real_Time_Positive
#									Previous_Positive
#									Previous_Potency


@export var Choose_Trait_1 = false
@export var Choose_Trait_2 = false
@export var Choose_Trait_3 = false
# Choose_Trait Prerequisites: Real_Time_Trait

@export var Second_Nucleotide_Strain = false
@export var Third_Nucleotide_Strain = false

# These values must be changed one the offical Genome Sequencing Game Scene, 
# otherwise check other iteration of the game in lab.
@export var Nucleotide_Min_Base = 1
@export var Nucleotide_Max_Base = 3
@export var Nucleotide_Min_Rand = 2
@export var Nucleotide_Max_Rand = 2

@export var Major_Potency_Min = Nucleotide_Max_Base

@export var Seconds_To_Sequence = float(6)

var First_Sequence = false

var SP_Expansion_Level = 0
var GP_Expansion_Level = 0
var XP_Expansion_Level = 0

var Longevity = 0
var Growth = 0
var Yield = 0
var Survivability = 0

var Completed_Sequences = 0

#var Finalize = false

var max_range = true
var max_range_2 = true

#SP means Scientific Points
@export var SP_Flat_Gain = float(1)
@export var SP_Multiplier = float(1)
@export var SP_Combo_Flat_Gain = float(1)
@export var SP_Combo_Excess_Multiplier = float(1)
@export var SP_Combo_Necessity = float(5)

# GP means Genome Points
@export var GP_Flat_Gain = float(0.5)
@export var GP_Multiplier = float(1)
@export var GP_Combo_Flat_Gain = float(0)
@export var GP_Combo_Excess_Multiplier = float(1)
@export var GP_Combo_Necessity = float(5)

# XP means Specialized Points
@export var Trait_Flat_Gain = float(0)
@export var Trait_Multiplier = float(1)
@export var Trait_Combo_Flat_Gain = float(0)
@export var Trait_Combo_Excess_Multiplier = float(1)
@export var Trait_Combo_Necessity = float(5)

var Combo = 0

@export var SP_Combo_Necessity_Level_1 = false
@export var SP_Combo_Necessity_Level_2 = false
@export var SP_Combo_Necessity_Level_3 = false

@export var GP_Combo_Necessity_Level_1 = false
@export var GP_Combo_Necessity_Level_2 = false
@export var GP_Combo_Necessity_Level_3 = false

@export var XP_Combo_Necessity_Level_1 = false
@export var XP_Combo_Necessity_Level_2 = false
@export var XP_Combo_Necessity_Level_3 = false

var SP_Combo_Necessity_Level_1_Activate = false
var SP_Combo_Necessity_Level_2_Activate = false
var SP_Combo_Necessity_Level_3_Activate = false

var GP_Combo_Necessity_Level_1_Activate = false
var GP_Combo_Necessity_Level_2_Activate = false
var GP_Combo_Necessity_Level_3_Activate = false

var XP_Combo_Necessity_Level_1_Activate = false
var XP_Combo_Necessity_Level_2_Activate = false
var XP_Combo_Necessity_Level_3_Activate = false

func _on_close_button_button_up() -> void: # For Result
	$"Result Tab/Close Button/Close".play()
	$"Result Tab".visible = false
	$"Close Button Sequencing".disabled = false

func _on_close_button_sequencing_button_up() -> void:
	if $"Result Tab".visible == false:
		$".".visible = false
		$"Close Button Sequencing/Close".play()

func _on_sequence_button_button_up() -> void:
	$"Result Tab".visible = true
	$"Close Button Sequencing".disabled = true

func _ready():
	_Upgrades()

func _process(_delta):
	if $"Result Tab".visible == true:
		$"Sequence Button".disabled = true
	else:
		$"Sequence Button".disabled = false
	
	if SP_Combo_Necessity_Level_1 == true && SP_Combo_Necessity_Level_1_Activate == false:
		SP_Combo_Necessity -= 1
		SP_Combo_Necessity_Level_1_Activate = true
	if SP_Combo_Necessity_Level_2 == true && SP_Combo_Necessity_Level_2_Activate == false:
		SP_Combo_Necessity -= 1
		SP_Combo_Necessity_Level_2_Activate = true
	if SP_Combo_Necessity_Level_3 == true && SP_Combo_Necessity_Level_3_Activate == false:
		SP_Combo_Necessity -= 1
		SP_Combo_Necessity_Level_3_Activate = true
	
	if GP_Combo_Necessity_Level_1 == true && GP_Combo_Necessity_Level_1_Activate == false:
		GP_Combo_Necessity -= 1
		GP_Combo_Necessity_Level_1_Activate = true
	if GP_Combo_Necessity_Level_2 == true && GP_Combo_Necessity_Level_2_Activate == false:
		GP_Combo_Necessity -= 1
		GP_Combo_Necessity_Level_2_Activate = true
	if GP_Combo_Necessity_Level_3 == true && GP_Combo_Necessity_Level_3_Activate == false:
		GP_Combo_Necessity -= 1
		GP_Combo_Necessity_Level_3_Activate = true
	
	if XP_Combo_Necessity_Level_1 == true && XP_Combo_Necessity_Level_1_Activate == false:
		Trait_Combo_Necessity -= 1
		XP_Combo_Necessity_Level_1_Activate = true
	if XP_Combo_Necessity_Level_2 == true && XP_Combo_Necessity_Level_2_Activate == false:
		Trait_Combo_Necessity -= 1
		XP_Combo_Necessity_Level_2_Activate = true
	if XP_Combo_Necessity_Level_3 == true && XP_Combo_Necessity_Level_3_Activate == false:
		Trait_Combo_Necessity -= 1
		XP_Combo_Necessity_Level_3_Activate = true
	
	_Upgrades()
	if Input.is_action_just_pressed("Close Menu"):
		$"Close Button Sequencing".disabled = false
		if $"Result Tab".visible == false:
			$".".visible = false
		$"Result Tab".visible = false

func _Upgrades():
	if Choose_Trait_1 == true && Real_Time_Trait == true:
		$"Nucleotide Strain/Nucleotide Set5/Button".disabled = false
		$"Nucleotide Strain/Nucleotide Set5/Box2".visible = true
		$"Nucleotide Strain2/Nucleotide Set5/Button".disabled = false
		$"Nucleotide Strain2/Nucleotide Set5/Box2".visible = true
		$"Nucleotide Strain3/Nucleotide Set5/Button".disabled = false
		$"Nucleotide Strain3/Nucleotide Set5/Box2".visible = true
	
	if Choose_Trait_2 == true && Real_Time_Trait == true:
		$"Nucleotide Strain/Nucleotide Set6/Button".disabled = false
		$"Nucleotide Strain/Nucleotide Set6/Box2".visible = true
		$"Nucleotide Strain2/Nucleotide Set6/Button".disabled = false
		$"Nucleotide Strain2/Nucleotide Set6/Box2".visible = true
		$"Nucleotide Strain3/Nucleotide Set6/Button".disabled = false
		$"Nucleotide Strain3/Nucleotide Set6/Box2".visible = true
		
	if Choose_Trait_3 == true && Real_Time_Trait == true:
		$"Nucleotide Strain/Nucleotide Set7/Button".disabled = false
		$"Nucleotide Strain/Nucleotide Set7/Box2".visible = true
		$"Nucleotide Strain2/Nucleotide Set7/Button".disabled = false
		$"Nucleotide Strain2/Nucleotide Set7/Box2".visible = true
		$"Nucleotide Strain3/Nucleotide Set7/Button".disabled = false
		$"Nucleotide Strain3/Nucleotide Set7/Box2".visible = true
	
	if Second_Nucleotide_Strain == true:
		if max_range == true:
			$"Result Tab".Max_Range += 8
			max_range = false
		$"Nucleotide Strain2/Nucleotide Set".visible = true
		$"Nucleotide Strain2/Nucleotide Set2".visible = true
		$"Nucleotide Strain2/Nucleotide Set3".visible = true
		$"Nucleotide Strain2/Nucleotide Set4".visible = true
		$"Nucleotide Strain2/Nucleotide Set5".visible = true
		$"Nucleotide Strain2/Nucleotide Set6".visible = true
		$"Nucleotide Strain2/Nucleotide Set7".visible = true
		$"Nucleotide Strain2/Nucleotide Set8".visible = true
		$"Result Tab/Nucleotide Result2/Nucleotide Result 1".visible = true
		$"Result Tab/Nucleotide Result2/Nucleotide Result 2".visible = true
		$"Result Tab/Nucleotide Result2/Nucleotide Result 3".visible = true
		$"Result Tab/Nucleotide Result2/Nucleotide Result 4".visible = true
		$"Result Tab/Nucleotide Result2/Nucleotide Result 5".visible = true
		$"Result Tab/Nucleotide Result2/Nucleotide Result 6".visible = true
		$"Result Tab/Nucleotide Result2/Nucleotide Result 7".visible = true
		$"Result Tab/Nucleotide Result2/Nucleotide Result 8".visible = true
	
	if Second_Nucleotide_Strain == true && Third_Nucleotide_Strain == true:
		
		if max_range_2 == true:
			$"Result Tab".Max_Range += 8
			max_range_2 = false
		
		$"Nucleotide Strain3/Nucleotide Set".visible = true
		$"Nucleotide Strain3/Nucleotide Set2".visible = true
		$"Nucleotide Strain3/Nucleotide Set3".visible = true
		$"Nucleotide Strain3/Nucleotide Set4".visible = true
		$"Nucleotide Strain3/Nucleotide Set5".visible = true
		$"Nucleotide Strain3/Nucleotide Set6".visible = true
		$"Nucleotide Strain3/Nucleotide Set7".visible = true
		$"Nucleotide Strain3/Nucleotide Set8".visible = true
		$"Result Tab/Nucleotide Result3/Nucleotide Result 1".visible = true
		$"Result Tab/Nucleotide Result3/Nucleotide Result 2".visible = true
		$"Result Tab/Nucleotide Result3/Nucleotide Result 3".visible = true
		$"Result Tab/Nucleotide Result3/Nucleotide Result 4".visible = true
		$"Result Tab/Nucleotide Result3/Nucleotide Result 5".visible = true
		$"Result Tab/Nucleotide Result3/Nucleotide Result 6".visible = true
		$"Result Tab/Nucleotide Result3/Nucleotide Result 7".visible = true
		$"Result Tab/Nucleotide Result3/Nucleotide Result 8".visible = true

func _on_finalize_button_pressed() -> void:
	var Scientific_Research_Awarded = SP_Flat_Gain * SP_Multiplier 
	var Genome_Research_Awarded = GP_Flat_Gain * GP_Multiplier
	var Trait_Points_Awarded = Trait_Flat_Gain * Trait_Multiplier
	if $"Result Tab".NS1_Longevity == SP_Combo_Necessity:
		if $"Result Tab".NS1_Longevity > SP_Combo_Necessity:
			Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS1_Longevity - SP_Combo_Necessity
		Scientific_Research_Awarded += SP_Combo_Flat_Gain 
	if $"Result Tab".NS1_Growth == SP_Combo_Necessity:
		if $"Result Tab".NS1_Growth > SP_Combo_Necessity:
			Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS1_Growth - SP_Combo_Necessity
		Scientific_Research_Awarded += SP_Combo_Flat_Gain 
	if $"Result Tab".NS1_Survivability == SP_Combo_Necessity:
		if $"Result Tab".NS1_Survivability > SP_Combo_Necessity:
			Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS1_Survivability - SP_Combo_Necessity
		Scientific_Research_Awarded += SP_Combo_Flat_Gain 
	if $"Result Tab".NS1_Yield == SP_Combo_Necessity:
		if $"Result Tab".NS1_Yield > SP_Combo_Necessity:
			Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS1_Yield - SP_Combo_Necessity
		Scientific_Research_Awarded += SP_Combo_Flat_Gain 
	if $"Result Tab".NS1_Longevity == GP_Combo_Necessity:
		if $"Result Tab".NS1_Longevity > GP_Combo_Necessity:
			Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS1_Longevity - GP_Combo_Necessity
		Genome_Research_Awarded += GP_Combo_Flat_Gain
	if $"Result Tab".NS1_Growth == GP_Combo_Necessity:
		if $"Result Tab".NS1_Growth > GP_Combo_Necessity:
			Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS1_Growth - GP_Combo_Necessity
		Genome_Research_Awarded += GP_Combo_Flat_Gain
	if $"Result Tab".NS1_Survivability == GP_Combo_Necessity:
		if $"Result Tab".NS1_Survivability > GP_Combo_Necessity:
			Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS1_Survivability - GP_Combo_Necessity
		Genome_Research_Awarded += GP_Combo_Flat_Gain
	if $"Result Tab".NS1_Yield == GP_Combo_Necessity:
		if $"Result Tab".NS1_Yield > GP_Combo_Necessity:
			Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS1_Yield - GP_Combo_Necessity
		Genome_Research_Awarded += GP_Combo_Flat_Gain
	if $"Result Tab".NS1_Longevity == Trait_Combo_Necessity:
		if $"Result Tab".NS1_Longevity > Trait_Combo_Necessity:
			Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS1_Longevity - Trait_Combo_Necessity
		Trait_Points_Awarded += Trait_Combo_Flat_Gain 
	if $"Result Tab".NS1_Growth == Trait_Combo_Necessity:
		if $"Result Tab".NS1_Growth > Trait_Combo_Necessity:
			Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS1_Growth - Trait_Combo_Necessity
		Trait_Points_Awarded += Trait_Combo_Flat_Gain 
	if $"Result Tab".NS1_Survivability == Trait_Combo_Necessity:
		if $"Result Tab".NS1_Survivability > Trait_Combo_Necessity:
			Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS1_Survivability - Trait_Combo_Necessity
		Trait_Points_Awarded += Trait_Combo_Flat_Gain 
	if $"Result Tab".NS1_Yield == Trait_Combo_Necessity:
		if $"Result Tab".NS1_Yield > Trait_Combo_Necessity:
			Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS1_Yield - Trait_Combo_Necessity
		Trait_Points_Awarded += Trait_Combo_Flat_Gain 
	$"..".Scientific_Research_Points += Scientific_Research_Awarded
	$"..".Genome_Research_Points += Genome_Research_Awarded
	Longevity += Trait_Points_Awarded
	Growth += Trait_Points_Awarded
	Yield += Trait_Points_Awarded
	Survivability += Trait_Points_Awarded

	if Second_Nucleotide_Strain == true:
		Scientific_Research_Awarded = SP_Flat_Gain * SP_Multiplier 
		Genome_Research_Awarded = GP_Flat_Gain * GP_Multiplier
		Trait_Points_Awarded = Trait_Flat_Gain * Trait_Multiplier
		if $"Result Tab".NS2_Longevity == SP_Combo_Necessity:
			if $"Result Tab".NS2_Longevity > SP_Combo_Necessity:
				Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS2_Longevity - SP_Combo_Necessity
			Scientific_Research_Awarded += SP_Combo_Flat_Gain 
		if $"Result Tab".NS2_Growth == SP_Combo_Necessity:
			if $"Result Tab".NS2_Growth > SP_Combo_Necessity:
				Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS2_Growth - SP_Combo_Necessity
			Scientific_Research_Awarded += SP_Combo_Flat_Gain 
		if $"Result Tab".NS2_Survivability == SP_Combo_Necessity:
			if $"Result Tab".NS2_Survivability > SP_Combo_Necessity:
				Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS2_Survivability - SP_Combo_Necessity
			Scientific_Research_Awarded += SP_Combo_Flat_Gain 
		if $"Result Tab".NS2_Yield == SP_Combo_Necessity:
			if $"Result Tab".NS2_Yield > SP_Combo_Necessity:
				Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS2_Yield - SP_Combo_Necessity
			Scientific_Research_Awarded += SP_Combo_Flat_Gain 
		if $"Result Tab".NS2_Longevity == GP_Combo_Necessity:
			if $"Result Tab".NS2_Longevity > GP_Combo_Necessity:
				Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS2_Longevity - GP_Combo_Necessity
			Genome_Research_Awarded += GP_Combo_Flat_Gain
		if $"Result Tab".NS2_Growth == GP_Combo_Necessity:
			if $"Result Tab".NS2_Growth > GP_Combo_Necessity:
				Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS2_Growth - GP_Combo_Necessity
			Genome_Research_Awarded += GP_Combo_Flat_Gain
		if $"Result Tab".NS2_Survivability == GP_Combo_Necessity:
			if $"Result Tab".NS2_Survivability > GP_Combo_Necessity:
				Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS2_Survivability - GP_Combo_Necessity
			Genome_Research_Awarded += GP_Combo_Flat_Gain
		if $"Result Tab".NS2_Yield == GP_Combo_Necessity:
			if $"Result Tab".NS2_Yield > GP_Combo_Necessity:
				Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS2_Yield - GP_Combo_Necessity
			Genome_Research_Awarded += GP_Combo_Flat_Gain
		if $"Result Tab".NS2_Longevity == Trait_Combo_Necessity:
			if $"Result Tab".NS2_Longevity > Trait_Combo_Necessity:
				Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS2_Longevity - Trait_Combo_Necessity
			Trait_Points_Awarded += Trait_Combo_Flat_Gain 
		if $"Result Tab".NS2_Growth == Trait_Combo_Necessity:
			if $"Result Tab".NS2_Growth > Trait_Combo_Necessity:
				Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS2_Growth - Trait_Combo_Necessity
			Trait_Points_Awarded += Trait_Combo_Flat_Gain 
		if $"Result Tab".NS2_Survivability == Trait_Combo_Necessity:
			if $"Result Tab".NS2_Survivability > Trait_Combo_Necessity:
				Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS2_Survivability - Trait_Combo_Necessity
			Trait_Points_Awarded += Trait_Combo_Flat_Gain 
		if $"Result Tab".NS2_Yield == Trait_Combo_Necessity:
			if $"Result Tab".NS2_Yield > Trait_Combo_Necessity:
				Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS2_Yield - Trait_Combo_Necessity
			Trait_Points_Awarded += Trait_Combo_Flat_Gain 
		$"..".Scientific_Research_Points += Scientific_Research_Awarded
		$"..".Genome_Research_Points += Genome_Research_Awarded
		Longevity += Trait_Points_Awarded
		Growth += Trait_Points_Awarded
		Yield += Trait_Points_Awarded
		Survivability += Trait_Points_Awarded

	if Second_Nucleotide_Strain == true && Third_Nucleotide_Strain == true:
		Scientific_Research_Awarded = SP_Flat_Gain * SP_Multiplier 
		Genome_Research_Awarded = GP_Flat_Gain * GP_Multiplier
		Trait_Points_Awarded = Trait_Flat_Gain * Trait_Multiplier
		if $"Result Tab".NS3_Longevity == SP_Combo_Necessity:
			if $"Result Tab".NS3_Longevity > SP_Combo_Necessity:
				Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS3_Longevity - SP_Combo_Necessity
			Scientific_Research_Awarded += SP_Combo_Flat_Gain 
		if $"Result Tab".NS3_Growth == SP_Combo_Necessity:
			if $"Result Tab".NS3_Growth > SP_Combo_Necessity:
				Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS3_Growth - SP_Combo_Necessity
			Scientific_Research_Awarded += SP_Combo_Flat_Gain 
		if $"Result Tab".NS3_Survivability == SP_Combo_Necessity:
			if $"Result Tab".NS3_Survivability > SP_Combo_Necessity:
				Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS3_Survivability - SP_Combo_Necessity
			Scientific_Research_Awarded += SP_Combo_Flat_Gain 
		if $"Result Tab".NS3_Yield == SP_Combo_Necessity:
			if $"Result Tab".NS3_Yield > SP_Combo_Necessity:
				Scientific_Research_Awarded *= SP_Combo_Excess_Multiplier * $"Result Tab".NS3_Yield - SP_Combo_Necessity
			Scientific_Research_Awarded += SP_Combo_Flat_Gain 
		if $"Result Tab".NS3_Longevity == GP_Combo_Necessity:
			if $"Result Tab".NS3_Longevity > GP_Combo_Necessity:
				Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS3_Longevity - GP_Combo_Necessity
			Genome_Research_Awarded += GP_Combo_Flat_Gain
		if $"Result Tab".NS3_Growth == GP_Combo_Necessity:
			if $"Result Tab".NS3_Growth > GP_Combo_Necessity:
				Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS3_Growth - GP_Combo_Necessity
			Genome_Research_Awarded += GP_Combo_Flat_Gain
		if $"Result Tab".NS3_Survivability == GP_Combo_Necessity:
			if $"Result Tab".NS3_Survivability > GP_Combo_Necessity:
				Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS3_Survivability - GP_Combo_Necessity
			Genome_Research_Awarded += GP_Combo_Flat_Gain
		if $"Result Tab".NS3_Yield == GP_Combo_Necessity:
			if $"Result Tab".NS3_Yield > GP_Combo_Necessity:
				Genome_Research_Awarded *= GP_Combo_Excess_Multiplier * $"Result Tab".NS3_Yield - GP_Combo_Necessity
			Genome_Research_Awarded += GP_Combo_Flat_Gain
		if $"Result Tab".NS3_Longevity == Trait_Combo_Necessity:
			if $"Result Tab".NS3_Longevity > Trait_Combo_Necessity:
				Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS3_Longevity - Trait_Combo_Necessity
			Trait_Points_Awarded += Trait_Combo_Flat_Gain 
		if $"Result Tab".NS3_Growth == Trait_Combo_Necessity:
			if $"Result Tab".NS3_Growth > Trait_Combo_Necessity:
				Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS3_Growth - Trait_Combo_Necessity
			Trait_Points_Awarded += Trait_Combo_Flat_Gain 
		if $"Result Tab".NS3_Survivability == Trait_Combo_Necessity:
			if $"Result Tab".NS3_Survivability > Trait_Combo_Necessity:
				Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS3_Survivability - Trait_Combo_Necessity
			Trait_Points_Awarded += Trait_Combo_Flat_Gain 
		if $"Result Tab".NS3_Yield == Trait_Combo_Necessity:
			if $"Result Tab".NS3_Yield > Trait_Combo_Necessity:
				Trait_Points_Awarded *= Trait_Combo_Excess_Multiplier * $"Result Tab".NS3_Yield - Trait_Combo_Necessity
			Trait_Points_Awarded += Trait_Combo_Flat_Gain 
		$"..".Scientific_Research_Points += Scientific_Research_Awarded
		$"..".Genome_Research_Points += Genome_Research_Awarded
		Longevity += Trait_Points_Awarded
		Growth += Trait_Points_Awarded
		Yield += Trait_Points_Awarded
		Survivability += Trait_Points_Awarded


func _on_sequence_button_mouse_entered() -> void:
	if $"Result Tab".visible == false && $"Result Tab".visible == false:
		$"Sequence Button/Hover".play()


func _on_tutorial_button_mouse_entered() -> void:
	if $"Tutorial Tab/Tutorial Button".disabled == false:
		$"Tutorial Tab/Tutorial Button/Hover".play()


func _on_refresh_button_down() -> void:
	$Refresh/Interact.play()


func _on_refresh_mouse_entered() -> void:
	if $"Result Tab".visible == false && $"Result Tab".visible == false:
		$Refresh/Hover.play()


func _on_close_button_sequencing_mouse_entered() -> void:
	$"Tutorial Tab/Node2D/Close Button Sequencing/Hover".play()
