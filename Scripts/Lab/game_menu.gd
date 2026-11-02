extends Control

var New_Game = false

@onready var Confirm_New_Game = $Confirmation

func _on_new_game_button_pressed() -> void:
	Confirm_New_Game.visible = true

func _process(_delta):
	if Input.is_action_pressed("Close Menu"):
		visible = false
		Confirm_New_Game.visible = false

func _on_no_button_pressed() -> void:
	Confirm_New_Game.visible = false

func _on_yes_button_pressed() -> void:
	New_Game = true
