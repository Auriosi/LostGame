extends Node2D

@onready var Sequencing_Game

@onready var Genome_Sequencing = $"../../Sequencing Game"
@onready var Node_Name = $"../../User Interface/Research Node UI/Node Name/Node Name"
@onready var Node_Effect = $"../../User Interface/Research Node UI/Node Effect/Node Name"
@onready var Node_Cost = $"../../User Interface/Research Node UI/Node Cost/Node Name"
@onready var Node_Error = $"../../User Interface/Research Node UI/Node Warning/Node Name"

@onready var _1_1 = $"DNA Research Set 1/1_1/Button"

@onready var _2_1 = $"DNA Research Set 1/2_1/Button"
@onready var _2_2 = $"DNA Research Set 1/2_2/Button"

@onready var _3_1 = $"DNA Research Set 1/3_1/Button"
@onready var _3_2 = $"DNA Research Set 1/3_2/Button"

@onready var _4_1 = $"DNA Research Set 1/4_1/Button"
@onready var _4_2 = $"DNA Research Set 1/4_2/Button"
@onready var _4_3 = $"DNA Research Set 1/4_3/Button"
@onready var _4_4 = $"DNA Research Set 1/4_4/Button"
@onready var _4_5 = $"DNA Research Set 1/4_5/Button"

@onready var _5_1 = $"DNA Research Set 1/5_1/Button"
@onready var _5_2 = $"DNA Research Set 1/5_2/Button"

@onready var _6_1 = $"DNA Research Set 1/6_1/Button"
@onready var _6_2 = $"DNA Research Set 1/6_2/Button"
@onready var _6_3 = $"DNA Research Set 1/6_3/Button"
@onready var _6_4 = $"DNA Research Set 1/6_4/Button"
@onready var _6_5 = $"DNA Research Set 1/6_5/Button"
@onready var _6_6 = $"DNA Research Set 1/6_6/Button"
@onready var _6_7 = $"DNA Research Set 1/6_7/Button"

@onready var _7_1 = $"DNA Research Set 1/7_1/Button"
@onready var _7_2 = $"DNA Research Set 1/7_2/Button"

@onready var _8_1 = $"DNA Research Set 1/8_1/Button"
@onready var _8_2 = $"DNA Research Set 1/8_2/Button"
@onready var _8_3 = $"DNA Research Set 1/8_3/Button"
@onready var _8_4 = $"DNA Research Set 1/8_4/Button"
@onready var _8_5 = $"DNA Research Set 1/8_5/Button"

@onready var _9_1 = $"DNA Research Set 1/9_1/Button"
@onready var _9_2 = $"DNA Research Set 1/9_2/Button"

@onready var _10_1 = $"DNA Research Set 1/10_1/Button"
@onready var _10_2 = $"DNA Research Set 1/10_2/Button"

@onready var _11_1 = $"DNA Research Set 2/1_1/Button"

@onready var _12_1 = $"DNA Research Set 2/2_1/Button"
@onready var _12_2 = $"DNA Research Set 2/2_2/Button"

@onready var _13_1 = $"DNA Research Set 2/3_1/Button"
@onready var _13_2 = $"DNA Research Set 2/3_2/Button"

@onready var _14_1 = $"DNA Research Set 2/4_1/Button"
@onready var _14_2 = $"DNA Research Set 2/4_2/Button"
@onready var _14_3 = $"DNA Research Set 2/4_3/Button"
@onready var _14_4 = $"DNA Research Set 2/4_4/Button"
@onready var _14_5 = $"DNA Research Set 2/4_5/Button"

@onready var _15_1 = $"DNA Research Set 2/5_1/Button"
@onready var _15_2 = $"DNA Research Set 2/5_2/Button"

@onready var _16_1 = $"DNA Research Set 2/6_1/Button"
@onready var _16_2 = $"DNA Research Set 2/6_2/Button"
@onready var _16_3 = $"DNA Research Set 2/6_3/Button"
@onready var _16_4 = $"DNA Research Set 2/6_4/Button"
@onready var _16_5 = $"DNA Research Set 2/6_5/Button"
@onready var _16_6 = $"DNA Research Set 2/6_6/Button"
@onready var _16_7 = $"DNA Research Set 2/6_7/Button"

@onready var _17_1 = $"DNA Research Set 2/7_1/Button"
@onready var _17_2 = $"DNA Research Set 2/7_2/Button"

@onready var _18_1 = $"DNA Research Set 2/8_1/Button"
@onready var _18_2 = $"DNA Research Set 2/8_2/Button"
@onready var _18_3 = $"DNA Research Set 2/8_3/Button"
@onready var _18_4 = $"DNA Research Set 2/8_4/Button"
@onready var _18_5 = $"DNA Research Set 2/8_5/Button"

@onready var _19_1 = $"DNA Research Set 2/9_1/Button"
@onready var _19_2 = $"DNA Research Set 2/9_2/Button"

@onready var _20_1 = $"DNA Research Set 2/10_1/Button"
@onready var _20_2 = $"DNA Research Set 2/10_2/Button"

@onready var _21_1 = $"DNA Research Set 3/1_1/Button"

@onready var _22_1 = $"DNA Research Set 3/2_1/Button"
@onready var _22_2 = $"DNA Research Set 3/2_2/Button"
@onready var _23_1 = $"DNA Research Set 3/3_1/Button"
@onready var _23_2 = $"DNA Research Set 3/3_2/Button"

@onready var _24_1 = $"DNA Research Set 3/4_1/Button"
@onready var _24_2 = $"DNA Research Set 3/4_2/Button"
@onready var _24_3 = $"DNA Research Set 3/4_3/Button"
@onready var _24_4 = $"DNA Research Set 3/4_4/Button"
@onready var _24_5 = $"DNA Research Set 3/4_5/Button"

@onready var _25_1 = $"DNA Research Set 3/5_1/Button"
@onready var _25_2 = $"DNA Research Set 3/5_2/Button"

@onready var _26_1 = $"DNA Research Set 3/6_1/Button"
@onready var _26_2 = $"DNA Research Set 3/6_2/Button"
@onready var _26_3 = $"DNA Research Set 3/6_3/Button"
@onready var _26_4 = $"DNA Research Set 3/6_4/Button"
@onready var _26_5 = $"DNA Research Set 3/6_5/Button"
@onready var _26_6 = $"DNA Research Set 3/6_6/Button"
@onready var _26_7 = $"DNA Research Set 3/6_7/Button"

@onready var _27_1 = $"DNA Research Set 3/7_1/Button"
@onready var _27_2 = $"DNA Research Set 3/7_2/Button"

@onready var _28_1 = $"DNA Research Set 3/8_1/Button"
@onready var _28_2 = $"DNA Research Set 3/8_2/Button"
@onready var _28_3 = $"DNA Research Set 3/8_3/Button"
@onready var _28_4 = $"DNA Research Set 3/8_4/Button"
@onready var _28_5 = $"DNA Research Set 3/8_5/Button"

@onready var _29_1 = $"DNA Research Set 3/9_1/Button"
@onready var _29_2 = $"DNA Research Set 3/9_2/Button"

@onready var _30_1 = $"DNA Research Set 3/10_1/Button"
@onready var _30_2 = $"DNA Research Set 3/10_2/Button"

@onready var _31_1 = $"DNA Research Set 4/1_1/Button"

@onready var _32_1 = $"DNA Research Set 4/2_1/Button"
@onready var _32_2 = $"DNA Research Set 4/2_2/Button"

@onready var _33_1 = $"DNA Research Set 4/3_1/Button"
@onready var _33_2 = $"DNA Research Set 4/3_2/Button"

