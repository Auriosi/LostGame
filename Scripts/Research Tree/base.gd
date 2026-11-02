extends Node2D

func _process(_delta):
	if $"1_1/Button".disabled == true:
		$"1_1 2_1".visible = false
		$"2_1".visible = true
		$"2_1/Button".upgradable = true
	if $"2_1/Button".disabled == true:
		$"2_1 3_1".visible = false
		$"3_1".visible = true
		$"3_1/Button".upgradable = true
	if $"3_1/Button".disabled == true:
		$"3_1 4_1".visible = false
		$"4_1".visible = true
		$"4_1/Button".upgradable = true
	if $"4_1/Button".disabled == true:
		$"4_1 5_1".visible = false
		$"5_1".visible = true
		$"5_1/Button".upgradable = true
