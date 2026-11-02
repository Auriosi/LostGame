extends TextureButton

var Tier_1_Text_Level_Min = 1
var Tier_1_Text_Level_Max = 12
var Tier_2_Text_Level_Min = 1
var Tier_2_Text_Level_Max = 7
var Tier_3_Text_Level_Min = 1
var Tier_3_Text_Level_Max = 3
var Tier_4_Text_Level_Min = 1
var Tier_4_Text_Level_Max = 6

var Text_Level_Min = 1
var Text_Level_Max = 30

var Tier_Level = 1

var Tier_1_Text_Level = 1
var Tier_2_Text_Level = 1
var Tier_3_Text_Level = 1
var Tier_4_Text_Level = 1

var Tier_2_Unlocked = true
var Tier_3_Unlocked = true
var Tier_4_Unlocked = true

var Enviornment_Notification = true
var Combos_Notification = true

var Back_Arrow = false

func _ready():
	$"../Node2D/ScrollContainer/Node Name".text = str("Welcome to the Plant Development Tutorial: Here you will discover the results of your Genome Sequencing as you grow plants, acquiring research points and crops.")

func _process(_delta):
	if $"../Node2D/Environment".disabled == false:
		if Enviornment_Notification == true:
			$"../Node2D/Environment/Upgrade Notifier".visible = true
			Enviornment_Notification = false
	if $"../Node2D/Combos".disabled == false:
		if Combos_Notification == true:
			$"../Node2D/Combos/Upgrade Notifier".visible = true
			Combos_Notification = false
	
	if $"../Node2D/Basic/Upgrade Notifier".visible == false and $"../Node2D/Plants/Upgrade Notifier".visible == false and $"../Node2D/Environment/Upgrade Notifier".visible == false and $"../Node2D/Combos/Upgrade Notifier".visible == false:
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
	if Tier_Level == 4:
		$"../Node2D/Combos/Upgrade Notifier".visible = false
		$"../Node2D/Combos".button_pressed = true
	else:
		$"../Node2D/Combos".button_pressed = false

	if Tier_2_Unlocked == true:
		$"../Node2D/Plants".disabled = false
	if Tier_3_Unlocked == true:
		$"../Node2D/Environment".disabled = false
	if Tier_4_Unlocked == true:
		$"../Node2D/Combos".disabled = false
	
	if $"../Node2D".visible == true:
		if Input.is_action_just_released("Close Menu") == true:
			$"../Node2D".visible = false

func _on_left_movement_pressed() -> void:
	$"../Node2D/Left Movement/Interact".play()
	if Tier_Level == 1:
		if Tier_1_Text_Level > Tier_1_Text_Level_Min:
			Tier_1_Text_Level -= 1
			Text_Check()
			# Text_Check(Tier_1_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 2:
		if Tier_2_Text_Level > Tier_2_Text_Level_Min:
			Tier_2_Text_Level -= 1
			Text_Check()
		elif Tier_2_Text_Level == Tier_2_Text_Level_Min:
			Back_Arrow = true
			Tier_Level = 1
			Tier_1_Text_Level = 12
			Text_Check()
			# Text_Check(Tier_2_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 3:
		if Tier_3_Text_Level > Tier_3_Text_Level_Min:
			Tier_3_Text_Level -= 1
			Text_Check()
		elif Tier_3_Text_Level == Tier_3_Text_Level_Min:
			Back_Arrow = true
			Tier_Level = 2
			Tier_2_Text_Level = 7
			Text_Check()
			# Text_Check(Tier_3_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 4:
		if Tier_4_Text_Level > Tier_4_Text_Level_Min:
			Tier_4_Text_Level -= 1
			Text_Check()
		elif Tier_4_Text_Level == Tier_4_Text_Level_Min:
			Back_Arrow = true
			Tier_Level = 3
			Tier_3_Text_Level = 3
			Text_Check()
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
		elif Tier_3_Text_Level == Tier_3_Text_Level_Max:
			Tier_Level = 4
			Text_Check()
			# Text_Check(Tier_3_Text_Level) # I need to rework this into four different functions
	else:
		if Tier_4_Text_Level < Tier_4_Text_Level_Max:
			Tier_4_Text_Level += 1
			Text_Check()
			# Text_Check(Tier_4_Text_Level) # I need to rework this into four different functions