@onready var _34_1 = $"DNA Research Set 4/4_1/Button"
@onready var _34_2 = $"DNA Research Set 4/4_2/Button"
@onready var _34_3 = $"DNA Research Set 4/4_3/Button"
@onready var _34_4 = $"DNA Research Set 4/4_4/Button"
@onready var _34_5 = $"DNA Research Set 4/4_5/Button"

@onready var _35_1 = $"DNA Research Set 4/5_1/Button"
@onready var _35_2 = $"DNA Research Set 4/5_2/Button"

@onready var _36_1 = $"DNA Research Set 4/6_1/Button"
@onready var _36_2 = $"DNA Research Set 4/6_2/Button"
@onready var _36_3 = $"DNA Research Set 4/6_3/Button"
@onready var _36_4 = $"DNA Research Set 4/6_4/Button"
@onready var _36_5 = $"DNA Research Set 4/6_5/Button"
@onready var _36_6 = $"DNA Research Set 4/6_6/Button"
@onready var _36_7 = $"DNA Research Set 4/6_7/Button"

@onready var _37_1 = $"DNA Research Set 4/7_1/Button"
@onready var _37_2 = $"DNA Research Set 4/7_2/Button"

@onready var _38_1 = $"DNA Research Set 4/8_1/Button"
@onready var _38_2 = $"DNA Research Set 4/8_2/Button"
@onready var _38_3 = $"DNA Research Set 4/8_3/Button"
@onready var _38_4 = $"DNA Research Set 4/8_4/Button"
@onready var _38_5 = $"DNA Research Set 4/8_5/Button"

@onready var _39_1 = $"DNA Research Set 4/9_1/Button"
@onready var _39_2 = $"DNA Research Set 4/9_2/Button"

@onready var _40_1 = $"DNA Research Set 4/10_1/Button"
@onready var _40_2 = $"DNA Research Set 4/10_2/Button"

@onready var _41_1 = $"DNA Research Set 5/1_1/Button"

@onready var _42_1 = $"DNA Research Set 5/2_1/Button"
@onready var _42_2 = $"DNA Research Set 5/2_2/Button"

@onready var _43_1 = $"DNA Research Set 5/3_1/Button"
@onready var _43_2 = $"DNA Research Set 5/3_2/Button"

@onready var _44_1 = $"DNA Research Set 5/4_1/Button"
@onready var _44_2 = $"DNA Research Set 5/4_2/Button"
@onready var _44_3 = $"DNA Research Set 5/4_3/Button"
@onready var _44_4 = $"DNA Research Set 5/4_4/Button"
@onready var _44_5 = $"DNA Research Set 5/4_5/Button"

@onready var _45_1 = $"DNA Research Set 5/5_1/Button"
@onready var _45_2 = $"DNA Research Set 5/5_2/Button"

@onready var _46_1 = $"DNA Research Set 5/6_1/Button"
@onready var _46_2 = $"DNA Research Set 5/6_2/Button"
@onready var _46_3 = $"DNA Research Set 5/6_3/Button"
@onready var _46_4 = $"DNA Research Set 5/6_4/Button"
@onready var _46_5 = $"DNA Research Set 5/6_5/Button"
@onready var _46_6 = $"DNA Research Set 5/6_6/Button"
@onready var _46_7 = $"DNA Research Set 5/6_7/Button"

@onready var _47_1 = $"DNA Research Set 5/7_1/Button"
@onready var _47_2 = $"DNA Research Set 5/7_2/Button"

@onready var _48_1 = $"DNA Research Set 5/8_1/Button"
@onready var _48_2 = $"DNA Research Set 5/8_2/Button"
@onready var _48_3 = $"DNA Research Set 5/8_3/Button"
@onready var _48_4 = $"DNA Research Set 5/8_4/Button"
@onready var _48_5 = $"DNA Research Set 5/8_5/Button"

@onready var _49_1 = $"DNA Research Set 5/9_1/Button"
@onready var _49_2 = $"DNA Research Set 5/9_2/Button"

@onready var _50_1 = $"DNA Research Set 5/10_1/Button"
@onready var _50_2 = $"DNA Research Set 5/10_2/Button"

@onready var _51_1 = $"DNA Research Set 5/11_1/Button"


@onready var Unlock_Error = str("You must sequence a genome at least once before getting this upgrade.")
@onready var Point_Error = str("You do not have enough points to get this upgrade.")



@onready var GS_Time_Description_1 = str("Reduces Genome Sequencing time by 1 seconds.")
@onready var GS_Time_Description_2 = str("Reduces Genome Sequencing time by 0.5 seconds.")
@onready var GS_Time_Description_3 = str("Reduces Genome Sequencing time by 0.25 seconds.")

@onready var GS_1_Command = false#$"../../Sequencing Game".Specific_Potency
@onready var GS_1_Description = str("Potencies can be seen after sequencing a genome.")
@onready var GS_2_Command = false#$"../../Sequencing Game".Previous_Positive
@onready var GS_2_Description = str("Positive and Negative values of the previous sequencing will be labeled next to the nucleotide for the player to see.")
@onready var GS_3_Command = false#$"../../Sequencing Game".Previous_Potency
@onready var GS_3_Description = str("Specific potencies of the previous sequencing will be labeled next to the nucleotide for the player to see.")
@onready var GS_4_Command = false#$"../../Sequencing Game".Real_Time_Trait
@onready var GS_4_Description = str("Traits of the nucleotide will be labeled in real time.")
@onready var GS_5_Command = false#$"../../Sequencing Game".Real_Time_Positive
@onready var GS_5_Description = str("Positive and Negative values of the nucleotide will be labeled in real time.")
@onready var GS_6_Command = false#$"../../Sequencing Game".Real_Time_Potency
@onready var GS_6_Description = str("Specific potencies of the nucleotide will be labeled in real time.")

@onready var GS_Trait_Select_1_Command = false#$"../../Sequencing Game".Choose_Trait_1
@onready var GS_Trait_Select_1_Description = str("A specific trait can be selected for the fifth nucelotide.")
@onready var GS_Trait_Select_2_Command = false#$"../../Sequencing Game".Choose_Trait_2
@onready var GS_Trait_Select_2_Description = str("A specific trait can be selected for the sixth nucelotide.")
@onready var GS_Trait_Select_3_Command = false#$"../../Sequencing Game".Choose_Trait_3
@onready var GS_Trait_Select_3_Description = str("A specific trait can be selected for the seventh nucelotide.")

@onready var GS_Nucleotide_1_Command = false#$"../../Sequencing Game".Second_Nucleotide_Strain
@onready var GS_Nucleotide_1_Description = str("A second nucleotide strand will appear")
@onready var GS_Nucleotide_2_Command = false#$"../../Sequencing Game".Third_Nucleotide_Strain
@onready var GS_Nucleotide_2_Description = str("A third nucleotide strand will appear")

@onready var GS_Scientific_Combo_Upgrade_1_Command = false#$"../../Sequencing Game".SP_Combo_Necessity_Level_1
@onready var GS_Scientific_Combo_Upgrade_2_Command = false#$"../../Sequencing Game".SP_Combo_Necessity_Level_2
@onready var GS_Scientific_Combo_Upgrade_3_Command = false#$"../../Sequencing Game".SP_Combo_Necessity_Level_3
@onready var GS_Scientific_Yield_Description_1 = str("Increases Scientific Point Yield for Genome Sequencing Combos by 0.25 Points.")
@onready var GS_Scientific_Multiplier_Description_1 = str("Increases Scientific Point Multiplier for Genome Sequencing Combos by 0.125 Points.")
@onready var GS_Scientific_Combo_Upgrade_Description = str("Reduces Genome Sequencing Combo Requirement for Scientific Point Bonus by 1")

