extends TextureButton

var Tier_1_Text_Level_Min = 1
var Tier_1_Text_Level_Max = 15
var Tier_2_Text_Level_Min = 1
var Tier_2_Text_Level_Max = 2
var Tier_3_Text_Level_Min = 1
var Tier_3_Text_Level_Max = 4
var Tier_4_Text_Level_Min = 1
var Tier_4_Text_Level_Max = 9

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

var Potencies_Notification = true
var Combos_Notification = true

var Back_Arrow = false

func _ready():
	$"../Node2D/ScrollContainer/Node Name".text = str("Welcome to the Genome Sequencing Game Tutorial: This tutorial consists of multiple parts, here you will optimize the plant’s genome to ensure the plants you work with grow as well as they possibly can as well as acquiring research points from these minigames.")

func _process(_delta):
	if $"../Node2D/Potencies".disabled == false:
		if Potencies_Notification == true:
			$"../Node2D/Potencies/Upgrade Notifier".visible = true
			Potencies_Notification = false
	if $"../Node2D/Combos".disabled == false:
		if Combos_Notification == true:
			$"../Node2D/Combos/Upgrade Notifier".visible = true
			Combos_Notification = false
	
	if $"../Node2D/Basic/Upgrade Notifier".visible == false and $"../Node2D/Sequences/Upgrade Notifier".visible == false and $"../Node2D/Potencies/Upgrade Notifier".visible == false and $"../Node2D/Combos/Upgrade Notifier".visible == false:
		$"Upgrade Notifier".visible = false
	else:
		$"Upgrade Notifier".visible = true
	if Tier_Level == 1:
		$"../Node2D/Basic/Upgrade Notifier".visible = false
		$"../Node2D/Basic".button_pressed = true
	else:
		$"../Node2D/Basic".button_pressed = false
	if Tier_Level == 2:
		$"../Node2D/Sequences/Upgrade Notifier".visible = false
		$"../Node2D/Sequences".button_pressed = true
	else:
		$"../Node2D/Sequences".button_pressed = false
	if Tier_Level == 3:
		$"../Node2D/Potencies/Upgrade Notifier".visible = false
		$"../Node2D/Potencies".button_pressed = true
	else:
		$"../Node2D/Potencies".button_pressed = false
	if Tier_Level == 4:
		$"../Node2D/Combos/Upgrade Notifier".visible = false
		$"../Node2D/Combos".button_pressed = true
	else:
		$"../Node2D/Combos".button_pressed = false

	if Tier_2_Unlocked == true:
		$"../Node2D/Sequences".disabled = false
	if Tier_3_Unlocked == true:
		$"../Node2D/Potencies".disabled = false
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
			Tier_1_Text_Level = 15
			Text_Check()
			# Text_Check(Tier_2_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 3:
		if Tier_3_Text_Level > Tier_3_Text_Level_Min:
			Tier_3_Text_Level -= 1
			Text_Check()
		elif Tier_3_Text_Level == Tier_3_Text_Level_Min:
			Back_Arrow = true
			Tier_Level = 2
			Tier_2_Text_Level = 2
			Text_Check()
			# Text_Check(Tier_3_Text_Level) # I need to rework this into four different functions
	elif Tier_Level == 4:
		if Tier_4_Text_Level > Tier_4_Text_Level_Min:
			Tier_4_Text_Level -= 1
			Text_Check()
		elif Tier_4_Text_Level == Tier_4_Text_Level_Min:
			Back_Arrow = true
			Tier_Level = 3
			Tier_3_Text_Level = 4
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
			$"../Node2D/ScrollContainer/Node Name".text = str("Welcome to the Genome Sequencing Game Tutorial: This tutorial consists of multiple parts, here you will optimize the plant’s genome to ensure the plants you work with grow as well as they possibly can as well as acquiring research points from these minigames.")
			_Image()
		if Tier_1_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("The Genome Sequencing Game consists of 2 parts.")
			_Image()
		if Tier_1_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("The first step consists of altering all of the Nucleotides Sets, while the second is sequencing them.")
			_Image()
		if Tier_1_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("To begin you must sequence the genome and visualize what all of the values are.")
			_Image()
			$"../Node2D/T1 Level 4".visible = true
			$"../Node2D/T1 Level 5".visible = false
		if Tier_1_Text_Level == 5:
			$"../Node2D/ScrollContainer/Node Name".text = str("Second you will intake all of the values.")
			_Image()
			$"../Node2D/T1 Level 4".visible = false
			$"../Node2D/T1 Level 5".visible = true
			$"../Node2D/T1 Level 6".visible = false
			$"../../Result Tab".visible = false
		if Tier_1_Text_Level == 6:
			$"../Node2D/ScrollContainer/Node Name".text = str("Now here on step 2, you can see that there are positive and negative values.")
			_Image()
			$"../Node2D/T1 Level 5".visible = false
			$"../Node2D/T1 Level 6".visible = true
			$"../Node2D/T1 Level 7".visible = false
			$"../../Result Tab".visible = true
		if Tier_1_Text_Level == 7:
			$"../Node2D/ScrollContainer/Node Name".text = str("Right of the values you can see all of the traits of the plants you’ll be growing.")
			_Image()
			$"../Node2D/T1 Level 6".visible = false
			$"../Node2D/T1 Level 7".visible = true
			$"../Node2D/T1 Level 10".visible = false
			$"../../Result Tab".visible = true
		if Tier_1_Text_Level == 8:
			$"../Node2D/ScrollContainer/Node Name".text = str("These will come into play during another game, but for now, you want to get them as high as you can.")
			_Image()
			$"../../Result Tab".visible = false
		if Tier_1_Text_Level == 9:
			$"../Node2D/ScrollContainer/Node Name".text = str("Your goal is to get all of the values to be positive.")
			_Image()
			$"../../Result Tab".visible = false
		if Tier_1_Text_Level == 10:
			$"../Node2D/ScrollContainer/Node Name".text = str("Once you’ve memorized all negative values, you will click the Close button on the top right.")
			_Image()
			$"../Node2D/T1 Level 7".visible = false
			$"../Node2D/T1 Level 10".visible = true
			$"../Node2D/T1 Level 11".visible = false
			$"../../Result Tab".visible = true
		if Tier_1_Text_Level == 11:
			$"../Node2D/ScrollContainer/Node Name".text = str("Now, back at Step 1, you must Left Click the Nucleotide Set to change its value to its corresponding opposite. (Note: You will see the colors of the nucleotides change when Left Clicked)")
			_Image()
			$"../Node2D/T1 Level 10".visible = false
			$"../Node2D/T1 Level 11".visible = true
			$"../Node2D/T1 Level 12".visible = false
			$"../../Result Tab".visible = false
		if Tier_1_Text_Level == 12:
			$"../Node2D/ScrollContainer/Node Name".text = str("If we were to sequence this now, you’ll be able to see that the Nucleotide Set is positive instead of negative.")
			_Image()
			$"../Node2D/T1 Level 11".visible = false
			$"../Node2D/T1 Level 12".visible = true
			$"../Node2D/T1 Level 13".visible = false
			$"../../Result Tab".visible = true
		if Tier_1_Text_Level == 13:
			$"../Node2D/ScrollContainer/Node Name".text = str("Once you’ve turned all of the nucleotides to positive values you will then be able to sequence the game and finalize the sequence, acquiring points and putting you back at the beginning again.")
			_Image()
			$"../Node2D/T1 Level 12".visible = false
			$"../Node2D/T1 Level 13".visible = true
			$"../Node2D/T1 Level 14".visible = false
			$"../../Result Tab".visible = true
		if Tier_1_Text_Level == 14:
			$"../Node2D/ScrollContainer/Node Name".text = str("And finally, on the right just above the Finalize Sequence Button, you can see the total number of sequences you'll acquire over all.")
			_Image()
			$"../Node2D/T1 Level 13".visible = false
			$"../Node2D/T1 Level 14".visible = true
			$"../Node2D/T2 Level 1".visible = false
			$"../../Result Tab".visible = true
		if Tier_1_Text_Level == 15:
			$"../Node2D/ScrollContainer/Node Name".text = str("At this point, you’ve learned the basics and can play the game for now, although there’s more information to relay to you if you wish to learn more.")
			_Image()
			$"../../Result Tab".visible = false
		if Tier_1_Text_Level == 16:
			if Tier_2_Unlocked == true && Back_Arrow == false:
				Tier_Level = 2
			elif Back_Arrow == true:
				Back_Arrow = false
			elif Tier_2_Unlocked == false:
				$"../Node2D".visible = false
	if Tier_Level == 2:
		if Tier_2_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("The Genome Sequences Game can provide you with Sequences, these can be used for the Plant Development Game.")
			_Image()
			$"../Node2D/T1 Level 14".visible = false
			$"../Node2D/T2 Level 1".visible = true
			$"../Node2D/T2 Level 2".visible = false
			$"../../Result Tab".visible = false
		if Tier_2_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("Depending on the number of Nucleotide strands you have at once, can determine if you are able to acquire more than one per sequence. (Note: In order to sequence all nucleotide strands must be positive)")
			_Image()
			$"../Node2D/T2 Level 1".visible = false
			$"../Node2D/T2 Level 2".visible = true
			$"../Node2D/T3 Level 1".visible = false
			$"../../Result Tab".visible = true
		if Tier_2_Text_Level == 3:
			if Tier_3_Unlocked == true && Back_Arrow == false:
				Tier_Level = 3
			elif Back_Arrow == true:
				Back_Arrow = false
			elif Tier_3_Unlocked == false:
				$"../Node2D".visible = false

	if Tier_Level == 3:
		if Tier_3_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("Later in the Genome Sequencing Game, you’ll be able to see potencies, once you reach that point, you’ll be able to see how powerful your Nucleotide Sets are.")
			_Image()
			$"../Node2D/T2 Level 2".visible = false
			$"../Node2D/T3 Level 1".visible = true
			$"../Node2D/T3 Level 2".visible = false
			$"../../Result Tab".visible = false
		if Tier_3_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("If the color (being red or green) is noticeably dark, then it is a lower potency, if it’s brighter, then it’s a higher potency.")
			_Image()
			$"../Node2D/T3 Level 1".visible = false
			$"../Node2D/T3 Level 2".visible = true
			$"../Node2D/T3 Level 3".visible = false
			$"../../Result Tab".visible = true
		if Tier_3_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("In order to change the potency of the Nucleotide Set to its corresponding opposite, you must Right Click it. (Note: You will see the color of the Nucleotide Sets switch sides when Right Clicked)")
			_Image()
			$"../Node2D/T3 Level 2".visible = false
			$"../Node2D/T3 Level 3".visible = true
			$"../Node2D/T3 Level 4".visible = false
			$"../../Result Tab".visible = true
		if Tier_3_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("Also note that the positive Nucleotide Sets do not all need to be the largest potency they can be in order to be able to sequence.")
			_Image()
			$"../Node2D/T3 Level 3".visible = false
			$"../Node2D/T3 Level 4".visible = true
			$"../Node2D/T4 Level 3".visible = false
			$"../../Result Tab".visible = false
		if Tier_3_Text_Level == 5:
			if Tier_4_Unlocked == true && Back_Arrow == false:
				Tier_Level = 4
			elif Back_Arrow == true:
				Back_Arrow = false
			elif Tier_4_Unlocked == false:
				$"../Node2D".visible = false
	if Tier_Level == 4:
		if Tier_4_Text_Level == 1:
			$"../Node2D/ScrollContainer/Node Name".text = str("Combos will yield two things, research points (Both Scientific and Genome) and Trait Points.")
			_Image()
			$"../../Result Tab".visible = true
		if Tier_4_Text_Level == 2:
			$"../Node2D/ScrollContainer/Node Name".text = str("To activate a combo, five of the traits of the Nucleotide Sets must all be the same.")
			_Image()
			$"../../Result Tab".visible = false
		if Tier_4_Text_Level == 3:
			$"../Node2D/ScrollContainer/Node Name".text = str("Later in the game you can see the traits that each Nucleotide Set holds.")
			_Image()
			$"../Node2D/T3 Level 4".visible = false
			$"../Node2D/T4 Level 3".visible = true
			$"../Node2D/T4 Level 4".visible = false
		if Tier_4_Text_Level == 4:
			$"../Node2D/ScrollContainer/Node Name".text = str("While even later in the game you can choose which trait they hold.")
			_Image()
			$"../Node2D/T4 Level 3".visible = false
			$"../Node2D/T4 Level 4".visible = true
		if Tier_4_Text_Level == 5:
			$"../Node2D/ScrollContainer/Node Name".text = str("Each time a sequence is finalized, the traits of each Nucleotide Set randomize except for the first four, which will always be the same no matter what.")
			_Image()
		if Tier_4_Text_Level == 6:
			$"../Node2D/ScrollContainer/Node Name".text = str("If you want to play with random generation, you can press the reset button in order to randomize the traits of the bottom four. (Note: The order that the nucleotides set’s traits present themselves in has no effect on the combo, only the amount.)")
			_Image()
		if Tier_4_Text_Level == 7:
			$"../Node2D/ScrollContainer/Node Name".text = str("And finally, the number of Nucleotide Sets necessary to have the same amount of Trait bonuses can be reduced through the research tree.")
			_Image()
		if Tier_4_Text_Level == 8:
			$"../Node2D/ScrollContainer/Node Name".text = str("Though acquiring 5 traits that are the same when only 4 or less is needed will result in an even greater bonus.")
			_Image()
		if Tier_4_Text_Level > 8:
			Tier_Level = 1
			Tier_4_Text_Level = 1
			$"../Node2D".visible = false

