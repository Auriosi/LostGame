extends Button

var fade = 1
var drop = true
var rise = false
var mouse = false

@onready var Nucleotide_Sprite = $Nucleotide
@onready var Nucleotide_Text_1 = $Potency
@onready var Nucleotide_Text_2 = $Trait
@onready var Result_Tab = $"../../Result Tab"
# Upgrades ~ These Varables are upgrades that will alter the game.

# Real_Time_Potency Prerequisites: Real_Time_Positive

# General Variables Used elsewhere in the code.

var Trait_Button = false

var Starting_Sprite = randi() % 4
var Nucleotide = "" # Name ID of Nucleotides stored.
var Trait_Randomization = randi() % 4
@export var Trait = "Empty"
@export var Choosable_Trait = "Unselected"
var Minor_Trait = randi() % 1 + 1
var Major_Trait = randi() % 2 + 2
var Target = randi() % 4 # Randomizes necessary Nucleotide Set to achieve best result.
var modulation = Vector4(1.0,1.0,1.0,1.0) # Out takes the color so it can be copied and referenced easily
var modulation_2 = Vector4(1.0,1.0,1.0,1.0)
var Real_Time_Potency = false
var Real_Time_Positive = false

var Stats = [0,""] # Stats = [Trait Number, Trait Type]

var Change_Nucleotide = false
var Switch_Nucleotide = false

func _ready():
	Minor_Trait = randi() % $"../..".Nucleotide_Min_Rand
	Major_Trait = randi() % $"../..".Nucleotide_Max_Rand
	Minor_Trait += $"../..".Nucleotide_Min_Base
	Major_Trait += $"../..".Nucleotide_Max_Base
	if has_node("Button") == true:
		Trait_Button = true
	
	_Randomize_Trait()
	_Randomize_Starting_Sprite()
	_Randomize_Target_Nucleotide()

func _process(delta):
	if Result_Tab.visible == false: 
		if Input.is_action_just_pressed("Switch Nucleotide Set") && Switch_Nucleotide == true:
			$Interact.play()
			_Switch_Nucleotide()
			_Randomize_Target_Nucleotide()
		elif Input.is_action_just_pressed("Change Nucleotide Set") && Change_Nucleotide == true:
			$Interact.play()
			_Change_Nucleotides()
			_Randomize_Target_Nucleotide()
	_Text_Data()
	Stats[1] = Trait
	_Nucleotide_Anim(delta)
	if mouse == true:
		if Input.is_action_pressed("Left Click"):
			$"../..".visible = true

	if $"../../Result Tab".Sequence_Time >= $"../../Result Tab".Sequence_Timer_Max:
		if $"../..".Previous_Positive == true && $"../..".Previous_Potency == false:
			if Stats[0] > 0:
				Nucleotide_Text_1.text =  "Positive"
				Nucleotide_Text_1.modulate = (Color(0.0, 1.0, 0.0, 0.196))
			else:
				Nucleotide_Text_1.text =  "Negative"
				Nucleotide_Text_1.modulate = (Color(0.725, 0.0, 0.0, 0.196))
		elif $"../..".Previous_Positive == true && $"../..".Previous_Potency == true:
			if Stats[0] > 0: 
				if Stats[0] > Minor_Trait:
					modulation = (Color(0.0, 0.395, 0.059, 1.0))
					Nucleotide_Text_1.modulate = modulation
				else:
					modulation = (Color(0.0, 1.0, 0.0, 0.196))
					Nucleotide_Text_1.modulate = modulation
			else:
				if abs(Stats[0]) > Minor_Trait:
					modulation = (Color(0.726, 0.0, 0.0, 1.0))
					Nucleotide_Text_1.modulate = modulation
				else:
					modulation = (Color(0.725, 0.0, 0.0, 0.196))
					Nucleotide_Text_1.modulate = modulation
			Nucleotide_Text_1.text = str(Stats[0])

func _on_pressed() -> void:
	
	Change_Nucleotide = true
	Switch_Nucleotide = true


func _Switch_Nucleotide():
	Change_Nucleotide = false
	Switch_Nucleotide = false
	if Nucleotide == "A-T":
		Nucleotide = "T-A"
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Thymine-Adenine Nucleotide Set Sprite.png")
	elif Nucleotide == "T-A":
		Nucleotide = "A-T"
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Adenine-Thymine Nucleotide Set Sprite.png")
	elif Nucleotide == "C-G":
		Nucleotide = "G-C"
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Guanine-Cytosine Nucleotide Set Sprite.png")
	elif Nucleotide == "G-C":
		Nucleotide = "C-G"
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Cytosine-Guanine Nucleotide Set Sprite.png")

func _Change_Nucleotides():
	Change_Nucleotide = false
	Switch_Nucleotide = false
	if Nucleotide == "A-T":
		Nucleotide = "C-G"
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Cytosine-Guanine Nucleotide Set Sprite.png")
	elif Nucleotide == "T-A":
		Nucleotide = "G-C"
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Guanine-Cytosine Nucleotide Set Sprite.png")
	elif Nucleotide == "C-G":
		Nucleotide = "A-T"
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Adenine-Thymine Nucleotide Set Sprite.png")
	elif Nucleotide == "G-C":
		Nucleotide = "T-A"
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Thymine-Adenine Nucleotide Set Sprite.png")


