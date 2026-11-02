extends Node2D

@onready var Node_Name = $"../../User Interface/Research Node UI/Node Name/Node Name"
@onready var Node_Effect = $"../../User Interface/Research Node UI/Node Effect/Node Name"
@onready var Node_Cost = $"../../User Interface/Research Node UI/Node Cost/Node Name"
@onready var Node_Error = $"../../User Interface/Research Node UI/Node Warning/Node Name"

@onready var _1_1 = $"Ground Research Set 1/Base/1_1/Button"
@onready var _2_1 = $"Ground Research Set 1/Base/2_1/Button"
@onready var _3_1 = $"Ground Research Set 1/Base/3_1/Button"
@onready var _4_1 = $"Ground Research Set 1/Base/4_1/Button"
@onready var _5_1 = $"Ground Research Set 1/Base/5_1/Button"
@onready var _6_1 = $"Ground Research Set 1/Connector/6_1/Button"

@onready var _6_2_1 = $"Ground Research Set 1/Root1/6_2_1/Button"
@onready var _6_2_2 = $"Ground Research Set 1/Root1/6_2_2/Button"
@onready var _6_3_1 = $"Ground Research Set 1/Root1/6_3_1/Button"
@onready var _6_3_2 = $"Ground Research Set 1/Root1/6_3_2/Button"
@onready var _6_4_1 = $"Ground Research Set 1/Root1/6_4_1/Button"
@onready var _6_4_2 = $"Ground Research Set 1/Root1/6_4_2/Button"

@onready var _7_1 = $"Ground Research Set 2/Base/1_1/Button"
@onready var _8_1 = $"Ground Research Set 2/Base/2_1/Button"
@onready var _9_1 = $"Ground Research Set 2/Base/3_1/Button"
@onready var _10_1 = $"Ground Research Set 2/Base/4_1/Button"
@onready var _11_1 = $"Ground Research Set 2/Base/5_1/Button"
@onready var _12_1 = $"Ground Research Set 2/Connector/6_1/Button"

@onready var _12_2_1 = $"Ground Research Set 2/Root2/6_2_1/Button"
@onready var _12_2_2 = $"Ground Research Set 2/Root2/6_2_2/Button"
@onready var _12_3_1 = $"Ground Research Set 2/Root2/6_3_1/Button"
@onready var _12_3_2 = $"Ground Research Set 2/Root2/6_3_2/Button"
@onready var _12_3_3 = $"Ground Research Set 2/Root2/6_3_3/Button"
@onready var _12_4_1 = $"Ground Research Set 2/Root2/6_4_1/Button"
@onready var _12_4_2 = $"Ground Research Set 2/Root2/6_4_2/Button"

@onready var _13_1 = $"Ground Research Set 3/Base/1_1/Button"
@onready var _14_1 = $"Ground Research Set 3/Base/2_1/Button"
@onready var _15_1 = $"Ground Research Set 3/Base/3_1/Button"
@onready var _16_1 = $"Ground Research Set 3/Base/4_1/Button"
@onready var _17_1 = $"Ground Research Set 3/Base/5_1/Button"
@onready var _18_1 = $"Ground Research Set 3/Connector/6_1/Button"

@onready var _18_2_1 = $"Ground Research Set 3/Root3/6_2_1/Button"
@onready var _18_2_2 = $"Ground Research Set 3/Root3/6_2_2/Button"
@onready var _18_3_1 = $"Ground Research Set 3/Root3/6_3_1/Button"
@onready var _18_3_2 = $"Ground Research Set 3/Root3/6_3_2/Button"
@onready var _18_3_3 = $"Ground Research Set 3/Root3/6_3_3/Button"
@onready var _18_4_1 = $"Ground Research Set 3/Root3/6_4_1/Button"
@onready var _18_4_2 = $"Ground Research Set 3/Root3/6_4_2/Button"
@onready var _18_4_3 = $"Ground Research Set 3/Root3/6_4_3/Button"

