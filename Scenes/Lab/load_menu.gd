extends Control


@onready var SaveState = $"../Menu".SaveState
@onready var LoadState = $"../Menu".LoadState

func _on_save_1_button_down() -> void:
	var SaveFile = SaveLoad.SaveFileData1

	
	_Save_Load(SaveFile)

func _on_save_2_button_down() -> void:
	var SaveFile = SaveLoad.SaveFileData2

	_Save_Load(SaveFile)


func _on_save_3_button_down() -> void:
	var SaveFile = SaveLoad.SaveFileData3

	_Save_Load(SaveFile)


func _on_save_4_button_down() -> void:
	var SaveFile = SaveLoad.SaveFileData4

	_Save_Load(SaveFile)

func _Save_Load(SaveData):
	SaveState = $"../Menu".SaveState
	LoadState = $"../Menu".LoadState
	if SaveState == true:
		print("SaveState")
		SaveData.Scientific_Research_Points = $"../../../..".Scientific_Research_Points
		SaveData.Genome_Research_Points = $"../../../..".Genome_Research_Points
		SaveData.Specialized_Research_Points = $"../../../..".Specialized_Research_Points

		SaveData.Apples = $"../../../..".Apples
		SaveData.Oranges = $"../../../..".Oranges
		SaveData.Bananas = $"../../../..".Bananas
		SaveData.Strawberries = $"../../../..".Strawberries
		SaveData.Blueberries = $"../../../..".Blueberries
		SaveData.Potatos = $"../../../..".Potatos
		SaveData.Tomatos = $"../../../..".Tomatos
		SaveData.Carrots = $"../../../..".Carrots
		SaveData.Cucumbers = $"../../../..".Cucumbers
		SaveData.Corn = $"../../../..".Corn

		SaveData.Scientific_Tree_Position_X_Max = $"../../../..".Scientific_Tree_Position_X_Max
		SaveData.Scientific_Tree_Position_X_Min = $"../../../..".Scientific_Tree_Position_X_Min
		SaveData.Scientific_Tree_Position_Y_Max = $"../../../..".Scientific_Tree_Position_Y_Max
		SaveData.Scientific_Tree_Position_Y_Min = $"../../../..".Scientific_Tree_Position_Y_Min

		SaveData.Genome_Tree_Position_X_Max = $"../../../..".Genome_Tree_Position_X_Max
		SaveData.Genome_Tree_Position_X_Min = $"../../../..".Genome_Tree_Position_X_Min
		SaveData.Genome_Tree_Position_Y_Max = $"../../../..".Genome_Tree_Position_Y_Max
		SaveData.Genome_Tree_Position_Y_Min = $"../../../..".Genome_Tree_Position_Y_Min

		SaveData.Specalized_Tree_Position_X_Max = $"../../../..".Specalized_Tree_Position_X_Max
		SaveData.Specalized_Tree_Position_X_Min = $"../../../..".Specalized_Tree_Position_X_Min
		SaveData.Specalized_Tree_Position_Y_Max = $"../../../..".Specalized_Tree_Position_Y_Max
		SaveData.Specalized_Tree_Position_Y_Min = $"../../../..".Specalized_Tree_Position_Y_Min


		SaveData.Specific_Potency = false
		SaveData.Previous_Positive = false
		SaveData.Previous_Potency = false
		SaveData.Real_Time_Trait = false
		SaveData.Real_Time_Positive = false
		SaveData.Real_Time_Potency = false

		SaveData.Choose_Trait_1 = false
		SaveData.Choose_Trait_2 = false
		SaveData.Choose_Trait_3 = false
		SaveData.Second_Nucleotide_Strain = false
		SaveData.Third_Nucleotide_Strain = false

		SaveData.Nucleotide_Min_Base = 1
		SaveData.Nucleotide_Max_Base = 3
		SaveData.Nucleotide_Min_Rand = 2
		SaveData.Nucleotide_Max_Rand = 2

		#SaveData.Major_Potency_Min = Nucleotide_Max_Base

		SaveData.GS_Seconds_To_Sequence = float(6)

		SaveData.First_Sequence = true

		SaveData.SP_Expansion_Level = 0
		SaveData.GP_Expansion_Level = 0
		SaveData.XP_Expansion_Level = 0

		SaveData.Longevity = 0
		SaveData.Growth = 0
		SaveData.Yield = 0
		SaveData.Survivability = 0

		SaveData.Completed_Sequences = 0


		#Expansion_Level_1 = false
		#Expansion_Level_2 = false
		#Expansion_Level_3 = false
		#Expansion_Level_4 = false
		#Expansion_Level_5 = false
#
		#Heat_Conditioning = false
		#Frozen_Conditioning = false
		#Toxic_Conditioning = false
		#Radioactive_Conditioning = false
#
		#SP_Flat_Gain = float(1)
		#SP_Multiplier = float(1)
		#SP_Combo_Flat_Gain = float(1)
		#SP_Combo_Excess_Multiplier = float(1)
		#SP_Combo_Necessity = 7