@onready var GS_Genome_Combo_Upgrade_1_Command = false#$"../../Sequencing Game".GP_Combo_Necessity_Level_1
@onready var GS_Genome_Combo_Upgrade_2_Command = false#$"../../Sequencing Game".GP_Combo_Necessity_Level_2
@onready var GS_Genome_Combo_Upgrade_3_Command = false#$"../../Sequencing Game".GP_Combo_Necessity_Level_3
@onready var GS_Genome_Yield_Description_1 = str("Increases Genome Point Yield for Genome Sequencing Combos by 0.25 Points.")
@onready var GS_Genome_Multiplier_Description_1 = str("Increases Genome Point Multiplier for Genome Sequencing Combos by 0.125 Points.")
@onready var GS_Genome_Combo_Upgrade_Description = str("Reduces Genome Sequencing Combo Requirement for Genome Point Bonus by 1")

@onready var GS_Trait_Combo_Upgrade_1_Command = false#$"../../Sequencing Game".XP_Combo_Necessity_Level_1
@onready var GS_Trait_Combo_Upgrade_2_Command = false#$"../../Sequencing Game".XP_Combo_Necessity_Level_2
@onready var GS_Trait_Combo_Upgrade_3_Command = false#$"../../Sequencing Game".XP_Combo_Necessity_Level_3
@onready var GS_Trait_Yield_Description_1 = str("Increases Trait Yield for Genome Sequencing Combos by 1 Points.")
@onready var GS_Trait_Multiplier_Description_1 = str("Increases Trait Multiplier for Genome Sequencing Combos by 0.25 Points.")
@onready var GS_Trait_Combo_Upgrade_Description = str("Reduces Genome Sequencing Combo Requirement for Trait Bonus by 1")


@onready var PD_Time_Description_1 = str("Reduces Plant Development time by 0.5 seconds.")
@onready var PD_Time_Description_2 = str("Reduces Plant Development time by 0.25 seconds.")

@onready var PD_Expansion_Level_1_Command = false#$"../../Plant Development Game".Expansion_Level_1
@onready var PD_Expansion_Level_2_Command = false#$"../../Plant Development Game".Expansion_Level_2
@onready var PD_Expansion_Level_3_Command = false#$"../../Plant Development Game".Expansion_Level_3
@onready var PD_Expansion_Level_4_Command = false#$"../../Plant Development Game".Expansion_Level_4
@onready var PD_Expansion_Level_5_Command = false#$"../../Plant Development Game".Expansion_Level_5
@onready var PD_Expansion_Description = str("Expands the Plant Development Grid by + 1x1")

@onready var PD_Heat_Command = false#$"../../Plant Development Game".Heat_Conditioning
@onready var PD_Heat_Description = str("Unlocks Heat conditioning for plants within Plant Development.")
@onready var PD_Cold_Command = false#$"../../Plant Development Game".Frozen_Conditioning
@onready var PD_Cold_Description = str("Unlocks Cold conditioning for plants within Plant Development.")
@onready var PD_Toxic_Command = false#$"../../Plant Development Game".Toxic_Conditioning
@onready var PD_Toxic_Description = str("Unlocks Toxic conditioning for plants within Plant Development.")
@onready var PD_Radioctive_Command = false#$"../../Plant Development Game".Radioactive_Conditioning
@onready var PD_Radioctive_Description = str("Unlocks Radioactive conditioning for plants within Plant Development.")

@onready var PD_Combo_Multiplier_Phase_1_Command = false#$"../../Plant Development Game".Combo_Multiplier_Phase_1
@onready var PD_Combo_Multiplier_Phase_1_Description = str("Golden Flowers can activate combos within Plant Development.")
@onready var PD_Combo_Multiplier_Phase_2_Command = false#$"../../Plant Development Game".Combo_Multiplier_Phase_2
@onready var PD_Combo_Multiplier_Phase_2_Description = str("Purple Flowers can activate combos within Plant Development.")

@onready var PD_Scientific_Combo_Upgrade_1_Command = false#$"../../Plant Development Game".SP_Combo_Necessity_Level_1
@onready var PD_Scientific_Combo_Upgrade_2_Command = false#$"../../Plant Development Game".SP_Combo_Necessity_Level_2
@onready var PD_Scientific_Combo_Upgrade_3_Command = false#$"../../Plant Development Game".SP_Combo_Necessity_Level_3
@onready var PD_Scientific_Combo_Upgrade_4_Command = false#$"../../Plant Development Game".SP_Combo_Necessity_Level_4
@onready var PD_Scientific_Combo_Upgrade_5_Command = false#$"../../Plant Development Game".SP_Combo_Necessity_Level_5
@onready var PD_Scientific_Yield_Description_1 = str("Increases Scientific Point Yield for Plant Development Combos by 0.25 Points.")
@onready var PD_Scientific_Multiplier_Description_1 = str("Increases Scientific Point Multiplier for Plant Development Combos by 0.125 Points.")
@onready var PD_Scientific_Combo_Upgrade_Description = str("Reduces Plant Development Combo Requirement for Scientific Point Bonus by 1")

@onready var PD_Genome_Combo_Upgrade_1_Command = false#$"../../Plant Development Game".GP_Combo_Necessity_Level_1
@onready var PD_Genome_Combo_Upgrade_2_Command = false#$"../../Plant Development Game".GP_Combo_Necessity_Level_2
@onready var PD_Genome_Combo_Upgrade_3_Command = false#$"../../Plant Development Game".GP_Combo_Necessity_Level_3
@onready var PD_Genome_Combo_Upgrade_4_Command = false#$"../../Plant Development Game".GP_Combo_Necessity_Level_4
@onready var PD_Genome_Combo_Upgrade_5_Command = false#$"../../Plant Development Game".GP_Combo_Necessity_Level_5
@onready var PD_Genome_Yield_Description_1 = str("Increases Genome Point Yield for Plant Development Combos by 0.25 Points.")
@onready var PD_Genome_Multiplier_Description_1 = str("Increases Genome Point Multiplier for Plant Development Combos by 0.125 Points.")
@onready var PD_Genome_Combo_Upgrade_Description = str("Reduces Plant Development Combo Requirement for Genome Point Bonus by 1")

@onready var PD_Specialized_Combo_Upgrade_1_Command = false#$"../../Plant Development Game".XP_Combo_Necessity_Level_1
@onready var PD_Specialized_Combo_Upgrade_2_Command = false#$"../../Plant Development Game".XP_Combo_Necessity_Level_2
@onready var PD_Specialized_Combo_Upgrade_3_Command = false#$"../../Plant Development Game".XP_Combo_Necessity_Level_3
@onready var PD_Specialized_Combo_Upgrade_4_Command = false#$"../../Plant Development Game".XP_Combo_Necessity_Level_4
@onready var PD_Specialized_Combo_Upgrade_5_Command = false#$"../../Plant Development Game".XP_Combo_Necessity_Level_5
@onready var PD_Specialized_Yield_Description_1 = str("Increases Specialized Point Yield for Plant Development Combos by 0.25 Points.")
@onready var PD_Specialized_Multiplier_Description_1 = str("Increases Specialized Point Multiplier for Plant Development Combos by 0.125 Points.")
@onready var PD_Specialized_Combo_Upgrade_Description = str("Reduces Plant Development Combo Requirement for Specialized Bonus by 1")

@onready var CD_Time_Description_1 = str("Reduces Crop Development time by 0.5 seconds.")
@onready var CD_Time_Description_2 = str("Reduces Crop Development time by 0.25 seconds.")

var Length_1 = false

var Length_2 = false

var Length_3 = false

var Length_4 = false


