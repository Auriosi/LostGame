extends Control

@onready var PlayButton: Button = $Panel/Play
@onready var QuitButton: Button = $Panel/Quit

func _ready() -> void:
	PlayButton.pressed.connect(on_play)
	QuitButton.pressed.connect(on_quit)

func on_play():
	get_tree().change_scene_to_file("res://Game.tscn")

func on_quit():
	get_tree().quit()