#
		#GP_Flat_Gain = float(0.25)
		#GP_Multiplier = float(1)
		#GP_Combo_Flat_Gain = float(0.5)
		#GP_Combo_Excess_Multiplier = float(1)
		#GP_Combo_Necessity = 7
#
		#XP_Flat_Gain = float(0)
		#XP_Multiplier = float(1)
		#XP_Combo_Flat_Gain = float(0.25)
		#XP_Combo_Excess_Multiplier = float(1)
		#XP_Combo_Necessity = 7
#
		#Crop_Flat_Gain = float(1)
		#Crop_Multiplier = float(1)
		#Crop_Combo_Flat_Gain = float(0)
		#Crop_Combo_Excess_Multiplier = float(1)
		#Crop_Combo_Necessity = 7
#
		#Combo_Multiplier_Phase_1 = false
		#Combo_Multiplier_Phase_2 = false
#
		#SP_Combo_Necessity_Level_1 = false
		#SP_Combo_Necessity_Level_2 = false
		#SP_Combo_Necessity_Level_3 = false
		#SP_Combo_Necessity_Level_4 = false
		#SP_Combo_Necessity_Level_5 = false
#
		#GP_Combo_Necessity_Level_1 = false
		#GP_Combo_Necessity_Level_2 = false
		#GP_Combo_Necessity_Level_3 = false
		#GP_Combo_Necessity_Level_4 = false
		#GP_Combo_Necessity_Level_5 = false
#
		#XP_Combo_Necessity_Level_1 = false
		#XP_Combo_Necessity_Level_2 = false
		#XP_Combo_Necessity_Level_3 = false
		#XP_Combo_Necessity_Level_4 = false
		#XP_Combo_Necessity_Level_5 = false
#
		#SP_Combo_Necessity_Level_1_Activate = false
		#SP_Combo_Necessity_Level_2_Activate = false
		#SP_Combo_Necessity_Level_3_Activate = false
		#SP_Combo_Necessity_Level_4_Activate = false
		#SP_Combo_Necessity_Level_5_Activate = false
#
		#GP_Combo_Necessity_Level_1_Activate = false
		#GP_Combo_Necessity_Level_2_Activate = false
		#GP_Combo_Necessity_Level_3_Activate = false
		#GP_Combo_Necessity_Level_4_Activate = false
		#GP_Combo_Necessity_Level_5_Activate = false
#
		#XP_Combo_Necessity_Level_1_Activate = false
		#XP_Combo_Necessity_Level_2_Activate = false
		#XP_Combo_Necessity_Level_3_Activate = false
		#XP_Combo_Necessity_Level_4_Activate = false
		#XP_Combo_Necessity_Level_5_Activate = false
#
		#PD_Survivability = 0
		#PD_Growth = 0
		#PD_Yield = 0
		#PD_Longevity = 0
#
		#PD_Seconds_To_Sequence = float(5)
#
#
		#Apples_Researched = 0
		#Oranges_Researched = 0
		#Bananas_Researched = 0
		#Strawberries_Researched = 0
		#Blueberries_Researched = 0
		#Potatoes_Researched = 0
		#Tomatos_Researched = 0
		#Carrots_Researched = 0
		#Cucumbers_Researched = 0
		#Corn_Researched = 0
#
		#Seconds_To_Sequence = 5
#
		#SP_Flat_Gain_Min = float(1) 
		#SP_Flat_Gain_Max = float(3)
		#SP_Multiplier_Min = float(4)
		#SP_Multiplier_Max = float(2)
#
		#GP_Flat_Gain_Min = float(1)
		#GP_Flat_Gain_Max = float(3)
		#GP_Multiplier_Min = float(4)
		#GP_Multiplier_Max = float(2)
#
		#XP_Flat_Gain_Min = float(1)
		#XP_Flat_Gain_Max = float(3)
		#XP_Multiplier_Min = float(4)
		#XP_Multiplier_Max = float(2)
#
#
		#S_1_1 = false
#
		#S_2_1 = false
		#S_2_2 = false
#
		#S_3_1 = false
		#S_3_2 = false
#
		#S_4_1 = false
		#S_4_2 = false
		#S_4_3 = false
		#S_4_4 = false
		#S_4_5 = false
#
		#S_5_1 = false
		#S_5_2 = false
#
		#S_6_1 = false
		#S_6_2 = false
		#S_6_3 = false
		#S_6_4 = false
		#S_6_5 = false
		#S_6_6 = false
		#S_6_7 = false
#
		#S_7_1 = false
		#S_7_2 = false
#
		#S_8_1 = false
		#S_8_2 = false
		#S_8_3 = false
		#S_8_4 = false
		#S_8_5 = false
#
		#S_9_1 = false
		#S_9_2 = false
#
		#S_10_1 = false
		#S_10_2 = false
#
		#S_11_1 = false
#
		#S_12_1 = false
		#S_12_2 = false
#
		#S_13_1 = false
		#S_13_2 = false
