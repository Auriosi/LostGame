extends Node2D

var First_Entry = true

@onready var Scientific_Research_Points = $"..".Scientific_Research_Points
@onready var Genome_Research_Points = $"..".Genome_Research_Points
@onready var Specialized_Research_Points = $"..".Specialized_Research_Points

func _on_close_button_sequencing_pressed() -> void:
	visible = false
	$"../User Interface/Research Node UI".visible = false
	$CanvasLayer.visible = false

func _process(_delta):
	
	if Input.is_action_just_pressed("Close Menu"):
		$".".visible = false
		$"../User Interface/Research Node UI".visible = false
		$CanvasLayer.visible = false
	
	$"CanvasLayer/Stats/ScrollContainer/Scientific Research Points".text = str("Basic Stats
	Min Stats: ") + str($"../Sequencing Game".Nucleotide_Min_Base) + (" - ") + str($"../Sequencing Game".Nucleotide_Min_Base + ($"../Sequencing Game".Nucleotide_Min_Rand) - 1) + str("
	Max Stats: ") + str($"../Sequencing Game".Nucleotide_Max_Base) + (" - ") + str($"../Sequencing Game".Nucleotide_Max_Base + ($"../Sequencing Game".Nucleotide_Max_Rand) - 1) + str("
	Seconds Per Sequence: ") + str($"../Sequencing Game".Seconds_To_Sequence) + str("
	
	Scientific Research Stats
	Flat Gain: ") + str($"../Sequencing Game".SP_Flat_Gain) + str("
	Multiplier: ") + str($"../Sequencing Game".SP_Multiplier) + str("
	Flat Combo Gain: ") + str($"../Sequencing Game".SP_Combo_Flat_Gain) + str("
	Combo Multipler Excess: ") + str($"../Sequencing Game".SP_Combo_Excess_Multiplier) + str("
	Combo Necessity: ") + str($"../Sequencing Game".SP_Combo_Necessity) + str("
	
	Genome Reserach Stats
	Flat Gain ") + str($"../Sequencing Game".GP_Flat_Gain) + str("
	Multiplier: ") + str($"../Sequencing Game".GP_Multiplier) + str("
	Flat Combo Gain: ") + str($"../Sequencing Game".GP_Combo_Flat_Gain) + str("
	Combo Multipler Excess: ") + str($"../Sequencing Game".GP_Combo_Excess_Multiplier) + str("
	Combo Necessity: ") + str($"../Sequencing Game".GP_Combo_Necessity) + str("
	
	Trait Reserach Stats
	Flat Gain: ") + str($"../Sequencing Game".Trait_Flat_Gain) + str("
	Multiplier: ") + str($"../Sequencing Game".Trait_Multiplier) + str("
	Flat Combo Gain: ") + str($"../Sequencing Game".Trait_Combo_Flat_Gain) + str("
	Combo Multipler Excess: ") + str($"../Sequencing Game".Trait_Combo_Excess_Multiplier) + str("
	Combo Necessity: ") + str($"../Sequencing Game".Trait_Combo_Necessity)
	
	$"CanvasLayer/Stats/ScrollContainer2/Scientific Research Points".text = str("Basic Stats
	Seconds Per Sequence: ") + str($"../Plant Development Game".Seconds_To_Sequence) + str("
	
	Survivability: ") + str($"../Plant Development Game".Survivability) + str("
	Growth: ") + str($"../Plant Development Game".Growth) + str("
	Yield: ") + str($"../Plant Development Game".Yield) + str("
	Longevity: ") + str($"../Plant Development Game".Longevity) + str("
	
	Scientific Research Stats
	Flat Gain: ") + str($"../Plant Development Game".SP_Flat_Gain) + str("
	Multiplier: ") + str($"../Plant Development Game".SP_Multiplier) + str("
	Flat Combo Gain: ") + str($"../Plant Development Game".SP_Combo_Flat_Gain) + str("
	Combo Multipler Excess: ") + str($"../Plant Development Game".SP_Combo_Excess_Multiplier) + str("
	Combo Necessity: ") + str($"../Plant Development Game".SP_Combo_Necessity) + str("
	
	Genome Reserach Stats
	Flat Gain ") + str($"../Plant Development Game".GP_Flat_Gain) + str("
	Multiplier: ") + str($"../Plant Development Game".GP_Multiplier) + str("
	Flat Combo Gain: ") + str($"../Plant Development Game".GP_Combo_Flat_Gain) + str("
	Combo Multipler Excess: ") + str($"../Plant Development Game".GP_Combo_Excess_Multiplier) + str("
	Combo Necessity: ") + str($"../Plant Development Game".GP_Combo_Necessity) + str("
	
	Specialized Reserach Stats
	Flat Gain: ") + str($"../Plant Development Game".XP_Flat_Gain) + str("
	Multiplier: ") + str($"../Plant Development Game".XP_Multiplier) + str("
	Flat Combo Gain: ") + str($"../Plant Development Game".XP_Combo_Flat_Gain) + str("
	Combo Multipler Excess: ") + str($"../Plant Development Game".XP_Combo_Excess_Multiplier) + str("
	Combo Necessity: ") + str($"../Plant Development Game".XP_Combo_Necessity)
	
	$"CanvasLayer/Stats/ScrollContainer3/Scientific Research Points".text = str("Basic Stats
	Seconds Per Sequence: ") + str($"../Crop Diagnosis".Seconds_To_Sequence) + str("
	
	Scientific Research Stats
	Flat Gain: ") + str($"../Crop Diagnosis".SP_Flat_Gain_Min) + (" - ")  + str($"../Crop Diagnosis".SP_Flat_Gain_Max) + str("
	Multiplier: ") + str($"../Crop Diagnosis".SP_Multiplier_Min / 4) + (" - ")  + str( ($"../Crop Diagnosis".SP_Multiplier_Min + $"../Crop Diagnosis".SP_Multiplier_Max) / 4) + str("
	
	Genome Research Stats
	Flat Gain: ") + str($"../Crop Diagnosis".GP_Flat_Gain_Min) + (" - ")  + str($"../Crop Diagnosis".GP_Flat_Gain_Max) + str("
	Multiplier: ") + str($"../Crop Diagnosis".GP_Multiplier_Min / 4) + (" - ")  + str( ($"../Crop Diagnosis".GP_Multiplier_Min + $"../Crop Diagnosis".GP_Multiplier_Max) / 4) + str("
	
	Speacialized Research Stats
	Flat Gain: ") + str($"../Crop Diagnosis".XP_Flat_Gain_Min) + (" - ")  + str($"../Crop Diagnosis".XP_Flat_Gain_Max) + str("
	Multiplier: ") + str($"../Crop Diagnosis".XP_Multiplier_Min / 4) + (" - ")  + str( ($"../Crop Diagnosis".XP_Multiplier_Min + $"../Crop Diagnosis".XP_Multiplier_Max) / 4)
