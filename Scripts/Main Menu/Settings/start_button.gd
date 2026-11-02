extends Button

@onready var Game_Menu = $"../Game Menu"
@onready var Settings_Menu = $"../Settings Menu"

var new_game = false

func _on_pressed() -> void:
	if Settings_Menu.visible == true or $"..".UI_animation_timer < 100:
		disabled = true
	else:
		disabled = false
	if disabled == false:
		Game_Menu.visible = true
		Settings_Menu.visible = false
