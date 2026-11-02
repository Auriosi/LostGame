extends Control

var SaveState = false
var LoadState = false

func _on_continue_button_button_down() -> void:
	visible = false

func _on_settings_button_button_down() -> void:
	$"../Settings Menu".visible = true
	visible = false

func _on_menu_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main Menu/main_menu_scene.tscn")

func _on_save_button_temp_button_down() -> void:
	SaveState = true
	LoadState = false
	$"../Load Menu".visible = true
	$".".visible = false

func _on_load_button_button_down() -> void:
	LoadState = true
	SaveState = false
	$"../Load Menu".visible = true
	$".".visible = false