func _Randomize_Starting_Sprite():
	if Starting_Sprite == 0:
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Adenine-Thymine Nucleotide Set Sprite.png")
		Nucleotide = "A-T"
	elif Starting_Sprite == 1:
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Cytosine-Guanine Nucleotide Set Sprite.png")
		Nucleotide = "C-G"
	elif Starting_Sprite == 2:
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Guanine-Cytosine Nucleotide Set Sprite.png")
		Nucleotide = "G-C"
	else:
		Nucleotide_Sprite.texture = preload("res://Sprites/Genome Sequencing/Thymine-Adenine Nucleotide Set Sprite.png")
		Nucleotide = "T-A"

func _Randomize_Target_Nucleotide():
	if Target == 0:
		if Nucleotide == "T-A":
			Stats = [Major_Trait,Trait]
		elif Nucleotide == "A-T":
			Stats = [Minor_Trait,Trait]
		elif Nucleotide == "C-G":
			Stats = [-Minor_Trait,Trait]
		elif Nucleotide == "G-C":
			Stats = [-Major_Trait,Trait]
	elif Target == 1:
		if Nucleotide == "A-T":
			Stats = [Major_Trait,Trait]
		elif Nucleotide == "T-A":
			Stats = [Minor_Trait,Trait]
		elif Nucleotide == "G-C":
			Stats = [-Minor_Trait,Trait]
		elif Nucleotide == "C-G":
			Stats = [-Major_Trait,Trait]
	elif Target == 2:
		if Nucleotide == "C-G":
			Stats = [Major_Trait,Trait]
		elif Nucleotide == "G-C":
			Stats = [Minor_Trait,Trait]
		elif Nucleotide == "T-A":
			Stats = [-Minor_Trait,Trait]
		elif Nucleotide == "A-T":
			Stats = [-Major_Trait,Trait]
	else:
		if Nucleotide == "G-C":
			Stats = [Major_Trait,Trait]
		elif Nucleotide == "C-G":
			Stats = [Minor_Trait,Trait]
		elif Nucleotide == "A-T":
			Stats = [-Minor_Trait,Trait]
		elif Nucleotide == "T-A":
			Stats = [-Major_Trait,Trait]

func _Randomize_Trait():
	if Trait_Randomization == 0 && Trait == "Empty":
		Trait = "Survivability"
	elif Trait_Randomization == 1 && Trait == "Empty":
		Trait = "Yield"
	elif Trait_Randomization == 2 && Trait == "Empty":
		Trait = "Growth"
	elif Trait == "Empty":
		Trait = "Longevity"


func _Text_Data(): # Sets text info for Trait Potency and Trait Type
	 #Is the trait Minor category or Major?
	if $"../..".Real_Time_Potency == true && $"../..".Real_Time_Positive == true && $"../..".Previous_Potency == true && $"../..".Previous_Positive == true:
		Real_Time_Potency = true
	
	if $"../..".Real_Time_Potency == false && $"../..".Real_Time_Positive == true && $"../..".Previous_Positive == true:
		Real_Time_Positive = true
	if Stats[0] > 0: 
		if Stats[0] > Minor_Trait:

			modulation = (Color(0.0, 0.395, 0.059, 1.0))
			if Real_Time_Potency == true:
				Nucleotide_Text_1.modulate = modulation
		else:
			modulation = (Color(0.0, 1.0, 0.0, 0.196))
			if Real_Time_Potency == true:
				Nucleotide_Text_1.modulate = modulation
	else:
		if abs(Stats[0]) > Minor_Trait:
			modulation = (Color(0.726, 0.0, 0.0, 1.0))
			if Real_Time_Potency == true:
				Nucleotide_Text_1.modulate = modulation
		else:
			modulation = (Color(0.725, 0.0, 0.0, 0.196))
			if Real_Time_Potency == true:
				Nucleotide_Text_1.modulate = modulation
	 #Upgrades come into play here.
	if Real_Time_Potency == true:
		Nucleotide_Text_1.text = str(Stats[0])
	else:
		if Real_Time_Positive == true:
			if Stats[0] > 0:
				Nucleotide_Text_1.text =  "Positive"
				Nucleotide_Text_1.modulate = (Color(0.0, 1.0, 0.0, 0.196))
			else:
				Nucleotide_Text_1.text =  "Negative"
				Nucleotide_Text_1.modulate = (Color(0.725, 0.0, 0.0, 0.196))
	 #What Trait is it?
	if $"../..".Real_Time_Trait == true:
		if Stats[1] == "Longevity":
			modulation_2 = (Color(0.678, 0.0, 0.0, 1.0))
			Nucleotide_Text_2.modulate = modulation_2
			Nucleotide_Text_2.text = "L"
		elif Stats[1] == "Growth":
			modulation_2 = (Color(0.0, 0.353, 0.114, 1.0))
			Nucleotide_Text_2.modulate = modulation_2
			Nucleotide_Text_2.text = "G"
		elif Stats[1] == "Yield":
			modulation_2 = (Color(0.0, 0.353, 0.608, 1.0))
			Nucleotide_Text_2.modulate = modulation_2
			Nucleotide_Text_2.text = "Y"
		elif Stats[1] == "Survivability":
			modulation_2 = (Color(0.557, 0.235, 0.004, 1.0))
			Nucleotide_Text_2.modulate = modulation_2
			Nucleotide_Text_2.text = "S"
	else:
		if Stats[1] == "Longevity":
			modulation_2 = (Color(0.659, 0.0, 0.0, 1.0))
		elif Stats[1] == "Growth":
			modulation_2 = (Color(0.0, 0.353, 0.114, 1.0))
		elif Stats[1] == "Yield":
			modulation_2 = (Color(0.0, 0.353, 0.608, 1.0))
		elif Stats[1] == "Survivability":
			modulation_2 = (Color(0.555, 0.235, 0.003, 1.0))

