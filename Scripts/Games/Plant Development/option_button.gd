extends OptionButton

@export var index = 0
@export var environment = false
func _on_item_selected() -> void:
	if index == 0:
		environment = false
		add_theme_color_override("font_outline_color", Color(1.0, 1.0, 1.0, 1.0))
	if index == 1:
		environment = true
		#add_theme_color_override("font_outline_color", Color(0.619, 0.316, 0.0, 1.0))
	if index == 2:
		environment = true
		add_theme_color_override("font_outline_color", Color(0.0, 0.439, 0.636, 1.0))
	if index == 3:
		environment = true
		add_theme_color_override("font_outline_color", Color(0.18, 0.606, 0.0, 1.0))
	if index == 4:
		environment = true
		add_theme_color_override("font_outline_color", Color(0.532, 0.527, 0.0, 1.0))
