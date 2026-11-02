extends Resource
class_name SaveDataResource

@export var Scientific_Research_Points = float(0)
@export var Genome_Research_Points = float(0)
@export var Specialized_Research_Points = float(0)

@export var Apples = 0
@export var Oranges = 0
@export var Bananas = 0
@export var Strawberries = 0
@export var Blueberries = 0
@export var Potatos = 0
@export var Tomatos = 0
@export var Carrots = 0
@export var Cucumbers = 0
@export var Corn = 0

@export var Scientific_Tree_Position_X_Max = 330
@export var Scientific_Tree_Position_X_Min = 330
@export var Scientific_Tree_Position_Y_Max = 14
@export var Scientific_Tree_Position_Y_Min = 14

@export var Genome_Tree_Position_X_Max = -50
@export var Genome_Tree_Position_X_Min = -50
@export var Genome_Tree_Position_Y_Max = 0
@export var Genome_Tree_Position_Y_Min = 0

@export var Specalized_Tree_Position_X_Max = 330
@export var Specalized_Tree_Position_X_Min = 330
@export var Specalized_Tree_Position_Y_Max = 14
@export var Specalized_Tree_Position_Y_Min = 14


@export var Specific_Potency = false
@export var Previous_Positive = false
@export var Previous_Potency = false
@export var Real_Time_Trait = false
@export var Real_Time_Positive = false
@export var Real_Time_Potency = false

@export var Choose_Trait_1 = false
@export var Choose_Trait_2 = false
@export var Choose_Trait_3 = false
@export var Second_Nucleotide_Strain = false
@export var Third_Nucleotide_Strain = false

@export var Nucleotide_Min_Base = 1
@export var Nucleotide_Max_Base = 3
@export var Nucleotide_Min_Rand = 2
@export var Nucleotide_Max_Rand = 2

@export var Major_Potency_Min = Nucleotide_Max_Base

@export var GS_Seconds_To_Sequence = float(6)

@export var First_Sequence = true

@export var SP_Expansion_Level = 0
@export var GP_Expansion_Level = 0
@export var XP_Expansion_Level = 0

@export var Longevity = 0
@export var Growth = 0
@export var Yield = 0
@export var Survivability = 0

@export var Completed_Sequences = 0


@export var Expansion_Level_1 = false
@export var Expansion_Level_2 = false
@export var Expansion_Level_3 = false
@export var Expansion_Level_4 = false
@export var Expansion_Level_5 = false

@export var Heat_Conditioning = false
@export var Frozen_Conditioning = false
@export var Toxic_Conditioning = false
@export var Radioactive_Conditioning = false

@export var SP_Flat_Gain = float(1)
@export var SP_Multiplier = float(1)
@export var SP_Combo_Flat_Gain = float(1)
@export var SP_Combo_Excess_Multiplier = float(1)
@export var SP_Combo_Necessity = 7

@export var GP_Flat_Gain = float(0.25)
@export var GP_Multiplier = float(1)
@export var GP_Combo_Flat_Gain = float(0.5)
@export var GP_Combo_Excess_Multiplier = float(1)
@export var GP_Combo_Necessity = 7

@export var XP_Flat_Gain = float(0)
@export var XP_Multiplier = float(1)
@export var XP_Combo_Flat_Gain = float(0.25)
@export var XP_Combo_Excess_Multiplier = float(1)
@export var XP_Combo_Necessity = 7

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

@export var SP_Combo_Necessity_Level_1_Activate = false
@export var SP_Combo_Necessity_Level_2_Activate = false
@export var SP_Combo_Necessity_Level_3_Activate = false
@export var SP_Combo_Necessity_Level_4_Activate = false
@export var SP_Combo_Necessity_Level_5_Activate = false

@export var GP_Combo_Necessity_Level_1_Activate = false
@export var GP_Combo_Necessity_Level_2_Activate = false
@export var GP_Combo_Necessity_Level_3_Activate = false
@export var GP_Combo_Necessity_Level_4_Activate = false
@export var GP_Combo_Necessity_Level_5_Activate = false