func Text_Check():
	if Tier_Level == 1:
		if Tier_1_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("Welcome to the Plant Development Tutorial: Here you will discover the results of your Genome Sequencing as you grow plants, acquiring research points and crops.")
			_Image()
		if Tier_1_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("In the middle, you can see the number of slots you’ll have available for plants to grow from (There will be four to start with.)")
			_Image()
		if Tier_1_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("On the right, you can also see the current traits of the plants that you’re growing.")
			_Image()
		if Tier_1_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("Playing this game properly will consist of two steps, first inputting sequences, and cycling plant growth.")
			_Image()
		if Tier_1_Text_Level == 5:
			$"../Node2D/ScrollContainer/Node Name".text = str("The first step of this is to acquire three sequences for each plant development cycle.")
			_Image()
		if Tier_1_Text_Level == 6:
			$"../Node2D/ScrollContainer/Node Name".text = str("On the right, you can see three different cartage inputs that will light up when hovering over them.")
			_Image()
			$"../Node2D/Tier 1 Level 6-1".visible = true
			$"../Node2D/Tier 1 Level 6-2".visible = true
			$"../Node2D/Tier 1 Level 6-3".visible = true
			$"../Node2D/Tier 1 Level 6-4".visible = true
		if Tier_1_Text_Level == 7:
			$"../Node2D/ScrollContainer/Node Name".text = str("You will need a sequence for each input.")
			_Image()
			$"../Node2D/Tier 1 Level 7-1".visible = true
			$"../Node2D/Tier 1 Level 7-2".visible = true
		if Tier_1_Text_Level == 8:
			$"../Node2D/ScrollContainer/Node Name".text = str("Once all of the sequences have been filled, you can then go over the next step.")
			_Image()
			$"../Node2D/Tier 1 Level 8".visible = true
		if Tier_1_Text_Level == 9:
			$"../Node2D/ScrollContainer/Node Name".text = str("The next step is to press the iterate button to initiate plant growth.")
			_Image()
			$"../Node2D/Tier 1 Level 9".visible = true
		if Tier_1_Text_Level == 10:
			$"../Node2D/ScrollContainer/Node Name".text = str("You will keep pressing this button until all of the plants have died.")
			_Image()
		if Tier_1_Text_Level == 11:
			$"../Node2D/ScrollContainer/Node Name".text = str("Once all the plants have died, you will press reset to return to square one.")
			_Image()
			$"../Node2D/Tier 1 Level 11".visible = true
		if Tier_1_Text_Level == 12:
			$"../Node2D/ScrollContainer/Node Name".text = str("And those are the basics for Plant Development, though more details on how to optimize plans are available.")
			_Image()
		if Tier_1_Text_Level == 13:
			if Tier_2_Unlocked == true && Back_Arrow == false:
				Tier_Level = 2
			elif Back_Arrow == true:
				Back_Arrow = false
			elif Tier_2_Unlocked == false:
				$"../Node2D".visible = false
	if Tier_Level == 2:
		if Tier_2_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("For each iteration a plant survives they will gain points, and as the plants grow from one stage to another, the amount of points they will earn each iteration will increase.")
			_Image()
		if Tier_2_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("Show plants at different stages of evolution.")
			_Image()
			$"../Node2D/Tier 2 Level 2".visible = true
		if Tier_2_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("Each of the number of traits affects the plant in a number of different ways.")
			_Image()
			$"../Node2D/Tier 2 Level 3".visible = true
		if Tier_2_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("Longevity will increase how many iterations the plant can survive for.")
			_Image()
			$"../Node2D/Tier 2 Level 4".visible = true
		if Tier_2_Text_Level == 5:
			$"../Node2D/ScrollContainer/Node Name".text = str("Growth will increase the chance of evolution each time it survives an iteration.")
			_Image()
			$"../Node2D/Tier 2 Level 5".visible = true
		if Tier_2_Text_Level == 6:
			$"../Node2D/ScrollContainer/Node Name".text = str("Yield will increase the amount of research points that are earned as well as the change that a crop will be received from a plant.")
			_Image()
			$"../Node2D/Tier 2 Level 6".visible = true
		if Tier_2_Text_Level == 7:
			$"../Node2D/ScrollContainer/Node Name".text = str("And Survivability will determine the chance the plant has to survive each iteration while under an extreme environmental condition.")
			_Image()
			$"../Node2D/Tier 2 Level 7".visible = true
		if Tier_2_Text_Level == 8:
			if Tier_3_Unlocked == true && Back_Arrow == false:
				Tier_Level = 3
			elif Back_Arrow == true:
				Back_Arrow = false
			elif Tier_3_Unlocked == false:
				$"../Node2D".visible = false
	if Tier_Level == 3:
		if Tier_3_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("Environmental conditions are conditions that increase the chance of a plant dying, for the trade off of increased research point or crop yield.")
			_Image()
		if Tier_3_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("Each hazard is tied to an environmental threat and can be accessed (once available by pressing the button under the word climate.")
			_Image()
			$"../Node2D/Tier 3 Level 2".visible = true
		if Tier_3_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("Each climate has a different effect, heated climates increase crop yield, cold climates increase scientific research point yield, toxic climates increase genome research point yield, and radioactive climates increase specialized research point yield.")
			_Image()
			$"../Node2D/Tier 3 Level 3".visible = true
		if Tier_3_Text_Level == 4:
			if Tier_4_Unlocked == true && Back_Arrow == false:
				Tier_Level = 4
			elif Back_Arrow == true:
				Back_Arrow = false
			elif Tier_4_Unlocked == false:
				$"../Node2D".visible = false
	if Tier_Level == 4:
		if Tier_4_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("Combos are quite strange in this mode because they work in multiple different ways.")
			_Image()
		if Tier_4_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("A combo can initially be achieved when any line, horizontally, perpendicularly, or diagonally reaches seven in a row while in the same stage of growth (when not a sapling.)")
			_Image()
			$"../Node2D/Tier 4 Level 2".visible = true
		if Tier_4_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("The amount necessary for a combo to activate can decrease from seven, and can activate a bonus on top of the combo bonus when it surpasses the combo necessity.")
			_Image()
		if Tier_4_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("Furthermore, a combo can be activated in unorthodox locations, and isn’t restricted to the corners of the grid.")
			_Image()
		if Tier_4_Text_Level == 5:
			$"../Node2D/ScrollContainer/Node Name".text = str("Let’s say that across the board, if you only needed 5 plants to be on the same stage for a combo to activate, this would be a valid activation.")
			_Image()
			$"../Node2D/Tier 4 Level 5".visible = true
		if Tier_4_Text_Level == 6:

			Tier_Level = 1
			Tier_4_Text_Level = 1
			$"../Node2D".visible = false

