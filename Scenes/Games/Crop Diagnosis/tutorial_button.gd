extends TextureButton

var Tier_1_Text_Level_Min = 1
var Tier_1_Text_Level_Max = 8
var Tier_2_Text_Level_Min = 1
var Tier_2_Text_Level_Max = 4
var Tier_3_Text_Level_Min = 1
var Tier_3_Text_Level_Max = 8

var Tier_Level = 1

var Tier_1_Text_Level = 1
var Tier_2_Text_Level = 1
var Tier_3_Text_Level = 1

var Tier_2_Unlocked = true
var Tier_3_Unlocked = true

var Enviornment_Notification = true

var Back_Arrow = false

func _ready():
	$"../Node2D/ScrollContainer/Node Name".text = str("Welcome to the Corp Diagnosis Minigame: Here you will diagnose the fruits and vegetables you’ve obtained from the Plant Development videogame.")

func _process(_delta):
	if $"../Node2D/Environment".disabled == false:
		if Enviornment_Notification == true:
			$"../Node2D/Environment/Upgrade Notifier".visible = true
			Enviornment_Notification = false
	
	if $"../Node2D/Basic/Upgrade Notifier".visible == false and $"../Node2D/Plants/Upgrade Notifier".visible == false and $"../Node2D/Environment/Upgrade Notifier".visible == false:
		$"Upgrade Notifier".visible = false
	else:
		$"Upgrade Notifier".visible = true
	if Tier_Level == 1:
		$"../Node2D/Basic/Upgrade Notifier".visible = false
		$"../Node2D/Basic".button_pressed = true
	else:
		$"../Node2D/Basic".button_pressed = false
	if Tier_Level == 2:
		$"../Node2D/Plants/Upgrade Notifier".visible = false
		$"../Node2D/Plants".button_pressed = true
	else:
		$"../Node2D/Plants".button_pressed = false
	if Tier_Level == 3:
		$"../Node2D/Environment/Upgrade Notifier".visible = false
		$"../Node2D/Environment".button_pressed = true
	else:
		$"../Node2D/Environment".button_pressed = false

	if Tier_2_Unlocked == true:
		$"../Node2D/Plants".disabled = false
	if Tier_3_Unlocked == true:
		$"../Node2D/Environment".disabled = false
	
	if $"../Node2D".visible == true:
		if Input.is_action_just_released("Close Menu") == true:
			$"../Node2D".visible = false

func _on_left_movement_pressed() -> void:
	$"../Node2D/Left Movement/Interact".play()
	if Tier_Level == 1:
		if Tier_1_Text_Level > Tier_1_Text_Level_Min:
			Tier_1_Text_Level -= 1
			Text_Check()
		elif Tier_1_Text_Level == Tier_1_Text_Level_Min:
			Back_Arrow = true
			Tier_Level = 1
			Tier_1_Text_Level = 8
			Text_Check()
			# Text_Check(Tier_1_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 2:
		if Tier_2_Text_Level > Tier_2_Text_Level_Min:
			Tier_2_Text_Level -= 1
			Text_Check()
		elif Tier_2_Text_Level == Tier_2_Text_Level_Min:
			Back_Arrow = true
			Tier_Level = 1
			Tier_1_Text_Level = 8
			Text_Check()
			# Text_Check(Tier_2_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 3:
		if Tier_3_Text_Level > Tier_3_Text_Level_Min:
			Tier_3_Text_Level -= 1
			Text_Check()
		elif Tier_3_Text_Level == Tier_3_Text_Level_Min:
			Back_Arrow = true
			Tier_Level = 2
			Tier_2_Text_Level = 4
			Text_Check()
			# Text_Check(Tier_3_Text_Level) # I need to rework this into four different functions
			# Text_Check(Tier_4_Text_Level) # I need to rework this into four different functions


