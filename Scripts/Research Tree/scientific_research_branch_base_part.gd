extends Node2D

func _process(_delta):
	if $"1_1/Button".disabled == true:
		$"1_1 2_1".visible = false
		$"1_1 2_2".visible = false
		$"2_1".visible = true
		$"2_2".visible = true
		$"2_1/Button".upgradable = true
		$"2_2/Button".upgradable = true
	if $"2_1/Button".disabled == true:
		$"2_1 3_1".visible = false
		$"3_1".visible = true
		$"3_1/Button".upgradable = true
	if $"2_2/Button".disabled == true:
		$"2_2 3_2".visible = false
		$"3_2".visible = true
		$"3_2/Button".upgradable = true
	if $"3_1/Button".disabled == true:
		$"3_1 4_1".visible = false
		$"4_1".visible = true
		$"4_1/Button".upgradable = true
	if $"3_2/Button".disabled == true:
		$"3_2 4_5".visible = false
		$"4_5".visible = true
		$"4_5/Button".upgradable = true
	if $"4_1/Button".disabled == true:
		$"4_1 5_1".visible = false
		$"4_1 4_2".visible = false
		$"5_1".visible = true
		$"4_2".visible = true
		$"5_1/Button".upgradable = true
		$"4_2/Button".upgradable = true
	if $"4_2/Button".disabled == true:
		$"4_1 4_2".visible = false
		$"4_2 4_3".visible = false
		$"4_1".visible = true
		$"4_3".visible = true
		$"4_1/Button".upgradable = true
		$"4_3/Button".upgradable = true
	if $"4_3/Button".disabled == true:
		$"4_2 4_3".visible = false
		$"4_3 4_4".visible = false
		$"4_2".visible = true
		$"4_4".visible = true
		$"4_2/Button".upgradable = true
		$"4_4/Button".upgradable = true
	if $"4_4/Button".disabled == true:
		$"4_3 4_4".visible = false
		$"4_4 4_5".visible = false
		$"4_3".visible = true
		$"4_5".visible = true
		$"4_3/Button".upgradable = true
		$"4_5/Button".upgradable = true
	if $"4_5/Button".disabled == true:
		$"4_5 5_2".visible = false
		$"4_4 4_5".visible = false
		$"4_4".visible = true
		$"5_2".visible = true
		$"4_4/Button".upgradable = true
		$"5_2/Button".upgradable = true
	if $"5_1/Button".disabled == true:
		$"5_1 6_1".visible = false
		$"6_1".visible = true
		$"6_1/Button".upgradable = true
	if $"5_2/Button".disabled == true:
		$"5_2 6_7".visible = false
		$"6_7".visible = true
		$"6_7/Button".upgradable = true
	if $"6_1/Button".disabled == true:
		$"6_1 7_1".visible = false
		$"6_1 6_2".visible = false
		$"6_2".visible = true
		$"7_1".visible = true
		$"6_2/Button".upgradable = true
		$"7_1/Button".upgradable = true
	if $"6_2/Button".disabled == true:
		$"6_1 6_2".visible = false
		$"6_2 6_3".visible = false
		$"6_1".visible = true
		$"6_3".visible = true
		$"6_1/Button".upgradable = true
		$"6_3/Button".upgradable = true
	if $"6_3/Button".disabled == true:
		$"6_2 6_3".visible = false
		$"6_3 6_4".visible = false
		$"6_2".visible = true
		$"6_4".visible = true
		$"6_2/Button".upgradable = true
		$"6_4/Button".upgradable = true
	if $"6_4/Button".disabled == true:
		$"6_3 6_4".visible = false
		$"6_4 6_5".visible = false
		$"6_3".visible = true
		$"6_5".visible = true
		$"6_3/Button".upgradable = true
		$"6_5/Button".upgradable = true
	if $"6_5/Button".disabled == true:
		$"6_4 6_5".visible = false
		$"6_5 6_6".visible = false
		$"6_4".visible = true
		$"6_6".visible = true
		$"6_4/Button".upgradable = true
		$"6_6/Button".upgradable = true
	if $"6_6/Button".disabled == true:
		$"6_5 6_6".visible = false
		$"6_6 6_7".visible = false
		$"6_5".visible = true
		$"6_7".visible = true
		$"6_5/Button".upgradable = true
		$"6_7/Button".upgradable = true
	if $"6_7/Button".disabled == true:
		$"6_7 7_2".visible = false
		$"6_6 6_7".visible = false
		$"6_6".visible = true
		$"7_2".visible = true
		$"6_6/Button".upgradable = true
		$"7_2/Button".upgradable = true
	if $"7_1/Button".disabled == true:
		$"7_1 8_1".visible = false
		$"8_1".visible = true
		$"8_1/Button".upgradable = true
	if $"7_2/Button".disabled == true:
		$"7_2 8_5".visible = false
		$"8_5".visible = true
		$"8_5/Button".upgradable = true
	if $"8_1/Button".disabled == true:
		$"8_1 9_1".visible = false
		$"8_1 8_2".visible = false
		$"9_1".visible = true
		$"8_2".visible = true
		$"9_1/Button".upgradable = true
		$"8_2/Button".upgradable = true
	if $"8_2/Button".disabled == true:
		$"8_1 8_2".visible = false
		$"8_2 8_3".visible = false
		$"8_1".visible = true
		$"8_3".visible = true
		$"8_1/Button".upgradable = true
		$"8_3/Button".upgradable = true
	if $"8_3/Button".disabled == true:
		$"8_2 8_3".visible = false
		$"8_3 8_4".visible = false
		$"8_2".visible = true
		$"8_4".visible = true
		$"8_2/Button".upgradable = true
		$"8_4/Button".upgradable = true
	if $"8_4/Button".disabled == true:
		$"8_3 8_4".visible = false
		$"8_4 8_5".visible = false
		$"8_3".visible = true
		$"8_5".visible = true
		$"8_3/Button".upgradable = true
		$"8_5/Button".upgradable = true
	if $"8_5/Button".disabled == true:
		$"8_4 8_5".visible = false
		$"8_4 9_2".visible = false
		$"8_4".visible = true
		$"9_2".visible = true
		$"8_4/Button".upgradable = true
		$"9_2/Button".upgradable = true
	if $"9_1/Button".disabled == true:
		$"9_1 10_1".visible = false
		$"10_1".visible = true
		$"10_1/Button".upgradable = true
	if $"9_2/Button".disabled == true:
		$"9_2 10_2".visible = false
		$"10_2".visible = true
		$"10_2/Button".upgradable = true
	if $"10_1/Button".disabled == true:
		$"10_1 11_1".visible = false
	if $"10_2/Button".disabled == true:
		$"10_1 11_2".visible = false
