extends TextureButton

var Text_Level_Min = 1
var Text_Level_Max = 10

var Text_Level = 1

func _ready():
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("This is the research Tree, it consists of two trees (and one that’s a work-in-progress).")

func _process(_delta):
	if $"../Tutorial Tab/Node2D".visible == true:
		if Input.is_action_just_released("Close Menu") == true:
			$"../Tutorial Tab/Node2D".visible = false

func _on_left_movement_pressed() -> void:
	$"../Tutorial Tab/Node2D/Left Movement/Interact".play()
	if Text_Level > Text_Level_Min:
		Text_Level -= 1
		Text_Check(Text_Level)


func _on_right_movement_pressed() -> void:
	$"../Tutorial Tab/Node2D/Right Movement/Interact".play()
	if Text_Level < Text_Level_Max:
		Text_Level += 1
		Text_Check(Text_Level)
	


func Text_Check(Text_Level_):
	if Text_Level_ == 1:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("Welcome to the research tree, here you will be able to see stats and upgrades.")
		_Image()
	if Text_Level_ == 2:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("The scYou can leave this screen by pressing escape or by clicking the X button above.")
		_Image()
		$"../Tutorial Tab/Node2D/Level 2".visible = true
	if Text_Level_ == 3:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("There are four different tabs that you can click and select from.")
		_Image()
		$"../Tutorial Tab/Node2D/Level 2".visible = true
	if Text_Level_ == 4:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("The “Stats” tab can show you the different stats of the Genome Sequencing, Plant Development, and Crop Diagnosis minigames.")
		_Image()
		$"../Tutorial Tab/Node2D/Level 4".visible = true
	if Text_Level_ == 5:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("The “Scientific”, “Genome”, and “Specialized” tabs show you three different research trees that can be used to further refine your work.")
		_Image()
		$"../Tutorial Tab/Node2D/Level 5".visible = true
	if Text_Level_ == 6:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("As you acquire upgrades for skill points, you will see them unlocked over time.")
		_Image()
	if Text_Level_ == 7:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("Points for these research trees can be earned via the minigames mentioned previously.")
		_Image()
	if Text_Level_ == 8:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("To see what the skills do, simply hover over the skill and you’ll see the information on the right.")
		_Image()
		$"../Tutorial Tab/Node2D/Level 8".visible = true
	if Text_Level_ == 9:
		$"../Tutorial Tab/Node2D/ScrollContainer/Node Name".text = str("To begin your first upgrade, you will simply need to sequence a genome once in the genome sequence minigame.")
		_Image()
	if Text_Level_ == 10:
		Text_Level = 1
		Text_Check(Text_Level)
		$"../Tutorial Tab/Node2D".visible = false

func _Image():
	$"../Tutorial Tab/Node2D/Level 2".visible = false
	$"../Tutorial Tab/Node2D/Level 3".visible = false
	$"../Tutorial Tab/Node2D/Level 4".visible = false
	$"../Tutorial Tab/Node2D/Level 5".visible = false
	$"../Tutorial Tab/Node2D/Level 8".visible = false

func _on_pressed() -> void:
	$Click.play()
	Text_Level = 1
	Text_Check(Text_Level)
	$"../Tutorial Tab/Node2D".visible = true
	$"Upgrade Notifier".visible = false


func _on_close_button_sequencing_pressed() -> void:
	$"../Tutorial Tab/Node2D/Close Button Sequencing/Close".play()
	Text_Level = 1
	Text_Check(Text_Level)
	$"../Tutorial Tab/Node2D".visible = false


func _on_left_movement_mouse_entered() -> void:
	$"../Tutorial Tab/Node2D/Left Movement/Hover".play()


func _on_right_movement_mouse_entered() -> void:
	$"../Tutorial Tab/Node2D/Right Movement/Hover".play()


func _on_close_button_sequencing_mouse_entered() -> void:
	$"../Tutorial Tab/Node2D/Close Button Sequencing/Hover".play()