func _Image():
	$"../Node2D/T1 Level 4".visible = false
	$"../Node2D/T1 Level 5".visible = false
	$"../Node2D/T1 Level 6".visible = false
	$"../Node2D/T1 Level 7".visible = false
	$"../Node2D/T1 Level 10".visible = false
	$"../Node2D/T1 Level 11".visible = false
	$"../Node2D/T1 Level 12".visible = false
	$"../Node2D/T1 Level 13".visible = false
	$"../Node2D/T1 Level 14".visible = false
	$"../Node2D/T2 Level 1".visible = false
	$"../Node2D/T2 Level 2".visible = false
	$"../Node2D/T3 Level 1".visible = false
	$"../Node2D/T3 Level 2".visible = false
	$"../Node2D/T3 Level 3".visible = false
	$"../Node2D/T3 Level 4".visible = false
	$"../Node2D/T4 Level 3".visible = false
	$"../Node2D/T4 Level 4".visible = false


func _on_pressed() -> void:
	$Interact.play()
	Tier_Level = 1
	
	#Text_Check(Text_Level)
	$"../Node2D".visible = true


func _on_close_button_sequencing_pressed() -> void:
	$"../Node2D/Close Button Sequencing/Close".play()
	$"../../Result Tab".visible = false
	Tier_Level = 1
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

func _on_sequences_pressed() -> void:
	Tier_Level = 2
	Tier_2_Text_Level = 1
	Text_Check()
	$"../Node2D/Sequences/Interact".play()
	$"../Node2D/Sequences/Upgrade Notifier".visible = false

func _on_sequences_mouse_entered() -> void:
	$"../Node2D/Sequences/Hover".play()

func _on_potencies_pressed() -> void:
	Tier_Level = 3
	Tier_3_Text_Level = 1
	Text_Check()
	$"../Node2D/Potencies/Interact".play()
	$"../Node2D/Potencies/Upgrade Notifier".visible = false

func _on_potencies_mouse_entered() -> void:
	$"../Node2D/Potencies/Hover".play()

func _on_combos_pressed() -> void:
	Tier_Level = 4
	Tier_4_Text_Level = 1
	Text_Check()
	$"../Node2D/Combos/Interact".play()
	$"../Node2D/Combos/Upgrade Notifier".visible = false

func _on_combos_mouse_entered() -> void:
	$"../Node2D/Combos/Hover".play()