func _on_button_pressed() -> void:
	if Trait_Button == true && $"../..".Real_Time_Trait == true:
		var Toggle = true
		if Trait == "Survivability" && Toggle:
			Trait = "Yield"
			Nucleotide_Text_2.text = "Y"
			Toggle = false
		if Trait == "Yield" && Toggle:
			Trait = "Growth"
			Nucleotide_Text_2.text = "G"
			Toggle = false
		if Trait == "Growth" && Toggle:
			Trait = "Longevity"
			Nucleotide_Text_2.text = "L"
			Toggle = false
		if Trait == "Longevity" && Toggle:
			Trait = "Survivability"
			Nucleotide_Text_2.text = "S"
			Toggle = false

func _on_button_mouse_entered() -> void:
	$"Box2".modulate = Color(1, 1, 1, 0.25)

func _on_button_mouse_exited() -> void:
	$"Box2".modulate = Color(1, 1, 1, 0.5)

func _on_finalize_button_pressed() -> void:
	if Choosable_Trait == "Trait 1":
		if $"../..".Choose_Trait_1 == false:
			Trait = "Empty"
			Trait_Randomization = randi() % 4
			_Randomize_Trait()
	elif Choosable_Trait == "Trait 2":
		if $"../..".Choose_Trait_2 == false:
			Trait = "Empty"
			Trait_Randomization = randi() % 4
			_Randomize_Trait()
	elif Choosable_Trait == "Trait 3":
		if $"../..".Choose_Trait_3 == false:
			Trait = "Empty"
			Trait_Randomization = randi() % 4
			_Randomize_Trait()
	elif Choosable_Trait == "Final":
		Trait = "Empty"
		Trait_Randomization = randi() % 4
		_Randomize_Trait()
		
	Starting_Sprite = randi() % 4
	Minor_Trait = randi() % $"../..".Nucleotide_Min_Rand
	Major_Trait = randi() % $"../..".Nucleotide_Max_Rand
	Minor_Trait += $"../..".Nucleotide_Min_Base
	Major_Trait += $"../..".Nucleotide_Max_Base
	Target = randi() % 4
	_Randomize_Starting_Sprite()
	_Randomize_Target_Nucleotide()

func _Nucleotide_Anim(delta):
	if drop == true:
		fade -= 0.5 * delta
	elif rise == true:
		fade += 0.5 * delta
	if fade > 1:
		rise = false
		drop = true
	if fade < 0.5:
		drop = false
		rise = true
	$BaseNucleotideSetSpriteOutline.modulate = Color(1,1,1,fade)

func _on_mouse_entered() -> void:
	$Hover.play()
	$BaseNucleotideSetSpriteOutline.visible = true
	drop = true
	rise = false
	fade = 1
	mouse = true

func _on_mouse_exited() -> void:
	$BaseNucleotideSetSpriteOutline.visible = false
	mouse = false


func _on_refresh_button_down() -> void:
	_Refresh()


func _Refresh():
	if Choosable_Trait == "Trait 1":
		if $"../..".Choose_Trait_1 == false:
			Trait = "Empty"
			Trait_Randomization = randi() % 4
			_Randomize_Trait()
	elif Choosable_Trait == "Trait 2":
		if $"../..".Choose_Trait_2 == false:
			Trait = "Empty"
			Trait_Randomization = randi() % 4
			_Randomize_Trait()
	elif Choosable_Trait == "Trait 3":
		if $"../..".Choose_Trait_3 == false:
			Trait = "Empty"
			Trait_Randomization = randi() % 4
			_Randomize_Trait()
	elif Choosable_Trait == "Final":
		Trait = "Empty"
		Trait_Randomization = randi() % 4
		_Randomize_Trait()
		
	Starting_Sprite = randi() % 4
	Minor_Trait = randi() % $"../..".Nucleotide_Min_Rand
	Major_Trait = randi() % $"../..".Nucleotide_Max_Rand
	Minor_Trait += $"../..".Nucleotide_Min_Base
	Major_Trait += $"../..".Nucleotide_Max_Base
	Target = randi() % 4
	_Randomize_Starting_Sprite()
	_Randomize_Target_Nucleotide()
