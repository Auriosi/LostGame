extends Button
@onready var Apple_Button = $"../Apple Button"
@onready var Banana_Button = $"../Banana Button"

func _process(_delta):
	if button_pressed == true:
		Apple_Button.disabled = true
		Banana_Button.disabled = true
	elif disabled == false:
		Apple_Button.disabled = false
		Banana_Button.disabled = false