@export var XP_Combo_Necessity_Level_1_Activate = false
@export var XP_Combo_Necessity_Level_2_Activate = false
@export var XP_Combo_Necessity_Level_3_Activate = false
@export var XP_Combo_Necessity_Level_4_Activate = false
@export var XP_Combo_Necessity_Level_5_Activate = false

@export var PD_Survivability = 0
@export var PD_Growth = 0
@export var PD_Yield = 0
@export var PD_Longevity = 0

@export var PD_Seconds_To_Sequence = float(5)


@export var Apples_Researched = 0
@export var Oranges_Researched = 0
@export var Bananas_Researched = 0
@export var Strawberries_Researched = 0
@export var Blueberries_Researched = 0
@export var Potatoes_Researched = 0
@export var Tomatos_Researched = 0
@export var Carrots_Researched = 0
@export var Cucumbers_Researched = 0
@export var Corn_Researched = 0

@export var Seconds_To_Sequence = 5

@export var SP_Flat_Gain_Min = float(1) 
@export var SP_Flat_Gain_Max = float(3)
@export var SP_Multiplier_Min = float(4)
@export var SP_Multiplier_Max = float(2)

@export var GP_Flat_Gain_Min = float(1)
@export var GP_Flat_Gain_Max = float(3)
@export var GP_Multiplier_Min = float(4)
@export var GP_Multiplier_Max = float(2)

@export var XP_Flat_Gain_Min = float(1)
@export var XP_Flat_Gain_Max = float(3)
@export var XP_Multiplier_Min = float(4)
@export var XP_Multiplier_Max = float(2)


@export var S_1_1 = false

@export var S_2_1 = false
@export var S_2_2 = false

@export var S_3_1 = false
@export var S_3_2 = false

@export var S_4_1 = false
@export var S_4_2 = false
@export var S_4_3 = false
@export var S_4_4 = false
@export var S_4_5 = false

@export var S_5_1 = false
@export var S_5_2 = false

@export var S_6_1 = false
@export var S_6_2 = false
@export var S_6_3 = false
@export var S_6_4 = false
@export var S_6_5 = false
@export var S_6_6 = false
@export var S_6_7 = false

@export var S_7_1 = false
@export var S_7_2 = false

@export var S_8_1 = false
@export var S_8_2 = false
@export var S_8_3 = false
@export var S_8_4 = false
@export var S_8_5 = false

@export var S_9_1 = false
@export var S_9_2 = false

@export var S_10_1 = false
@export var S_10_2 = false

@export var S_11_1 = false

@export var S_12_1 = false
@export var S_12_2 = false

@export var S_13_1 = false
@export var S_13_2 = false

@export var S_14_1 = false
@export var S_14_2 = false
@export var S_14_3 = false
@export var S_14_4 = false
@export var S_14_5 = false

@export var S_15_1 = false
@export var S_15_2 = false

@export var S_16_1 = false
@export var S_16_2 = false
@export var S_16_3 = false
@export var S_16_4 = false
@export var S_16_5 = false
@export var S_16_6 = false
@export var S_16_7 = false

@export var S_17_1 = false
@export var S_17_2 = false

@export var S_18_1 = false
@export var S_18_2 = false
@export var S_18_3 = false
@export var S_18_4 = false
@export var S_18_5 = false

@export var S_19_1 = false
@export var S_19_2 = false

@export var S_20_1 = false
@export var S_20_2 = false

@export var S_21_1 = false

@export var S_22_1 = false
@export var S_22_2 = false

@export var S_23_1 = false
@export var S_23_2 = false

@export var S_24_1 = false
@export var S_24_2 = false
@export var S_24_3 = false
@export var S_24_4 = false
@export var S_24_5 = false

@export var S_25_1 = false
@export var S_25_2 = false

