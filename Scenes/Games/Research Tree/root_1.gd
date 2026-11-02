extends Node2D

func _process(_delta):
	if $"../Connector/6_1/Button".disabled == true:
		$"6_1 6_2_1".visible = false
		$"6_2_1".visible = true
		$"6_2_1/Button".upgradable = true
	
	if $"6_2_1/Button".disabled == true:
		$"6_1 6_2_1".visible = false
	
	if $"../Connector/6_1/Button".disabled == true:
		$"6_1 6_2_2".visible = false
		$"6_2_2".visible = true
		$"6_2_2/Button".upgradable = true
	
	if $"6_2_2/Button".disabled == true:
		$"6_1 6_2_2".visible = false
	
	if $"6_2_1/Button".disabled == true:
		$"6_2_1 6_3_1".visible = false
		$"6_3_1".visible = true
		$"6_3_1/Button".upgradable = true
	
	if $"6_3_1/Button".disabled == true:
		$"6_2_1 6_3_1".visible = false
	
	if $"6_2_2/Button".disabled == true:
		$"6_2_2 6_3_2".visible = false
		$"6_3_2".visible = true
		$"6_3_2/Button".upgradable = true
	
	if $"6_3_2/Button".disabled == true:
		$"6_2_2 6_3_2".visible = false
	
	if $"6_3_1/Button".disabled == true:
		$"6_3_1 6_4_1".visible = false
		$"6_4_1".visible = true
		$"6_4_1/Button".upgradable = true
	
	if $"6_4_1/Button".disabled == true:
		$"6_3_1 6_4_1".visible = false
	
	if $"6_3_2/Button".disabled == true:
		$"6_3_2 6_4_2".visible = false
		$"6_4_2".visible = true
		$"6_4_2/Button".upgradable = true
	
	if $"6_4_2/Button".disabled == true:
		$"6_3_2 6_4_2".visible = false
