extends Node2D

@onready var Main = $".."

func _process(_delta):
	position = get_global_mouse_position()
	$TextureProgressBar.value = Main.skip_timer
