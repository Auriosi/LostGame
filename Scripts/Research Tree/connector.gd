extends Node2D

func _process(_delta):
	if $"../Base/5_1/Button".disabled == true:
		$"5_1 6_1".visible = false
		$"6_1".visible = true
		$"6_1/Button".upgradable = true
	
	if $"../Connector/6_1/Button".disabled == true:
		$"6_1 7_1".visible = false
