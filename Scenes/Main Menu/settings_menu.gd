extends Control

var pressed = true

var resolutions = {
	"3840x2160":Vector2i(3840, 2160),
	"2560x1440":Vector2i(2560, 1440),
	"1920x1080":Vector2i(1980, 1020),
	"1366x768":Vector2i(1366, 768),
	"1280x720":Vector2i(1280, 720),
	"1440x900":Vector2i(1440, 900),
	"1600x900":Vector2i(1600, 900),
	"1024x600":Vector2i(1024, 600),
	"800x600":Vector2i(800, 600)
}

func _ready():
	add_resolutions()

func _process(_delta):
	pass#if Input.is_action_just_pressed("Close Menu"):
		#if visible == true:
		#	visible = false

func add_resolutions():
	for r in resolutions:
		$"Resolution Options".add_item(r)

func update_button_values():
	var window_size_string = str(get_window().size.x, "x", get_window().size.y)
	var resolutions_index = resolutions.keys().find(window_size_string)
	$"Resolution Options".selected = resolutions_index

func _on_resolution_options_item_selected(index: int) -> void:
	var key = $"Resolution Options".get_item_text(index)
	get_window().set_size(resolutions[key])
	center_window()

func center_window():
	@warning_ignore("integer_division")
	var screen_center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / Vector2i(2,2)
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(screen_center - window_size / float(2))