func _Image():
	$"../Node2D/Tier 1 Level 6-1".visible = false
	$"../Node2D/Tier 1 Level 6-2".visible = false
	$"../Node2D/Tier 1 Level 6-3".visible = false
	$"../Node2D/Tier 1 Level 6-4".visible = false
	$"../Node2D/Tier 1 Level 7-1".visible = false
	$"../Node2D/Tier 1 Level 7-2".visible = false
	$"../Node2D/Tier 1 Level 8".visible = false
	$"../Node2D/Tier 1 Level 9".visible = false
	$"../Node2D/Tier 1 Level 11".visible = false
	$"../Node2D/Tier 2 Level 2".visible = false
	$"../Node2D/Tier 2 Level 3".visible = false
	$"../Node2D/Tier 2 Level 4".visible = false
	$"../Node2D/Tier 2 Level 5".visible = false
	$"../Node2D/Tier 2 Level 6".visible = false
	$"../Node2D/Tier 2 Level 7".visible = false
	$"../Node2D/Tier 3 Level 2".visible = false
	$"../Node2D/Tier 3 Level 3".visible = false
	$"../Node2D/Tier 4 Level 2".visible = false
	$"../Node2D/Tier 4 Level 5".visible = false


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

func _on_combos_pressed() -> void:
	Tier_Level = 4
	Tier_4_Text_Level = 1
	Text_Check()
	$"../Node2D/Combos/Interact".play()
	$"../Node2D/Combos/Upgrade Notifier".visible = false

func _on_combos_mouse_entered() -> void:
	$"../Node2D/Combos/Hover".play()
