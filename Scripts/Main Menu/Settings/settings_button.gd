extends Button

@onready var Game_Menu = $"../Game Menu"
@onready var Settings_Menu = $"../Settings Menu"

func _on_pressed():
	if Settings_Menu.visible == true or $"..".UI_animation_timer < 100:
		disabled = true
	else:
		disabled = false
	if disabled == false:
		Game_Menu.visible = false
		Settings_Menu.visible = true