func _on_right_movement_pressed() -> void:
	$"../Node2D/Right Movement/Interact".play()
	if Tier_Level == 1:
		if Tier_1_Text_Level < Tier_1_Text_Level_Max:
			Tier_1_Text_Level += 1
			Text_Check()
		elif Tier_1_Text_Level == Tier_1_Text_Level_Max:
			Tier_Level = 2
			Text_Check()
			# Text_Check(Tier_1_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 2:
		if Tier_2_Text_Level < Tier_2_Text_Level_Max:
			Tier_2_Text_Level += 1
			Text_Check()
		elif Tier_2_Text_Level == Tier_2_Text_Level_Max:
			Tier_Level = 3
			Text_Check()
			# Text_Check(Tier_2_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 3:
		if Tier_3_Text_Level < Tier_3_Text_Level_Max:
			Tier_3_Text_Level += 1
			Text_Check()

func Text_Check():
	if Tier_Level == 1:
		if Tier_1_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("Welcome to the Corp Diagnosis Minigame: Here you will diagnose the fruits and vegetables you’ve obtained from the Plant Development videogame.")
			_Image()
		if Tier_1_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("This game is separated into three steps, examination, research, and development.")
			_Image()
		if Tier_1_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("But before we begin, you should know that on the left you will see the total number of individual fruits and vegetables you have among the different crops.")
			_Image()
			$"../Tier 1 Level 3".visible = true
		if Tier_1_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("To begin the first step, press one of the buttons to the left of the text, it will allow you to select the crop.")
			_Image()
			$"../Tier 1 Level 4".visible = true
		if Tier_1_Text_Level == 5:
			$"../Node2D/ScrollContainer/Node Name".text = str("You will see the crop on the petri dish to the top right.")
			_Image()
			$"../Tier 1 Level 5".visible = true
		if Tier_1_Text_Level == 6:
			$"../Node2D/ScrollContainer/Node Name".text = str("You can click the button again to deselect the crop put in the dish at any time until examination.")
			_Image()
		if Tier_1_Text_Level == 7:
			$"../Node2D/ScrollContainer/Node Name".text = str("Once a crop is selected, press the examine button.")
			_Image()
			$"../Tier 1 Level 7".visible = true
		if Tier_1_Text_Level == 8:
			$"../Node2D/ScrollContainer/Node Name".text = str("As it’s examining, you will be able to see the total number of points it will give on the bottom right, this will be the end of examination.")
			_Image()
			$"../Tier 1 Level 8".visible = true
		if Tier_1_Text_Level == 9:
			if Tier_2_Unlocked == true && Back_Arrow == false:
				Tier_Level = 2
			elif Back_Arrow == true:
				Back_Arrow = false
			elif Tier_2_Unlocked == false:
				$"../Node2D".visible = false
	if Tier_Level == 2:
		if Tier_2_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("The next step is research, you will press the research button, which will give you a number of buttons to choose from.")
			_Image()
			$"../Tier 2 Level 1".visible = true
		if Tier_2_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("Pressing the Scientific, Genome, or Specialized Buttons will yield you with 1.3x times the amount of points. While pressing the Balanced button will net all three with 1.1x times the amount of points.")
			_Image()
			$"../Tier 2 Level 2".visible = true
		if Tier_2_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("Once one of them is selected, press Conclude Research to continue.")
			_Image()
			$"../Tier 2 Level 3".visible = true
		if Tier_2_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("After research is concluded you won’t quite be done, You’ll have one final step, development.")
			_Image()
		if Tier_2_Text_Level == 5:
			if Tier_3_Unlocked == true && Back_Arrow == false:
				Tier_Level = 3
			elif Back_Arrow == true:
				Back_Arrow = false
			elif Tier_3_Unlocked == false:
				$"../Node2D".visible = false
	if Tier_Level == 3:
		if Tier_3_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("Press the library button, and you will see a new tab open.")
			_Image()
			$"../Tier 3 Level 1".visible = true
		if Tier_3_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("On the right, you will see the number of fruits you have researched.")
			_Image()
			$"../../Library Tab".visible = true
			$"../Tier 3 Level 2".visible = true
		if Tier_3_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("In the middle, you will see the amount necessary to upgrade.")
			_Image()
			$"../../Library Tab".visible = true
			$"../Tier 3 Level 3".visible = true
		if Tier_3_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("And on the left, you will see upgrade buttons.")
			_Image()
			$"../../Library Tab".visible = true
			$"../Tier 3 Level 4".visible = true
		if Tier_3_Text_Level == 5:
			$"../Node2D/ScrollContainer/Node Name".text = str("After pressing the upgrade button, you will synthesize the data, and gain research points, as well as the cost to upgrade will increase.")
			_Image()
			$"../../Library Tab".visible = true
			$"../Tier 3 Level 5".visible = true
		if Tier_3_Text_Level == 6:
			$"../Node2D/ScrollContainer/Node Name".text = str("The final thing to note is that you will gain Research points based on the cost of the upgrade, though each research point type will be at a different factor.")
			_Image()
		if Tier_3_Text_Level == 7:
			$"../Node2D/ScrollContainer/Node Name".text = str("If the cost was 10, you will gain 10 research points (at a factor of 100%), 5 Genome points (at a factor of 50%), and 2.5 Specialized points (at a factor of 25%.)")
			_Image()
		if Tier_3_Text_Level == 8:
			Tier_Level = 1
			Tier_3_Text_Level = 1
			$"../Node2D".visible = false