@onready var _19_1 = $"Ground Research Set 4/Base/1_1/Button"
@onready var _20_1 = $"Ground Research Set 4/Base/2_1/Button"
@onready var _21_1 = $"Ground Research Set 4/Base/3_1/Button"
@onready var _22_1 = $"Ground Research Set 4/Base/4_1/Button"
@onready var _23_1 = $"Ground Research Set 4/Base/5_1/Button"
@onready var _24_1 = $"Ground Research Set 4/Connector/6_1/Button"

@onready var _24_2_1 = $"Ground Research Set 4/Root4/6_2_1/Button"
@onready var _24_2_2 = $"Ground Research Set 4/Root4/6_2_2/Button"
@onready var _24_3_1 = $"Ground Research Set 4/Root4/6_3_1/Button"
@onready var _24_3_2 = $"Ground Research Set 4/Root4/6_3_2/Button"
@onready var _24_4_1 = $"Ground Research Set 4/Root4/6_4_1/Button"
@onready var _24_4_2 = $"Ground Research Set 4/Root4/6_4_2/Button"

@onready var _25_1 = $"Ground Research Set 5/Base/1_1/Button"
@onready var _26_1 = $"Ground Research Set 5/Base/2_1/Button"
@onready var _27_1 = $"Ground Research Set 5/Base/3_1/Button"
@onready var _28_1 = $"Ground Research Set 5/Base/4_1/Button"
@onready var _29_1 = $"Ground Research Set 5/Base/5_1/Button"

var GS_Scientific_Yield_Description_1 = str("Scientific Point Yield is increased by 0.25 for Genome Sequenceing.")
var GS_Scientific_Multiplier_Description_1 = str("Scientific Point Multiplier is increased by 0.125 for Genome Sequenceing.")
var GS_Genome_Yield_Description_1 = str("Genome Point Yield is increased by 0.25 for Genome Sequenceing.")
var GS_Genome_Multiplier_Description_1 = str("Genome Point Multiplier is increased by 0.125 for Genome Sequenceing.")
var GS_Trait_Yield_Description_1 = str("Trait  Yield is increased by 1 for Genome Sequenceing.")
var GS_Trait_Multiplier_Description_1 = str("Trait Point Multiplier is increased by 0.25 per Genome Sequenceing.")
var GS_Trait_Gen_Description_1 = str("Traits aquired from Nucleotide sets increase minimum by 1 and maximum trait potency by 2.")
var PD_Scientific_Yield_Description_1 = str("Scientific Point Yield is increased by 0.25 for Plant Development.")
var PD_Scientific_Multiplier_Description_1 = str("Scientific Point Multiplier is increased by 0.125 for Plant Development.")
var PD_Genome_Yield_Description_1 = str("Genome Point Yield is increased by 0.25 for Plant Development.")
var PD_Genome_Multiplier_Description_1 = str("Genome Point Multiplier is increased by 0.125 for Plant Development.")
var PD_Specialized_Yield_Description_1 = str("Specialized Yield is increased by 0.25 for Plant Development.")
var PD_Specialized_Multiplier_Description_1 = str("Specialized Point Multiplier is increased by 0.125 for Plant Development.")
var CD_Scientific_Yield_Description_1 = str("Scientific Point Yield is increased by 0.25 for Crop Diagnosis.")
var CD_Scientific_Multiplier_Description_1 = str("Scientific Point Multiplier is increased by 0.125 for Crop Diagnosis.")
var CD_Genome_Yield_Description_1 = str("Genome Point Yield is increased by 0.25 for Crop Diagnosis.")
var CD_Genome_Multiplier_Description_1 = str("Genome Point Multiplier is increased by 0.125 for Crop Diagnosis.")
var CD_Specialized_Yield_Description_1 = str("Specialized Yield is increased by 0.25 for Crop Diagnosis.")
var CD_Specialized_Multiplier_Description_1 = str("Specialized Point Multiplier is increased by 0.125 for Crop Diagnosis.")