@export var S_26_1 = false
@export var S_26_2 = false
@export var S_26_3 = false
@export var S_26_4 = false
@export var S_26_5 = false
@export var S_26_6 = false
@export var S_26_7 = false

@export var S_27_1 = false
@export var S_27_2 = false

@export var S_28_1 = false
@export var S_28_2 = false
@export var S_28_3 = false
@export var S_28_4 = false
@export var S_28_5 = false

@export var S_29_1 = false
@export var S_29_2 = false

@export var S_30_1 = false
@export var S_30_2 = false

@export var S_31_1 = false

@export var S_32_1 = false
@export var S_32_2 = false

@export var S_33_1 = false
@export var S_33_2 = false

@export var S_34_1 = false
@export var S_34_2 = false
@export var S_34_3 = false
@export var S_34_4 = false
@export var S_34_5 = false

@export var S_35_1 = false
@export var S_35_2 = false

@export var S_36_1 = false
@export var S_36_2 = false
@export var S_36_3 = false
@export var S_36_4 = false
@export var S_36_5 = false
@export var S_36_6 = false
@export var S_36_7 = false

@export var S_37_1 = false
@export var S_37_2 = false

@export var S_38_1 = false
@export var S_38_2 = false
@export var S_38_3 = false
@export var S_38_4 = false
@export var S_38_5 = false

@export var S_39_1 = false
@export var S_39_2 = false

@export var S_40_1 = false
@export var S_40_2 = false

@export var S_41_1 = false

@export var S_42_1 = false
@export var S_42_2 = false

@export var S_43_1 = false
@export var S_43_2 = false

@export var S_44_1 = false
@export var S_44_2 = false
@export var S_44_3 = false
@export var S_44_4 = false
@export var S_44_5 = false

@export var S_45_1 = false
@export var S_45_2 = false

@export var S_46_1 = false
@export var S_46_2 = false
@export var S_46_3 = false
@export var S_46_4 = false
@export var S_46_5 = false
@export var S_46_6 = false
@export var S_46_7 = false

@export var S_47_1 = false
@export var S_47_2 = false

@export var S_48_1 = false
@export var S_48_2 = false
@export var S_48_3 = false
@export var S_48_4 = false
@export var S_48_5 = false

@export var S_49_1 = false
@export var S_49_2 = false

@export var S_50_1 = false
@export var S_50_2 = false

@export var S_51_1 = false


@export var G_1_1 = false
@export var G_2_1 = false
@export var G_3_1 = false
@export var G_4_1 = false
@export var G_5_1 = false
@export var G_6_1 = false

@export var G_6_2_1 = false
@export var G_6_2_2 = false
@export var G_6_3 = false

@export var G_7_1 = false
@export var G_8_1 = false
@export var G_9_1 = false
@export var G_10_1 = false
@export var G_11_1 = false
@export var G_12_1 = false

@export var G_12_2_1 = false
@export var G_12_2_2 = false
@export var G_12_3_1 = false
@export var G_12_3_2 = false
@export var G_12_3_3 = false
@export var G_12_4_1 = false
@export var G_12_4_2 = false

@export var G_13_1 = false
@export var G_14_1 = false
@export var G_15_1 = false
@export var G_16_1 = false
@export var G_17_1 = false
@export var G_18_1 = false

@export var G_18_2_1 = false
@export var G_18_2_2 = false
@export var G_18_3_1 = false
@export var G_18_3_2 = false
@export var G_18_3_3 = false
@export var G_18_4 = false

@export var G_19_1 = false
@export var G_20_1 = false
@export var G_21_1 = false
@export var G_22_1 = false
@export var G_23_1 = false
@export var G_24_1 = false

@export var G_24_2_1 = false
@export var G_24_2_2 = false
@export var G_24_3 = false

@export var G_25_1 = false
@export var G_26_1 = false
@export var G_27_1 = false
@export var G_28_1 = false
@export var G_29_1 = false