#
		#S_14_1 = false
		#S_14_2 = false
		#S_14_3 = false
		#S_14_4 = false
		#S_14_5 = false
#
		#S_15_1 = false
		#S_15_2 = false
#
		#S_16_1 = false
		#S_16_2 = false
		#S_16_3 = false
		#S_16_4 = false
		#S_16_5 = false
		#S_16_6 = false
		#S_16_7 = false
#
		#S_17_1 = false
		#S_17_2 = false
#
		#S_18_1 = false
		#S_18_2 = false
		#S_18_3 = false
		#S_18_4 = false
		#S_18_5 = false
#
		#S_19_1 = false
		#S_19_2 = false
#
		#S_20_1 = false
		#S_20_2 = false
#
		#S_21_1 = false
#
		#S_22_1 = false
		#S_22_2 = false
#
		#S_23_1 = false
		#S_23_2 = false
#
		#S_24_1 = false
		#S_24_2 = false
		#S_24_3 = false
		#S_24_4 = false
		#S_24_5 = false
#
		#S_25_1 = false
		#S_25_2 = false
#
		#S_26_1 = false
		#S_26_2 = false
		#S_26_3 = false
		#S_26_4 = false
		#S_26_5 = false
		#S_26_6 = false
		#S_26_7 = false
#
		#S_27_1 = false
		#S_27_2 = false
#
		#S_28_1 = false
		#S_28_2 = false
		#S_28_3 = false
		#S_28_4 = false
		#S_28_5 = false
#
		#S_29_1 = false
		#S_29_2 = false
#
		#S_30_1 = false
		#S_30_2 = false
#
		#S_31_1 = false
#
		#S_32_1 = false
		#S_32_2 = false
#
		#S_33_1 = false
		#S_33_2 = false
#
		#S_34_1 = false
		#S_34_2 = false
		#S_34_3 = false
		#S_34_4 = false
		#S_34_5 = false
#
		#S_35_1 = false
		#S_35_2 = false
#
		#S_36_1 = false
		#S_36_2 = false
		#S_36_3 = false
		#S_36_4 = false
		#S_36_5 = false
		#S_36_6 = false
		#S_36_7 = false
#
		#S_37_1 = false
		#S_37_2 = false
#
		#S_38_1 = false
		#S_38_2 = false
		#S_38_3 = false
		#S_38_4 = false
		#S_38_5 = false
#
		#S_39_1 = false
		#S_39_2 = false
#
		#S_40_1 = false
		#S_40_2 = false
#
		#S_41_1 = false
#
		#S_42_1 = false
		#S_42_2 = false
#
		#S_43_1 = false
		#S_43_2 = false
#
		#S_44_1 = false
		#S_44_2 = false
		#S_44_3 = false
		#S_44_4 = false
		#S_44_5 = false
#
		#S_45_1 = false
		#S_45_2 = false
#
		#S_46_1 = false
		#S_46_2 = false
		#S_46_3 = false
		#S_46_4 = false
		#S_46_5 = false
		#S_46_6 = false
		#S_46_7 = false
#
		#S_47_1 = false
		#S_47_2 = false
#
		#S_48_1 = false
		#S_48_2 = false
		#S_48_3 = false
		#S_48_4 = false
		#S_48_5 = false
#
		#S_49_1 = false
		#S_49_2 = false
#
		#S_50_1 = false
		#S_50_2 = false
#
		#S_51_1 = false
#
#
		#G_1_1 = false
		#G_2_1 = false
		#G_3_1 = false
		#G_4_1 = false
		#G_5_1 = false
		#G_6_1 = false
#
		#G_6_2_1 = false
		#G_6_2_2 = false
		#G_6_3 = false
#
		#G_7_1 = false
		#G_8_1 = false
		#G_9_1 = false
		#G_10_1 = false
		#G_11_1 = false
		#G_12_1 = false
#
		#G_12_2_1 = false
		#G_12_2_2 = false
		#G_12_3_1 = false
		#G_12_3_2 = false
		#G_12_3_3 = false
		#G_12_4_1 = false
		#G_12_4_2 = false
#
		#G_13_1 = false
		#G_14_1 = false
		#G_15_1 = false
		#G_16_1 = false
		#G_17_1 = false
		#G_18_1 = false
#
		#G_18_2_1 = false
		#G_18_2_2 = false
		#G_18_3_1 = false
		#G_18_3_2 = false
		#G_18_3_3 = false
		#G_18_4 = false
#
		#G_19_1 = false
		#G_20_1 = false
		#G_21_1 = false
		#G_22_1 = false
		#G_23_1 = false
		#G_24_1 = false
#
		#G_24_2_1 = false
		#G_24_2_2 = false
		#G_24_3 = false
#
		#G_25_1 = false
		#G_26_1 = false
		#G_27_1 = false
		#G_28_1 = false
		#G_29_1 = false

	if LoadState == true:
		print("LoadState")
		$"../../../..".Scientific_Research_Points = SaveData.Scientific_Research_Points