@onready var Unlock_Error = str("You must sequence a genome at least once before getting this upgrade.")
@onready var Point_Error = str("You do not have enough points to get this upgrade.")

var Length_1 = false

var Length_2 = false

var Length_3 = false

var Length_4 = false

func _process(_delta):
	if $"Ground Research Set 1/Base/1_1/Button".disabled == false:
		_1_1.upgradable = true
	if _6_1.disabled == true && $"../..".Genome_Research_Points >= 3:
		
		_7_1.upgradable = true
		$"Ground Research Set 2/Base/1_1".visible = true
		if Length_1 == false:
			$"../..".Genome_Tree_Position_X_Min -= 100
			Length_1 = true
	if _12_1.disabled == true && $"../..".Genome_Research_Points >= 6:
		_13_1.upgradable = true
		$"Ground Research Set 3/Base/1_1".visible = true
		if Length_2 == false:
			$"../..".Genome_Tree_Position_X_Min -= 100
			Length_2 = true
	if _18_1.disabled == true && $"../..".Genome_Research_Points >= 9:
		_19_1.upgradable = true
		$"Ground Research Set 4/Base/1_1".visible = true
		if Length_3 == false:
			$"../..".Genome_Tree_Position_X_Min -= 100
			Length_3 = true
	if _24_1.disabled == true && $"../..".Genome_Research_Points >= 12:
		_25_1.upgradable = true
		$"Ground Research Set 5/Base/1_1".visible = true
	
	_singleNodeSetup(1, _1_1, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("1.1"), GS_Scientific_Yield_Description_1)
	_singleNodeSetup(1, _2_1, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("2.1"), GS_Scientific_Multiplier_Description_1)
	_singleNodeSetup(2, _3_1, GS_Trait_Gen_C.bind(1), Point_Error, str("3.1"), GS_Trait_Gen_Description_1)
	_singleNodeSetup(2, _4_1, GS_Trait_Yield_C.bind(1), Point_Error, str("4.1"),GS_Trait_Yield_Description_1 )
	_singleNodeSetup(3, _5_1, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("5.1"), PD_Scientific_Yield_Description_1)
	_singleNodeSetup(3, _6_1, GS_Genome_Yield_C.bind(0.25), Point_Error, str("6.1"), GS_Genome_Yield_Description_1)
	
	_singleNodeSetup(4, _6_2_1, CD_Genome_Yield_C.bind(0.25), Point_Error, str("6.2.1"), CD_Genome_Yield_Description_1)
	_singleNodeSetup(4, _6_2_2, CD_Genome_Multiplier_C.bind(0.125), Point_Error, str("6.2.2"), CD_Genome_Multiplier_Description_1)
	_singleNodeSetup(4, _6_3_1, GS_Genome_Yield_C.bind(0.25), Point_Error, str("6.3"), GS_Genome_Yield_Description_1)
	_singleNodeSetup(4, _6_3_2, GS_Trait_Yield_C.bind(1), Point_Error, str("6.3"), GS_Trait_Yield_Description_1)
	_singleNodeSetup(5, _6_4_1, GS_Trait_Gen_C.bind(1), Point_Error, str("6.3"), GS_Trait_Gen_Description_1)
	_singleNodeSetup(5, _6_4_2, PD_Specialized_Yield_C.bind(0.25), Point_Error, str("6.3"), PD_Specialized_Yield_Description_1)
	
	_singleNodeSetup(4, _7_1, GS_Genome_Multiplier_C.bind(0.125), Point_Error, str("7.1"), GS_Genome_Multiplier_Description_1)
	_singleNodeSetup(4, _8_1, GS_Trait_Gen_C.bind(1), Point_Error, str("8.1"), GS_Trait_Gen_Description_1)
	_singleNodeSetup(5, _9_1, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("9.1"), GS_Scientific_Yield_Description_1)
	_singleNodeSetup(5, _10_1, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("10.1"), PD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(6, _11_1, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("11.1"), GS_Trait_Multiplier_Description_1)
	_singleNodeSetup(6, _12_1, GS_Trait_Yield_C.bind(1), Point_Error, str("12.1"), GS_Trait_Yield_Description_1)
	
	_singleNodeSetup(7, _12_2_1, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("12.2.1"), GS_Trait_Multiplier_Description_1)
	_singleNodeSetup(7, _12_2_2, PD_Genome_Yield_C.bind(0.25), Point_Error, str("12.2.1"), PD_Genome_Yield_Description_1)
	_singleNodeSetup(7, _12_3_1, GS_Genome_Multiplier_C.bind(0.125), Point_Error, str("12.2.1"), GS_Genome_Multiplier_Description_1)
	_singleNodeSetup(7, _12_3_2, PD_Specialized_Multiplier_C.bind(0.125), Point_Error, str("12.2.1"), PD_Specialized_Multiplier_Description_1)
	_singleNodeSetup(7, _12_3_3, CD_Specialized_Yield_C.bind(0.25), Point_Error, str("12.2.1"), CD_Specialized_Yield_Description_1)
	_singleNodeSetup(8, _12_4_1, GS_Trait_Yield_C.bind(1), Point_Error, str("12.2.1"), GS_Trait_Yield_Description_1)
	_singleNodeSetup(8, _12_4_2, PD_Genome_Multiplier_C.bind(0.125), Point_Error, str("12.2.1"), PD_Genome_Multiplier_Description_1)
	
	_singleNodeSetup(7, _13_1, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("13.1"), GS_Scientific_Multiplier_Description_1)
	_singleNodeSetup(7, _14_1, PD_Genome_Yield_C.bind(0.25), Point_Error, str("14.1"), PD_Genome_Yield_Description_1)
	_singleNodeSetup(8, _15_1, GS_Trait_Gen_C.bind(1), Point_Error, str("15.1"), GS_Trait_Gen_Description_1)
	_singleNodeSetup(8, _16_1, CD_Scientific_Yield_C.bind(0.25), Point_Error, str("16.1"), CD_Scientific_Yield_Description_1)
	_singleNodeSetup(9, _17_1, GS_Genome_Yield_C.bind(0.25), Point_Error, str("17.1"), GS_Genome_Yield_Description_1)
	_singleNodeSetup(9, _18_1, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("18.1"), GS_Trait_Multiplier_Description_1)
	
	_singleNodeSetup(10, _18_2_1, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("18.2.1"), GS_Scientific_Yield_Description_1)
	_singleNodeSetup(10, _18_2_2, GS_Trait_Yield_C.bind(1), Point_Error, str("18.2.2"), GS_Trait_Yield_Description_1)
	_singleNodeSetup(10, _18_3_1, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("18.3.1"), GS_Trait_Multiplier_Description_1)
	_singleNodeSetup(10, _18_3_2, GS_Trait_Gen_C.bind(2), Point_Error, str("18.3.2"), GS_Trait_Gen_Description_1)
	_singleNodeSetup(10, _18_3_3, CD_Specialized_Multiplier_C.bind(0.125) , Point_Error, str("18.3.3"), CD_Specialized_Multiplier_Description_1)
	_singleNodeSetup(11, _18_4_1, CD_Scientific_Yield_C.bind(0.25), Point_Error, str("18.4.1"), CD_Scientific_Yield_Description_1)
	_singleNodeSetup(11, _18_4_2, CD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("18.4.1"), CD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(11, _18_4_3, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("18.4.1"), GS_Scientific_Multiplier_Description_1)
	
	_singleNodeSetup(10, _19_1, PD_Genome_Multiplier_C.bind(0.125), Point_Error, str("19.1"), PD_Genome_Multiplier_Description_1)
	_singleNodeSetup(10, _20_1, CD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("20.1"), CD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(11, _21_1, GS_Trait_Gen_C.bind(2), Point_Error, str("21.1"), GS_Trait_Gen_Description_1)
	_singleNodeSetup(11, _22_1, GS_Genome_Multiplier_C.bind(0.125), Point_Error, str("22.1"), GS_Genome_Multiplier_Description_1)
	_singleNodeSetup(12, _23_1, GS_Trait_Yield_C.bind(1), Point_Error, str("23.1"), GS_Trait_Yield_Description_1)
	_singleNodeSetup(12, _24_1, GS_Scientific_Yield_C.bind(0.25), Point_Error, str("24.1"), GS_Scientific_Yield_Description_1)
	
	_singleNodeSetup(13, _24_2_1, GS_Trait_Gen_C.bind(2), Point_Error, str("24.2.1"), GS_Trait_Gen_Description_1)
	_singleNodeSetup(13, _24_2_2, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("24.2.2"), GS_Trait_Multiplier_Description_1)
	_singleNodeSetup(13, _24_3_1, PD_Specialized_Yield_C.bind(0.25), Point_Error, str("24.3.1"), PD_Specialized_Yield_Description_1)
	_singleNodeSetup(13, _24_3_2, PD_Specialized_Multiplier_C.bind(0.125), Point_Error, str("24.3.2"), PD_Specialized_Multiplier_Description_1)
	_singleNodeSetup(14, _24_4_1, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("24.4.1"), PD_Scientific_Yield_Description_1)
	_singleNodeSetup(14, _24_4_2, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("24.4.2"), PD_Scientific_Multiplier_Description_1)
	
	_singleNodeSetup(13, _25_1, PD_Scientific_Yield_C.bind(0.25), Point_Error, str("25.1"), PD_Scientific_Yield_Description_1)
	_singleNodeSetup(13, _26_1, GS_Scientific_Multiplier_C.bind(0.125), Point_Error, str("26.1"), GS_Scientific_Multiplier_Description_1)
	_singleNodeSetup(14, _27_1, PD_Scientific_Multiplier_C.bind(0.125), Point_Error, str("27.1"), PD_Scientific_Multiplier_Description_1)
	_singleNodeSetup(14, _28_1, GS_Trait_Multiplier_C.bind(0.25), Point_Error, str("28.1"), GS_Trait_Multiplier_Description_1)
	_singleNodeSetup(15, _29_1, GS_Trait_Gen_C.bind(2), Point_Error, str("29.1"), GS_Trait_Gen_Description_1)

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
		if $"../../".Genome_Research_Points >= Points && Upgrade_Node.activated == false:
			$"../../".Genome_Research_Points -= Points
			_Upgrade.call()
			Upgrade_Node.activated = true
			Upgrade_Node._Play_Click_Sound()
		elif $"../../".Genome_Research_Points < Points && Upgrade_Node.activated == false:
			Upgrade_Node.disabled = false
			Node_Error.text = Error_Text
			Node_Error.visibility = 1
			Upgrade_Node._Play_Fail_Sound()
	if Upgrade_Node.in_range == true:
		Node_Name.text = Upgrade_Name
		Node_Effect.text = Description
		if Points >= 1:
			Node_Cost.text = str("Costs ") + str(Points) + str(" Genome Research Points.") + str("

If this upgrade is already activated, then instead recieve ") + str(Points) + str(" Genome Research Points.")
		else:
			Node_Cost.text = str("Costs ") + str(Points) + str(" Genome Research Point.") + str("

If this upgrade is already activated, then instead recieve ") + str(Points) + str(" Genome Research Points.")

func GS_Trait_Gen_C(Amount):
	$"../../Sequencing Game".Nucleotide_Min_Base += Amount
	$"../../Sequencing Game".Nucleotide_Max_Base += 2 * Amount
	$"../../Sequencing Game".Nucleotide_Min_Rand += Amount
	$"../../Sequencing Game".Nucleotide_Max_Rand += 2 * Amount
	$"../../Sequencing Game/Nucleotide Strain/Nucleotide Set"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain/Nucleotide Set2"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain/Nucleotide Set3"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain/Nucleotide Set4"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain/Nucleotide Set5"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain/Nucleotide Set6"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain/Nucleotide Set7"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain/Nucleotide Set8"._Refresh()

	$"../../Sequencing Game/Nucleotide Strain2/Nucleotide Set"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain2/Nucleotide Set2"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain2/Nucleotide Set3"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain2/Nucleotide Set4"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain2/Nucleotide Set5"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain2/Nucleotide Set6"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain2/Nucleotide Set7"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain2/Nucleotide Set8"._Refresh()

	$"../../Sequencing Game/Nucleotide Strain3/Nucleotide Set"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain3/Nucleotide Set2"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain3/Nucleotide Set3"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain3/Nucleotide Set4"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain3/Nucleotide Set5"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain3/Nucleotide Set6"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain3/Nucleotide Set7"._Refresh()
	$"../../Sequencing Game/Nucleotide Strain3/Nucleotide Set8"._Refresh()

func GS_Scientific_Yield_C(Amount):
	$"../../Sequencing Game".SP_Flat_Gain += Amount

func GS_Scientific_Multiplier_C(Amount):
	$"../../Sequencing Game".SP_Multiplier += Amount

func GS_Genome_Yield_C(Amount):
	$"../../Sequencing Game".GP_Flat_Gain += Amount

func GS_Genome_Multiplier_C(Amount):
	$"../../Sequencing Game".GP_Multiplier += Amount

func GS_Trait_Yield_C(Amount):
	$"../../Sequencing Game".Trait_Flat_Gain += Amount

func GS_Trait_Multiplier_C(Amount):
	$"../../Sequencing Game".Trait_Multiplier += Amount

func PD_Scientific_Yield_C(Amount):
	$"../../Plant Development Game".SP_Flat_Gain += Amount

func PD_Scientific_Multiplier_C(Amount):
	$"../../Plant Development Game".SP_Multiplier += Amount

func PD_Genome_Yield_C(Amount):
	$"../../Plant Development Game".GP_Flat_Gain += Amount

func PD_Genome_Multiplier_C(Amount):
	$"../../Plant Development Game".GP_Multiplier += Amount

func PD_Specialized_Yield_C(Amount):
	$"../../Plant Development Game".XP_Flat_Gain += Amount

func PD_Specialized_Multiplier_C(Amount):
	$"../../Plant Development Game".XP_Multiplier += Amount

func CD_Scientific_Yield_C(Amount):
	$"../../Crop Diagnosis".SP_Flat_Gain_Min += Amount
	$"../../Crop Diagnosis".SP_Flat_Gain_Max += 1.5 * Amount

func CD_Scientific_Multiplier_C(Amount):
	$"../../Crop Diagnosis".SP_Multiplier_Min += Amount
	$"../../Crop Diagnosis".SP_Multiplier_Max += 1.5 * Amount

func CD_Genome_Yield_C(Amount):
	$"../../Crop Diagnosis".GP_Flat_Gain_Min += Amount
	$"../../Crop Diagnosis".GP_Flat_Gain_Max += 1.5 * Amount

func CD_Genome_Multiplier_C(Amount):
	$"../../Crop Diagnosis".GP_Multiplier_Min += Amount
	$"../../Crop Diagnosis".GP_Multiplier_Max += 1.5 * Amount

func CD_Specialized_Yield_C(Amount):
	$"../../Crop Diagnosis".XP_Flat_Gain_Min += Amount
	$"../../Crop Diagnosis".XP_Flat_Gain_Max += 1.5 * Amount

func CD_Specialized_Multiplier_C(Amount):
	$"../../Crop Diagnosis".XP_Multiplier_Min += Amount
	$"../../Crop Diagnosis".XP_Multiplier_Max += 1.5 * Amount
