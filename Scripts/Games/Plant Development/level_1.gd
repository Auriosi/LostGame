extends Node2D



func _on_iterate_button_pressed() -> void:
	$"Plant Sections"._SurviveChance()
	if $"Plant Sections".healthy == true:
		$"Plant Sections"._EvolveChance()
