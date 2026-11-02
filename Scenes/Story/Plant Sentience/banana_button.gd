extends Button
@onready var Apple_Button = $"../Apple Button"
@onready var Orange_Button = $"../Orange Button"

func _process(_delta):
	if button_pressed == true:
		Apple_Button.disabled = true
		Orange_Button.disabled = true
	elif disabled == false:
		Apple_Button.disabled = false
		Orange_Button.disabled = false