func _process(_delta):
	upgrades()
	
	if $"../../Sequencing Game".First_Sequence == true:
		_1_1.upgradable = true
	
	if $"DNA Research Set 1/10_1/Button".disabled == true or $"DNA Research Set 1/10_2/Button".disabled == true:
		if Length_1 == false:
			$"../..".Scientific_Tree_Position_X_Min -= 150
			Length_1 = true
		$"DNA Research Set 2/1_1".visible = true
		$"DNA Research Set 2/1_1/Button".upgradable = true
	if $"DNA Research Set 2/10_1/Button".disabled == true or $"DNA Research Set 2/10_2/Button".disabled == true:
		if Length_2 == false:
			$"../..".Scientific_Tree_Position_X_Min -= 150
			Length_2 = true
		$"DNA Research Set 3/1_1".visible = true
		$"DNA Research Set 3/1_1/Button".upgradable = true
	if $"DNA Research Set 3/10_1/Button".disabled == true or $"DNA Research Set 3/10_2/Button".disabled == true:
		if Length_3 == false:
			$"../..".Scientific_Tree_Position_X_Min -= 150
			Length_3 = true
		$"DNA Research Set 4/1_1".visible = true
		$"DNA Research Set 4/1_1/Button".upgradable = true
	if $"DNA Research Set 4/10_1/Button".disabled == true or $"DNA Research Set 4/10_2/Button".disabled == true:
		if Length_4 == false:
			$"../..".Scientific_Tree_Position_X_Min -= 150
			Length_4 = true
		$"DNA Research Set 5/1_1".visible = true
		$"DNA Research Set 5/1_1/Button".upgradable = true
	if $"DNA Research Set 5/10_1/Button".disabled == true or  $"DNA Research Set 5/10_2/Button".disabled == true: 
		$"DNA Research Set 5/11_1".visible = true
		$"DNA Research Set 5/11_1/Button".upgradable = true
	if $"DNA Research Set Bonus 1/10_1/Button".disabled == true:
		$"DNA Research Set Bonus 2/1_1".visible = true
		$"DNA Research Set Bonus 2/1_1/Button".upgradable = true
	if $"DNA Research Set Bonus 2/10_1/Button".disabled == true:
		$"DNA Research Set Bonus 3/1_1".visible = true
		$"DNA Research Set Bonus 3/1_1/Button".upgradable = true
	if $"DNA Research Set Bonus 3/10_1/Button".disabled == true:
		$"DNA Research Set Bonus 4/1_1".visible = true
		$"DNA Research Set Bonus 4/1_1/Button".upgradable = true
	if $"DNA Research Set Bonus 4/10_1/Button".disabled == true:
		$"DNA Research Set Bonus 5/1_1".visible = true
		$"DNA Research Set Bonus 5/1_1/Button".upgradable = true
	if $"DNA Research Set Bonus 5/10_1/Button".disabled == true:
		$"DNA Research Set Bonus 5/11_1".visible = true
		$"DNA Research Set Bonus 5/11_1/Button".upgradable = true
	if $"DNA Research Set Bonus2 1/10_1/Button".disabled == true:
		$"DNA Research Set Bonus2 2/1_1".visible = true
		$"DNA Research Set Bonus2 2/1_1/Button".upgradable = true
	if $"DNA Research Set Bonus2 2/10_1/Button".disabled == true:
		$"DNA Research Set Bonus2 3/1_1".visible = true
		$"DNA Research Set Bonus2 3/1_1/Button".upgradable = true
	if $"DNA Research Set Bonus2 3/10_1/Button".disabled == true:
		$"DNA Research Set Bonus2 4/1_1".visible = true
		$"DNA Research Set Bonus2 4/1_1/Button".upgradable = true
	if $"DNA Research Set Bonus2 4/10_1/Button".disabled == true:
		$"DNA Research Set Bonus2 5/1_1".visible = true
		$"DNA Research Set Bonus2 5/1_1/Button".upgradable = true
	if $"DNA Research Set Bonus2 5/10_1/Button".disabled == true:
		$"DNA Research Set Bonus2 5/11_1".visible = true
		$"DNA Research Set Bonus2 5/11_1/Button".upgradable = true

