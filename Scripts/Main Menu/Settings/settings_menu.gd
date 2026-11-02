extends Control

var base_resolution = Vector2i(1980, 1020)
var temp_revolution = Vector2i(1980, 1020)


var resolution_verification = false
var verification_timer = float(5)
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
	$"Resolution Options".selected = 2

func _process(delta):
	if resolution_verification == false && $Node2D.visible == true:
		verification_timer -= delta
		$"Node2D/Count Down".text = str(verification_timer + 1)
		if verification_timer <= 0:
			
			verification_timer = 5
			$Node2D.visible = false
			print(base_resolution)
			get_window().set_size(base_resolution)
			center_window()
			
	elif resolution_verification == true:
		base_resolution = temp_revolution
		print(base_resolution)
		verification_timer = 5
		$Node2D.visible = false
		resolution_verification = false
		
	if Input.is_action_pressed("Close Menu"):
		visible = false

func add_resolutions():
	for r in resolutions:
		$"Resolution Options".add_item(r)

func update_button_values():
	var window_size_string = str(get_window().size.x, "x", get_window().size.y)
	var resolutions_index = resolutions.keys().find(window_size_string)
	$"Resolution Options".selected = resolutions_index

func _on_resolution_options_item_selected(index: int) -> void:
	$Node2D.visible = true
	
	var key = $"Resolution Options".get_item_text(index)
	temp_revolution = resolutions[key]
	
	get_window().set_size(resolutions[key])
	center_window()

func center_window():
	var screen_center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(screen_center - window_size / 2)


func _on_yes_pressed() -> void:
	resolution_verification = true

func _on_no_pressed() -> void:
	print(temp_revolution)
	verification_timer = 0
