extends TextureButton

var Text_Level_Min = 1
var Text_Level_Max = 5

var Text_Level = 1

func _ready():
	$"../Node2D/ScrollContainer/Node Name".text = str("Welcome to the lab, here you are to study plants through genome sequencing, plant development, and crop diagnosis.")

func _process(_delta):
	if $"../Node2D".visible == true:
		if Input.is_action_just_released("Close Menu") == true:
			$"../Node2D".visible = false
	if $"../../../..".Button_Lock == true:
		$".".visible = false
	else:
		$".".visible = true

func _on_left_movement_pressed() -> void:
	$"../Node2D/Left Movement/Interact".play()
	if Text_Level > Text_Level_Min:
		Text_Level -= 1
		Text_Check(Text_Level)


func _on_right_movement_pressed() -> void:
	$"../Node2D/Right Movement/Interact".play()
	if Text_Level < Text_Level_Max:
		Text_Level += 1
		Text_Check(Text_Level)

func Text_Check(Text_Level_):
	if Text_Level_ == 1:
		$"../Node2D/ScrollContainer/Node Name".text = str("Welcome to the lab, here you are to study plants through genome sequencing, plant development, and crop diagnosis.")
	if Text_Level_ == 2:
		$"../Node2D/ScrollContainer/Node Name".text = str("You will gain research points from these minigames which can be used to upgrade your research process or the plant itself.")
	if Text_Level_ == 3:
		$"../Node2D/ScrollContainer/Node Name".text = str("You can click on the computer, you can click on the microscope, the incubator, and the Petri Dish. To examine their corresponding games, or research tree for the computer.")
	if Text_Level_ == 4:
		$"../Node2D/ScrollContainer/Node Name".text = str("To learn more about these processes, you can press the quesiton mark to get more information.")
	if Text_Level_ == 5:
		Text_Level = 1
		Text_Check(Text_Level)
		$"../Node2D".visible = false

func _on_pressed() -> void:
	$"Upgrade Notifier".visible = false
	$Interact.play()
	Text_Level = 1
	Text_Check(Text_Level)
	$"../Node2D".visible = true


func _on_close_button_sequencing_pressed() -> void:
	
	$"../Node2D/Close Button Sequencing/Close".play()
	Text_Level = 1
	Text_Check(Text_Level)
	$"../Node2D".visible = false


func _on_mouse_entered() -> void:
	$Hover.play()

func _on_left_movement_mouse_entered() -> void:
	$"../Node2D/Left Movement/Hover".play()

func _on_right_movement_mouse_entered() -> void:
	$"../Node2D/Right Movement/Hover".play()

func _on_close_button_sequencing_mouse_entered() -> void:
	$"../Node2D/Close Button Sequencing/Hover".play()