func upgrades():
	_startingNodeSetup(_1_1, GS_Time_C.bind(1), Unlock_Error, str("1.1") , GS_Time_Description_1, Unlock_Error)
	_singleNodeSetup(1, _2_1, GS_Time_C.bind(0.5), Point_Error, str("2.1"), GS_Time_Description_2)
	_singleNodeSetup(1, _2_2, GS_Time_C.bind(0.5), Point_Error, str("2.2"), GS_Time_Description_2)
	
	_singleNodeSetup(1, _3_1, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("3.1"), GS_Scientific_Yield_Description_1)
	_singleNodeSetup(1, _3_2, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("3.2"), GS_Scientific_Yield_Description_1)
	
	_doubleNodeSetup(2, _4_1, GS_1_C.bind(true), Point_Error, str("4.1"), GS_1_Description, _4_5)
	_singleNodeSetup(1, _4_2, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("4.2"), GS_Scientific_Multiplier_Description_1)
	_singleNodeSetup(2, _4_3, GS_4_C.bind(true), Point_Error, str("4.3"), GS_4_Description)
	_singleNodeSetup(1, _4_4, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("4.4"), GS_Scientific_Multiplier_Description_1)
	_doubleNodeSetup(2, _4_5, GS_1_C.bind(true), Point_Error, str("4.5"), GS_1_Description, _4_1)
	
	_singleNodeSetup(1, _5_1, GS_Time_C.bind(0.5), Point_Error, str("5.1"), GS_Time_Description_2)
	_singleNodeSetup(1, _5_2, GS_Time_C.bind(0.5), Point_Error, str("5.2"), GS_Time_Description_2)
	
	_doubleNodeSetup(3, _6_1, GS_2_C.bind(true), Point_Error, str("6.1"), GS_2_Description, _6_7)
	_singleNodeSetup(2, _6_2, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("6.2"), GS_Scientific_Multiplier_Description_1)
	_singleNodeSetup(2, _6_3, GS_Trait_Yield_C.bind(1), Point_Error, str("6.3"), GS_Trait_Yield_Description_1)
	_singleNodeSetup(3, _6_4, GS_Scientific_Combo_Upgrade_1_C.bind(true), Point_Error, str("6.4"), GS_Scientific_Combo_Upgrade_Description)
	_singleNodeSetup(2, _6_5, GS_Trait_Yield_C.bind(1), Point_Error, str("6.5"), GS_Trait_Yield_Description_1)
	_singleNodeSetup(2, _6_6, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("6.6"), GS_Scientific_Multiplier_Description_1)
	_doubleNodeSetup(3, _6_7, GS_2_C.bind(true), Point_Error, str("6.7"), GS_2_Description, _6_1)
	
	_singleNodeSetup(2, _7_1, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("7.1"), PD_Scientific_Yield_Description_1)
	_singleNodeSetup(2, _7_2, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("7.2"), PD_Scientific_Yield_Description_1)
	
	_doubleNodeSetup(3, _8_1, GS_3_C.bind(true), Point_Error, str("8.1"), GS_3_Description, _8_5)
	_singleNodeSetup(2, _8_2, GS_Genome_Yield_C.bind(0.25), Point_Error, str("8.2"), GS_Genome_Yield_Description_1)
	_singleNodeSetup(3, _8_3, GS_Trait_Select_1_C.bind(true), Point_Error, str("8.3"), GS_Trait_Select_1_Description)
	_singleNodeSetup(2, _8_4, GS_Genome_Yield_C.bind(0.25), Point_Error, str("8.4"), GS_Genome_Yield_Description_1)
	_doubleNodeSetup(3, _8_5, GS_3_C.bind(true), Point_Error, str("8.5"), GS_3_Description, _8_1)
	
	_singleNodeSetup(2, _9_1, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("9.1"), PD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(2, _9_2, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("9.2"), PD_Scientific_Multiplier_Description_1)
	
	_singleNodeSetup(2, _10_1, PD_Time_C.bind(0.5), Point_Error, str("10.1"), PD_Time_Description_1)
	_singleNodeSetup(2, _10_2, PD_Time_C.bind(0.5), Point_Error, str("10.2"), PD_Time_Description_1)
	
	
	_singleNodeSetup(4, _11_1, PD_Expansion_Level_1_C.bind(true), Point_Error, str("11.1"), PD_Expansion_Description)
	
	_singleNodeSetup(3, _12_1, GS_Time_C.bind(0.5), Point_Error, str("12.1"), GS_Time_Description_2,)
	_singleNodeSetup(3, _12_2, GS_Time_C.bind(0.5), Point_Error, str("12.2"), GS_Time_Description_2)
	
	_singleNodeSetup(3, _13_1, GS_Trait_Yield_C.bind(1), Point_Error, str("13.1"), GS_Trait_Yield_Description_1)
	_singleNodeSetup(3, _13_2, GS_Trait_Yield_C.bind(1), Point_Error, str("13.2"), GS_Trait_Yield_Description_1)
	
	_doubleNodeSetup(4, _14_1, PD_Combo_Multiplier_Phase_1_C.bind(true), Point_Error, str("14.1"), PD_Combo_Multiplier_Phase_1_Description, _14_5)
	_singleNodeSetup(3, _14_2, GS_Genome_Multiplier_C.bind(0.125), Point_Error, str("14.2"), GS_Genome_Multiplier_Description_1)
	_singleNodeSetup(4, _14_3, GS_5_C.bind(true), Point_Error, str("14.3"), GS_5_Description)
	_singleNodeSetup(3, _14_4, GS_Genome_Multiplier_C.bind(0.125), Point_Error, str("14.4"), GS_Genome_Multiplier_Description_1)
	_doubleNodeSetup(4, _14_5, PD_Combo_Multiplier_Phase_1_C.bind(true), Point_Error, str("14.5"), PD_Combo_Multiplier_Phase_1_Description, _14_1)
	
	_singleNodeSetup(3, _15_1, PD_Time_C.bind(0.5), Point_Error, str("15.1"), PD_Time_Description_1)
	_singleNodeSetup(3, _15_2, PD_Time_C.bind(0.5), Point_Error, str("15.2"), PD_Time_Description_1)
	
	_doubleNodeSetup(5, _16_1, PD_Heat_C.bind(true), Point_Error, str("16.1"), PD_Heat_Description, _16_7)
	_singleNodeSetup(4, _16_2, GS_Time_C.bind(0.25), Point_Error, str("16.2"), GS_Time_Description_3)
	_singleNodeSetup(4, _16_3, PD_Genome_Multiplier_C.bind(0.125), Point_Error, str("16.3"), PD_Genome_Multiplier_Description_1)
	_singleNodeSetup(5, _16_4, GS_Nucleotide_1_C.bind(true), Point_Error, str("16.4"), GS_Nucleotide_1_Description)
	_singleNodeSetup(4, _16_5, PD_Genome_Multiplier_C.bind(0.125), Point_Error, str("16.5"), PD_Genome_Multiplier_Description_1)
	_singleNodeSetup(4, _16_6, GS_Time_C.bind(0.25), Point_Error, str("16.6"), GS_Time_Description_3)
	_doubleNodeSetup(5, _16_7, PD_Heat_C.bind(true), Point_Error, str("16.7"), PD_Heat_Description, _16_1)
	
	_singleNodeSetup(4, _17_1, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("17.1"), GS_Scientific_Yield_Description_1)
	_singleNodeSetup(4, _17_2, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("17.2"), GS_Scientific_Yield_Description_1)
	
	_doubleNodeSetup(5, _18_1, GS_Genome_Combo_Upgrade_1_C.bind(true), Point_Error, str("18.1"), GS_Genome_Combo_Upgrade_Description, _18_5)
	_singleNodeSetup(4, _18_2, GS_Trait_Yield_C.bind(1), Point_Error, str("18.2"), GS_Trait_Yield_Description_1)
	_singleNodeSetup(5, _18_3, GS_Trait_Select_2_C.bind(true), Point_Error, str("18.3"), GS_Trait_Select_2_Description)
	_singleNodeSetup(4, _18_4, GS_Trait_Yield_C.bind(1), Point_Error, str("18.4"), GS_Trait_Yield_Description_1)
	_doubleNodeSetup(5, _18_5, GS_Genome_Combo_Upgrade_1_C.bind(true), Point_Error, str("18.5"), GS_Genome_Combo_Upgrade_Description, _18_1)
	
	_singleNodeSetup(4, _19_1, GS_Genome_Yield_C.bind(0.25), Point_Error, str("19.1"), GS_Genome_Yield_Description_1)
	_singleNodeSetup(4, _19_2, GS_Genome_Yield_C.bind(0.25), Point_Error, str("19.2"), GS_Genome_Yield_Description_1)
	
	_singleNodeSetup(4, _20_1, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("20.1"), PD_Scientific_Yield_Description_1)
	_singleNodeSetup(4, _20_2, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("20.2"), PD_Scientific_Yield_Description_1)
	
	
	_singleNodeSetup(6, _21_1, GS_6_C.bind(true), Point_Error, str("21.1"), GS_6_Description)
	
	_singleNodeSetup(5, _22_1, PD_Genome_Multiplier_C.bind(0.125), Point_Error, str("22.1"), PD_Genome_Multiplier_Description_1)
	_singleNodeSetup(5, _22_2, PD_Genome_Multiplier_C.bind(0.125), Point_Error, str("22.2"), PD_Genome_Multiplier_Description_1)
	
	_singleNodeSetup(5, _23_1, PD_Time_C.bind(0.25), Point_Error, str("23.1"), PD_Time_Description_2)
	_singleNodeSetup(5, _23_2, PD_Time_C.bind(0.25), Point_Error, str("23.2"), PD_Time_Description_2)
	
	_doubleNodeSetup(6, _24_1, PD_Expansion_Level_2_C.bind(true), Point_Error, str("24.1"), PD_Expansion_Description, _24_5)
	_singleNodeSetup(5, _24_2, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("24.2"), GS_Trait_Multiplier_Description_1)
	_singleNodeSetup(6, _24_3, GS_Scientific_Combo_Upgrade_2_C.bind(true), Point_Error, str("24.3"), GS_Scientific_Combo_Upgrade_Description)
	_singleNodeSetup(5, _24_4, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("24.4"), GS_Trait_Multiplier_Description_1)
	_doubleNodeSetup(6, _24_5, PD_Expansion_Level_2_C.bind(true), Point_Error, str("24.5"), PD_Expansion_Description, _24_1)
	
	_singleNodeSetup(5, _25_1, GS_Time_C.bind(0.25), Point_Error, str("25.1"), GS_Time_Description_3)
	_singleNodeSetup(5, _25_2, GS_Time_C.bind(0.25), Point_Error, str("25.2"), GS_Time_Description_3)
	
	_doubleNodeSetup(7, _26_1, PD_Scientific_Combo_Upgrade_1_C.bind(true), Point_Error, str("26.1"), PD_Scientific_Combo_Upgrade_Description, _26_7)
	_singleNodeSetup(6, _26_2, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("26.2"), GS_Scientific_Yield_Description_1)
	_singleNodeSetup(6, _26_3, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("26.3"), PD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(7, _26_4, PD_Genome_Combo_Upgrade_1_C.bind(true), Point_Error, str("26.4"), PD_Genome_Combo_Upgrade_Description)
	_singleNodeSetup(6, _26_5, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("26.5"), PD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(6, _26_6, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("26.6"), GS_Scientific_Yield_Description_1)
	_doubleNodeSetup(7, _26_7, PD_Scientific_Combo_Upgrade_1_C.bind(true), Point_Error, str("26.7"), PD_Scientific_Combo_Upgrade_Description, _26_1)
	
	_singleNodeSetup(6, _27_1, CD_Time_C.bind(0.5), Point_Error, str("27.1"), CD_Time_Description_1)
	_singleNodeSetup(6, _27_2, CD_Time_C.bind(0.5), Point_Error, str("27.2"), CD_Time_Description_1)
	
	_doubleNodeSetup(7, _28_1, PD_Cold_C.bind(true), Point_Error, str("28.1"), PD_Cold_Description, _28_5)
	_singleNodeSetup(6, _28_2, PD_Specialized_Yield_C.bind(0.25), Point_Error, str("28.2"), PD_Specialized_Yield_Description_1)
	_singleNodeSetup(7, _28_3, PD_Combo_Multiplier_Phase_2_C.bind(true), Point_Error, str("28.3"), PD_Combo_Multiplier_Phase_2_Description)
	_singleNodeSetup(6, _28_4, PD_Specialized_Yield_C.bind(0.25), Point_Error, str("28.4"), PD_Specialized_Yield_Description_1)
	_doubleNodeSetup(7, _28_5, PD_Cold_C.bind(true), Point_Error, str("28.5"), PD_Cold_Description, _28_1)
	
	_singleNodeSetup(6, _29_1, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("29.1"), PD_Scientific_Yield_Description_1)
	_singleNodeSetup(6, _29_2, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("29.2"), PD_Scientific_Yield_Description_1)
	
	_singleNodeSetup(6, _30_1, PD_Time_C.bind(0.25), Point_Error, str("30.1"), PD_Time_Description_2)
	_singleNodeSetup(6, _30_2, PD_Time_C.bind(0.25), Point_Error, str("30.2"), PD_Time_Description_2)
	
	
	_singleNodeSetup(8, _31_1, PD_Expansion_Level_3_C.bind(true), Point_Error, str("31.1"), PD_Expansion_Description)
	
	_singleNodeSetup(7, _32_1, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("32.1"), GS_Scientific_Multiplier_Description_1)
	_singleNodeSetup(7, _32_2, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("32.2"), GS_Scientific_Multiplier_Description_1)

	_singleNodeSetup(7, _33_1, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("33.1"), GS_Trait_Multiplier_Description_1)
	_singleNodeSetup(7, _33_2, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("33.2"), GS_Trait_Multiplier_Description_1)
	
	_doubleNodeSetup(8, _34_1, PD_Scientific_Combo_Upgrade_2_C.bind(true), Point_Error, str("34.1"), PD_Scientific_Combo_Upgrade_Description, _34_5)
	_singleNodeSetup(7, _34_2, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("34.2"), PD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(8, _34_3, PD_Genome_Combo_Upgrade_2_C.bind(true), Point_Error, str("34.3"), PD_Genome_Combo_Upgrade_Description)
	_singleNodeSetup(7, _34_4, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("34.4"), PD_Scientific_Multiplier_Description_1)
	_doubleNodeSetup(8, _34_5, PD_Scientific_Combo_Upgrade_2_C.bind(true), Point_Error, str("34.5"), PD_Scientific_Combo_Upgrade_Description, _34_1)
	
	_singleNodeSetup(7, _35_1, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("35.1"), GS_Scientific_Yield_Description_1)
	_singleNodeSetup(7, _35_2, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("35.2"), GS_Scientific_Yield_Description_1)
	
	_doubleNodeSetup(9, _36_1, PD_Toxic_C.bind(true), Point_Error, str("36.1"), PD_Toxic_Description, _36_7)
	_singleNodeSetup(8, _36_2, CD_Time_C.bind(0.25), Point_Error, str("36.2"), CD_Time_Description_2)
	_singleNodeSetup(8, _36_3, PD_Specialized_Multiplier_C.bind(0.125), Point_Error, str("36.3"), PD_Specialized_Multiplier_Description_1)
	_singleNodeSetup(9, _36_4, GS_Trait_Combo_Upgrade_1_C.bind(true), Point_Error, str("36.4"), GS_Trait_Combo_Upgrade_Description)
	_singleNodeSetup(8, _36_5, PD_Specialized_Multiplier_C.bind(0.125), Point_Error, str("36.5"), PD_Specialized_Multiplier_Description_1)
	_singleNodeSetup(8, _36_6, CD_Time_C.bind(0.25), Point_Error, str("36.6"), CD_Time_Description_2)
	_doubleNodeSetup(9, _36_7, PD_Toxic_C.bind(true), Point_Error, str("36.7"), PD_Toxic_Description, _36_1)
	
	_singleNodeSetup(8, _37_1, PD_Specialized_Yield_C.bind(0.25), Point_Error, str("37.1"), PD_Specialized_Combo_Upgrade_Description)
	_singleNodeSetup(8, _37_2, PD_Specialized_Yield_C.bind(0.25), Point_Error, str("37.2"), PD_Specialized_Combo_Upgrade_Description)
	
	_doubleNodeSetup(9, _38_1, PD_Specialized_Combo_Upgrade_1_C.bind(true), Point_Error, str("38.1"), PD_Specialized_Combo_Upgrade_Description, _38_5)
	_singleNodeSetup(8, _38_2, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("38.2"), GS_Trait_Multiplier_Description_1)
	_singleNodeSetup(9, _38_3, CD_Time_C.bind(0.5), Point_Error, str("38.3"), CD_Time_Description_1)
	_singleNodeSetup(8, _38_4, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("38.4"), GS_Trait_Multiplier_Description_1)
	_doubleNodeSetup(9, _38_5, PD_Specialized_Combo_Upgrade_1_C.bind(true), Point_Error, str("38.5"), PD_Specialized_Combo_Upgrade_Description, _38_1)
	
	_singleNodeSetup(8, _39_1, CD_Time_C.bind(0.25), Point_Error, str("39.1"), CD_Time_Description_2)
	_singleNodeSetup(8, _39_2, CD_Time_C.bind(0.25), Point_Error, str("39.2"), CD_Time_Description_2)
	
	_singleNodeSetup(8, _40_1, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("40.1"), GS_Scientific_Multiplier_Description_1)
	_singleNodeSetup(8, _40_2, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("40.2"), GS_Scientific_Multiplier_Description_1)
	
	
	_singleNodeSetup(10, _41_1, GS_Nucleotide_2_C.bind(true), Point_Error, str("41.1"), GS_Nucleotide_2_Description)
	
	_singleNodeSetup(9, _42_1, PD_Time_C.bind(0.25), Point_Error, str("42.1"), PD_Time_Description_2)
	_singleNodeSetup(9, _42_2, PD_Time_C.bind(0.25), Point_Error, str("42.2"), PD_Time_Description_2)
	
	_singleNodeSetup(9, _43_1, CD_Time_C.bind(0.25), Point_Error, str("43.1"), CD_Time_Description_2)
	_singleNodeSetup(9, _43_2, CD_Time_C.bind(0.25), Point_Error, str("43.2"), CD_Time_Description_2)
	
	_doubleNodeSetup(10, _44_1, GS_Trait_Combo_Upgrade_2_C.bind(true), Point_Error, str("44.1"), GS_Trait_Combo_Upgrade_Description, _44_5)
	_singleNodeSetup(9, _44_2, GS_Genome_Multiplier_C.bind(0.125), Point_Error, str("44.2"), GS_Genome_Multiplier_Description_1)
	_singleNodeSetup(10, _44_3, GS_Genome_Combo_Upgrade_2_C.bind(true), Point_Error, str("44.3"), GS_Genome_Combo_Upgrade_Description)
	_singleNodeSetup(9, _44_4, GS_Genome_Multiplier_C.bind(0.125), Point_Error, str("44.4"), GS_Genome_Multiplier_Description_1)
	_doubleNodeSetup(10, _44_5, GS_Trait_Combo_Upgrade_2_C.bind(true), Point_Error, str("44.5"), GS_Trait_Combo_Upgrade_Description, _44_1)
	
	_singleNodeSetup(9, _45_1, GS_Genome_Yield_C.bind(0.25), Point_Error, str("45.1"), GS_Genome_Yield_Description_1)
	_singleNodeSetup(9, _45_2, GS_Genome_Yield_C.bind(0.25), Point_Error, str("45.2"), GS_Genome_Yield_Description_1)
	
	_doubleNodeSetup(11, _46_1, PD_Specialized_Combo_Upgrade_2_C.bind(true), Point_Error, str("46.1"), PD_Specialized_Combo_Upgrade_Description, _46_7)
	_singleNodeSetup(10, _46_2, PD_Specialized_Yield_C.bind(0.25), Point_Error, str("46.2"), PD_Specialized_Yield_Description_1)
	_singleNodeSetup(10, _46_3, CD_Time_C.bind(0.25), Point_Error, str("46.3"), CD_Time_Description_2)
	_singleNodeSetup(11, _46_4, PD_Radioctive_C.bind(true), Point_Error, str("46.4"), PD_Radioctive_Description)
	_singleNodeSetup(10, _46_5, CD_Time_C.bind(0.25), Point_Error, str("46.5"), CD_Time_Description_2)
	_singleNodeSetup(10, _46_6, PD_Specialized_Yield_C.bind(0.25), Point_Error, str("46.6"), PD_Specialized_Yield_Description_1)
	_doubleNodeSetup(11, _46_7, PD_Specialized_Combo_Upgrade_2_C.bind(true), Point_Error, str("46.7"), PD_Specialized_Combo_Upgrade_Description, _46_1)
	
	_singleNodeSetup(10, _47_1, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("47.1"), PD_Scientific_Combo_Upgrade_Description)
	_singleNodeSetup(10, _47_2, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("47.2"), PD_Scientific_Combo_Upgrade_Description)
	
	_doubleNodeSetup(11, _48_1, GS_Trait_Combo_Upgrade_3_C.bind(true), Point_Error, str("48.1"), GS_Trait_Combo_Upgrade_Description, _48_5)
	_singleNodeSetup(10, _48_2, CD_Time_C.bind(0.25), Point_Error, str("48.2"), CD_Time_Description_2)
	_singleNodeSetup(11, _48_3, PD_Time_C.bind(0.5), Point_Error, str("48.3"), PD_Time_Description_1)
	_singleNodeSetup(10, _48_4, CD_Time_C.bind(0.25), Point_Error, str("48.4"), CD_Time_Description_2)
	_doubleNodeSetup(11, _48_5, GS_Trait_Combo_Upgrade_3_C.bind(true), Point_Error, str("48.5"), GS_Trait_Combo_Upgrade_Description, _48_1)
	
	_singleNodeSetup(10, _49_1, PD_Specialized_Multiplier_C.bind(0.125), Point_Error, str("49.1"), PD_Specialized_Multiplier_Description_1)
	_singleNodeSetup(10, _49_2, PD_Specialized_Multiplier_C.bind(0.125), Point_Error, str("49.2"), PD_Specialized_Multiplier_Description_1)
	
	_singleNodeSetup(10, _50_1, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("50.1"), PD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(10, _50_2, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("50.2"), PD_Scientific_Multiplier_Description_1)

func _startingNodeSetup(Upgrade_Node, _Upgrade, Error_Text, Upgrade_Name, Description, Requirements):
	if Upgrade_Node.upgradable == true && Upgrade_Node.disabled == true:
		if Upgrade_Node.activated == false:
			_Upgrade.call()
			Upgrade_Node.activated = true
			Upgrade_Node._Play_Click_Sound()
	elif Upgrade_Node.button_pressed == true && Upgrade_Node.upgradable == false:
		Node_Error.text = Error_Text
		Node_Error.visibility = 1
		Upgrade_Node._Play_Fail_Sound()
	if Upgrade_Node.in_range == true:
		Node_Name.text = Upgrade_Name
		Node_Effect.text = Description
		Node_Cost.text = Requirements

func _singleNodeSetup(Points, Upgrade_Node, _Upgrade, Error_Text, Upgrade_Name, Description):
	if Upgrade_Node.upgradable == true && Upgrade_Node.disabled == true:
		if $"../../".Scientific_Research_Points >= Points && Upgrade_Node.activated == false:
			$"../../".Scientific_Research_Points -= Points
			_Upgrade.call()
			Upgrade_Node.activated = true
			Upgrade_Node._Play_Click_Sound()
		elif $"../../".Scientific_Research_Points < Points && Upgrade_Node.activated == false:
			Upgrade_Node.disabled = false
			Node_Error.text = Error_Text
			Node_Error.visibility = 1
			Upgrade_Node._Play_Fail_Sound()
			
	if Upgrade_Node.in_range == true:
		Node_Name.text = Upgrade_Name
		Node_Effect.text = Description
		if Points >= 1:
			Node_Cost.text = str("Costs ") + str(Points) + str(" Scientific Research Points.")
		else:
			Node_Cost.text = str("Costs ") + str(Points) + str(" Scientific Research Point.")

func _doubleNodeSetup(Points, Upgrade_Node, _Upgrade, Error_Text, Upgrade_Name, Description, SisterNode):
	if Upgrade_Node.upgradable == true && Upgrade_Node.disabled == true:
		if ($"../../".Scientific_Research_Points >= Points && Upgrade_Node.activated == false) or SisterNode.disabled == true:
			if SisterNode.disabled == false:
				$"../../".Scientific_Research_Points -= Points
				_Upgrade.call()
				Upgrade_Node.activated = true
				Upgrade_Node.upgraded = true
				Upgrade_Node._Play_Click_Sound()
			elif Upgrade_Node.upgraded == false:#if Upgrade_Node.disabled == false:
				$"../../".Scientific_Research_Points += Points
				Upgrade_Node.upgraded = true
				Upgrade_Node._Play_Click_Sound()
		if $"../../".Scientific_Research_Points < Points && Upgrade_Node.activated == false && SisterNode.activated == false:
			Upgrade_Node.disabled = false
			Node_Error.text = Error_Text
			Node_Error.visibility = 1
			Upgrade_Node._Play_Fail_Sound()
	if Upgrade_Node.in_range == true:
		Node_Name.text = Upgrade_Name
		Node_Effect.text = Description
		if Points >= 1:
			Node_Cost.text = str("Costs ") + str(Points) + str(" Scientific Research Points.") + str("

If this upgrade is already activated, then instead recieve ") + str(Points) + str(" Scientific Research Points.")
		else:
			Node_Cost.text = str("Costs ") + str(Points) + str(" Scientific Research Point.") + str("

If this upgrade is already activated, then instead recieve ") + str(Points) + str(" Scientific Research Points.")

func GS_Time_C(Amount):
	$"../../Sequencing Game".Seconds_To_Sequence -= Amount


func GS_1_C(Bool):
	$"../../Sequencing Game".Specific_Potency = Bool

func GS_2_C(Bool):
	$"../../Sequencing Game".Previous_Positive = Bool

func GS_3_C(Bool):
	$"../../Sequencing Game".Previous_Potency = Bool

func GS_4_C(Bool):
	$"../../Sequencing Game".Real_Time_Trait = Bool

func GS_5_C(Bool):
	$"../../Sequencing Game".Real_Time_Positive = Bool

func GS_6_C(Bool):
	$"../../Sequencing Game".Real_Time_Potency = Bool


func GS_Trait_Select_1_C(Bool):
	$"../../Sequencing Game".Choose_Trait_1 = Bool

func GS_Trait_Select_2_C(Bool):
	$"../../Sequencing Game".Choose_Trait_2 = Bool

func GS_Trait_Select_3_C(Bool):
	$"../../Sequencing Game".Choose_Trait_3 = Bool


func GS_Nucleotide_1_C(Bool):
	$"../../Sequencing Game".Second_Nucleotide_Strain = Bool

func GS_Nucleotide_2_C(Bool):
	$"../../Sequencing Game".Third_Nucleotide_Strain = Bool


func GS_Scientific_Yield_C(Amount):
	$"../../Sequencing Game".SP_Combo_Flat_Gain += Amount
	

func GS_Scientific_Multiplier_C(Amount):
	$"../../Sequencing Game".SP_Combo_Excess_Multiplier += Amount

func GS_Scientific_Combo_Upgrade_1_C(Bool):
	$"../../Sequencing Game".SP_Combo_Necessity_Level_1 = Bool

func GS_Scientific_Combo_Upgrade_2_C(Bool):
	$"../../Sequencing Game".SP_Combo_Necessity_Level_2 = Bool

func GS_Scientific_Combo_Upgrade_3_C(Bool):
	$"../../Sequencing Game".SP_Combo_Necessity_Level_3 = Bool


func GS_Genome_Yield_C(Amount):
	$"../../Sequencing Game".GP_Combo_Flat_Gain += Amount

func GS_Genome_Multiplier_C(Amount):
	$"../../Sequencing Game".GP_Combo_Excess_Multiplier += Amount

func GS_Genome_Combo_Upgrade_1_C(Bool):
	$"../../Sequencing Game".GP_Combo_Necessity_Level_1 = Bool

func GS_Genome_Combo_Upgrade_2_C(Bool):
	$"../../Sequencing Game".GP_Combo_Necessity_Level_2 = Bool

func GS_Genome_Combo_Upgrade_3_C(Bool):
	$"../../Sequencing Game".GP_Combo_Necessity_Level_3 = Bool


func GS_Trait_Yield_C(Amount):
	$"../../Sequencing Game".Trait_Combo_Flat_Gain += Amount

func GS_Trait_Multiplier_C(Amount):
	$"../../Sequencing Game".Trait_Combo_Excess_Multiplier += Amount

func GS_Trait_Combo_Upgrade_1_C(Bool):
	$"../../Sequencing Game".XP_Combo_Necessity_Level_1 = Bool

func GS_Trait_Combo_Upgrade_2_C(Bool):
	$"../../Sequencing Game".XP_Combo_Necessity_Level_2 = Bool

func GS_Trait_Combo_Upgrade_3_C(Bool):
	$"../../Sequencing Game".XP_Combo_Necessity_Level_3 = Bool


func PD_Time_C(Amount):
	$"../../Plant Development Game".Seconds_To_Sequence -= Amount


func PD_Expansion_Level_1_C(Bool):
	$"../../Plant Development Game".Expansion_Level_1 = Bool

func PD_Expansion_Level_2_C(Bool):
	$"../../Plant Development Game".Expansion_Level_2 = Bool

func PD_Expansion_Level_3_C(Bool):
	$"../../Plant Development Game".Expansion_Level_3 = Bool

func PD_Expansion_Level_4_C(Bool):
	$"../../Plant Development Game".Expansion_Level_4 = Bool

func PD_Expansion_Level_5_C(Bool):
	$"../../Plant Development Game".Expansion_Level_5 = Bool


func PD_Heat_C(Bool):
	$"../../Plant Development Game".Heat_Conditioning = Bool

func PD_Cold_C(Bool):
	$"../../Plant Development Game".Frozen_Conditioning = Bool

func PD_Toxic_C(Bool):
	$"../../Plant Development Game".Toxic_Conditioning = Bool

func PD_Radioctive_C(Bool):
	$"../../Plant Development Game".Radioactive_Conditioning = Bool


func PD_Combo_Multiplier_Phase_1_C(Bool):
	$"../../Plant Development Game".Combo_Multiplier_Phase_1 = Bool

func PD_Combo_Multiplier_Phase_2_C(Bool):
	$"../../Plant Development Game".Combo_Multiplier_Phase_2 = Bool


func PD_Scientific_Yield_C(Amount):
	$"../../Plant Development Game".SP_Combo_Flat_Gain += Amount

func PD_Scientific_Multiplier_C(Amount):
	$"../../Plant Development Game".SP_Combo_Excess_Multiplier += Amount

func PD_Scientific_Combo_Upgrade_1_C(Bool):
	$"../../Plant Development Game".SP_Combo_Necessity_Level_1 = Bool

func PD_Scientific_Combo_Upgrade_2_C(Bool):
	$"../../Plant Development Game".SP_Combo_Necessity_Level_2 = Bool

func PD_Scientific_Combo_Upgrade_3_C(Bool):
	$"../../Plant Development Game".SP_Combo_Necessity_Level_3 = Bool

func PD_Scientific_Combo_Upgrade_4_C(Bool):
	$"../../Plant Development Game".SP_Combo_Necessity_Level_4 = Bool

func PD_Scientific_Combo_Upgrade_5_C(Bool):
	$"../../Plant Development Game".SP_Combo_Necessity_Level_5 = Bool


func PD_Genome_Yield_C(Amount):
	$"../../Plant Development Game".GP_Combo_Flat_Gain += Amount

func PD_Genome_Multiplier_C(Amount):
	$"../../Plant Development Game".GP_Combo_Excess_Multiplier += Amount

func PD_Genome_Combo_Upgrade_1_C(Bool):
	$"../../Plant Development Game".GP_Combo_Necessity_Level_1 = Bool

func PD_Genome_Combo_Upgrade_2_C(Bool):
	$"../../Plant Development Game".GP_Combo_Necessity_Level_2 = Bool

func PD_Genome_Combo_Upgrade_3_C(Bool):
	$"../../Plant Development Game".GP_Combo_Necessity_Level_3 = Bool

func PD_Genome_Combo_Upgrade_4_C(Bool):
	$"../../Plant Development Game".GP_Combo_Necessity_Level_4 = Bool

func PD_Genome_Combo_Upgrade_5_C(Bool):
	$"../../Plant Development Game".GP_Combo_Necessity_Level_5 = Bool


func PD_Specialized_Yield_C(Amount):
	$"../../Plant Development Game".XP_Combo_Flat_Gain += Amount

func PD_Specialized_Multiplier_C(Amount):
	$"../../Plant Development Game".XP_Combo_Excess_Multiplier += Amount

func PD_Specialized_Combo_Upgrade_1_C(Bool):
	$"../../Plant Development Game".XP_Combo_Necessity_Level_1 = Bool

func PD_Specialized_Combo_Upgrade_2_C(Bool):
	$"../../Plant Development Game".XP_Combo_Necessity_Level_2 = Bool

func PD_Specialized_Combo_Upgrade_3_C(Bool):
	$"../../Plant Development Game".XP_Combo_Necessity_Level_3 = Bool

func PD_Specialized_Combo_Upgrade_4_C(Bool):
	$"../../Plant Development Game".XP_Combo_Necessity_Level_4 = Bool

func PD_Specialized_Combo_Upgrade_5_C(Bool):
	$"../../Plant Development Game".XP_Combo_Necessity_Level_5 = Bool


func CD_Time_C(Amount):
	$"../../Crop Diagnosis".Seconds_To_Sequence -= Amount

func Warning():
	$"../../User Interface/Research Node UI/Node Warning/Node Name".visibility = 1
