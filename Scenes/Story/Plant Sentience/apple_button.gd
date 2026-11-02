extends Button
@onready var Orange_Button = $"../Orange Button"
@onready var Banana_Button = $"../Banana Button"

func _process(_delta):
	if button_pressed == true:
		Orange_Button.disabled = true
		Banana_Button.disabled = true
	elif disabled == false:
		Orange_Button.disabled = false
		Banana_Button.disabled = false
