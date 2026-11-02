extends Node2D

func _ready():
	$"Bottom Right/Completed Sequences".visible_characters = 3
	$"Bottom Left/Scientific Points".visible_characters = 6
	$"Bottom Left/Genome Points".visible_characters = 6
	$"Bottom Left/Specialized Points".visible_characters = 6
	$"Bottom Left/Crops".visible_characters = 6

func _process(_delta):
	if $"../../Sequencing Game".Completed_Sequences > 999:
		$"Bottom Right/Completed Sequences".text = str(999)
	else:
		$"Bottom Right/Completed Sequences".text = str($"../../Sequencing Game".Completed_Sequences)
	if $"../../Sequencing Game".Completed_Sequences > 999999:
		$"Bottom Left/Crops".text = str(999999)
	else:
		$"Bottom Left/Crops".text = str($"../..".Crops)
	if $"../..".Scientific_Research_Points > 999999:
		$"Bottom Left/Scientific Points".text = str(999999)
	else:
		$"Bottom Left/Scientific Points".text = str($"../..".Scientific_Research_Points)
	if $"../..".Genome_Research_Points > 999999:
		$"Bottom Right/Completed Sequences".text = str(999999)
	else:
		$"Bottom Left/Genome Points".text = str($"../..".Genome_Research_Points)
	if $"../..".Specialized_Research_Points > 999999:
		$"Bottom Right/Completed Sequences".text = str(999999)
	else:
		$"Bottom Left/Specialized Points".text = str($"../..".Specialized_Research_Points)