func _Image():
	$"../../Library Tab".visible = false
	$"../Tier 1 Level 3".visible = false
	$"../Tier 1 Level 4".visible = false
	$"../Tier 1 Level 5".visible = false
	$"../Tier 1 Level 7".visible = false
	$"../Tier 1 Level 8".visible = false
	$"../Tier 2 Level 1".visible = false
	$"../Tier 2 Level 2".visible = false
	$"../Tier 2 Level 3".visible = false
	$"../Tier 3 Level 1".visible = false
	$"../Tier 3 Level 2".visible = false
	$"../Tier 3 Level 3".visible = false
	$"../Tier 3 Level 4".visible = false
	$"../Tier 3 Level 5".visible = false


func _on_pressed() -> void:
	$Interact.play()
	Tier_Level = 1
	
	#Text_Check(Text_Level)
	$"../Node2D".visible = true


func _on_close_button_sequencing_pressed() -> void:
	$"../Node2D/Close Button Sequencing/Close".play()
	_Image()
	Tier_Level = 1
	Tier_1_Text_Level = 1
	Text_Check()
	#Text_Check(Text_Level)
	$"../Node2D".visible = false


func _on_left_movement_mouse_entered() -> void:
	$"../Node2D/Left Movement/Hover".play()


func _on_right_movement_mouse_entered() -> void:
	$"../Node2D/Right Movement/Hover".play()


func _on_basic_pressed() -> void:
	Tier_Level = 1
	Tier_1_Text_Level = 1
	Text_Check()
	$"../Node2D/Basic/Interact".play()
	$"../Node2D/Basic/Upgrade Notifier".visible = false

func _on_basic_mouse_entered() -> void:
	$"../Node2D/Basic/Hover".play()


func _on_plants_pressed() -> void:
	Tier_Level = 2
	Tier_2_Text_Level = 1
	Text_Check()
	$"../Node2D/Plants/Interact".play()
	$"../Node2D/Plants/Upgrade Notifier".visible = false

func _on_plants_mouse_entered() -> void:
	$"../Node2D/Plants/Hover".play()

func _on_environment_pressed() -> void:
	Tier_Level = 3
	Tier_3_Text_Level = 1
	Text_Check()
	$"../Node2D/Environment/Interact".play()
	$"../Node2D/Environment/Upgrade Notifier".visible = false

func _on_environment_mouse_entered() -> void:
	$"../Node2D/Environment/Hover".play()
