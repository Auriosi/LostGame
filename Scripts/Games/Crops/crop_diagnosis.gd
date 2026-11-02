extends Node2D

var mouse = false

var Fruit_Toggle = 0
var Fruit_Examination = false
var Apples_Reduced = false
var Oranges_Reduced = false
var Bananas_Reduced = false
var Strawberries_Reduced = false
var Blueberries_Reduced = false
var Potatos_Reduced = false
var Tomatos_Reduced = false
var Carrots_Reduced = false
var Cucumbers_Reduced = false
var Corn_Reduced = false

var Apples_Researched = 0
var Oranges_Researched = 0
var Bananas_Researched = 0
var Strawberries_Researched = 0
var Blueberries_Researched = 0
var Potatoes_Researched = 0
var Tomatos_Researched = 0
var Carrots_Researched = 0
var Cucumbers_Researched = 0
var Corn_Researched = 0

var examine = false
var conclusion = false
var reset = false

var Sequence_Time = 0
var Sequence_Timer = false

var Sequence_Timer_Max = 5
@export var Seconds_To_Sequence = float(5)

#var Sub_UI_Active = false

@export var SP_Flat_Gain_Min = float(1) 
@export var SP_Flat_Gain_Max = float(3)
@export var SP_Multiplier_Min = float(4)
@export var SP_Multiplier_Max = float(2)

@export var GP_Flat_Gain_Min = float(1)
@export var GP_Flat_Gain_Max = float(3)
@export var GP_Multiplier_Min = float(4)
@export var GP_Multiplier_Max = float(2)

@export var XP_Flat_Gain_Min = float(1)
@export var XP_Flat_Gain_Max = float(3)
@export var XP_Multiplier_Min = float(4) # To be divided by 4
@export var XP_Multiplier_Max = float(2) # To be divided by 4

var SP_Gain
var GP_Gain
var XP_Gain

var Scan = false

#var SP_Selected

func _on_close_button_button_up() -> void:
	$".".visible = false
	$"Close Button/Close".play()

func _process(delta):
	if $Area2D/Fruit.texture == null or Scan == true:
		$"Examine Button".disabled = true
	else:
		$"Examine Button".disabled = false
	
	if examine == true:
		_examine(delta) 
	
	if Fruit_Toggle > 0:
		Sequence_Timer = true
	else:
		Sequence_Timer = false
	if Input.is_action_just_pressed("Close Menu"):
		if $"Library Tab".visible == true:
			$"Library Tab".visible = false
		elif $"Research Tab".visible == true:
			$"Research Tab".visible = false
		else:
			$".".visible = false
	_fruit()
	if $"Research Tab/Scientific".disabled == true or $"Research Tab/Genome".disabled == true or $"Research Tab/Specialized".disabled == true or $"Research Tab/Balanced".disabled == true:
		$"Research Tab/Conclusion".disabled = false
		

func _on_apples_button_toggled(toggled_on: bool) -> void:
	$"Labels/Apples Button/Interact".play()
	if toggled_on == true && $"..".Apples > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Apple.png")
		Fruit_Toggle += 1
		$"Labels/Oranges Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Apples -= 1
		Apples_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Apple.png"):
		$"Labels/Oranges Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Apples += 1
		else:
			Apples_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Apple_Upgrade_Iteration < 7:
				$"Library Tab/Apples".text = str("Apples: " + str(Apples_Researched))
		Fruit_Examination = false

func _on_oranges_button_toggled(toggled_on: bool) -> void:
	$"Labels/Oranges Button/Interact".play()
	if toggled_on == true && $"..".Oranges > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Orange.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Oranges -= 1
		Oranges_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Orange.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Oranges += 1
		else:
			Oranges_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Orange_Upgrade_Iteration < 7:
				$"Library Tab/Oranges".text = str("Oranges: " + str(Oranges_Researched))
		Fruit_Examination = false
		$"Labels/Oranges Button".button_pressed = false

func _on_bananas_button_toggled(toggled_on: bool) -> void:
	$"Labels/Bananas Button/Interact".play()
	if toggled_on == true && $"..".Bananas > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Banana.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Oranges Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Bananas -= 1
		Bananas_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Banana.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Oranges Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Bananas += 1
		else:
			Bananas_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Banana_Upgrade_Iteration < 7:
				$"Library Tab/Bananas".text = str("Bananas: " + str(Bananas_Researched))
		Fruit_Examination = false
		$"Labels/Bananas Button".button_pressed = false

func _on_strawberries_button_toggled(toggled_on: bool) -> void:
	$"Labels/Strawberries Button/Interact".play()
	if toggled_on == true && $"..".Strawberries > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Strawberry.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Oranges Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Strawberries -= 1
		Strawberries_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Strawberry.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Oranges Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Strawberries += 1
		else:
			Strawberries_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Strawberry_Upgrade_Iteration < 7:
				$"Library Tab/Strawberries".text = str("Strawberries: " + str(Strawberries_Researched))
		Fruit_Examination = false
		$"Labels/Strawberries Button".button_pressed = false

func _on_blueberries_button_toggled(toggled_on: bool) -> void:
	$"Labels/Blueberries Button/Interact".play()
	if toggled_on == true && $"..".Blueberries > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Blueberry.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Oranges Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Blueberries -= 1
		Blueberries_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Blueberry.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Oranges Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Blueberries += 1
		else:
			Blueberries_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Blueberry_Upgrade_Iteration < 7:
				$"Library Tab/Blueberries".text = str("Blueberries: " + str(Blueberries_Researched))
		Fruit_Examination = false
		$"Labels/Blueberries Button".button_pressed = false

func _on_potatos_button_toggled(toggled_on: bool) -> void:
	$"Labels/Potatos Button/Interact".play()
	if toggled_on == true && $"..".Potatos > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Potato.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Oranges Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Potatos -= 1
		Potatos_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Potato.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Oranges Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Potatos += 1
		else:
			Potatoes_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Potato_Upgrade_Iteration < 7:
				$"Library Tab/Potatos".text = str("Potatoes: " + str(Potatoes_Researched))
		Fruit_Examination = false
		$"Labels/Potatos Button".button_pressed = false

func _on_tomatos_button_toggled(toggled_on: bool) -> void:
	$"Labels/Tomatos Button/Interact".play()
	if toggled_on == true && $"..".Tomatos > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Tomato.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Oranges Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Tomatos -= 1
		Tomatos_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Tomato.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Oranges Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Tomatos += 1
		else:
			Tomatos_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Tomato_Upgrade_Iteration < 7:
				$"Library Tab/Tomatos".text = str("Tomatos: " + str(Tomatos_Researched))
		Fruit_Examination = false
		$"Labels/Tomatos Button".button_pressed = false

func _on_carrots_button_toggled(toggled_on: bool) -> void:
	$"Labels/Carrots Button/Interact".play()
	if toggled_on == true && $"..".Carrots > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Carrot.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Oranges Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Carrots -= 1
		Carrots_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Carrot.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Oranges Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Carrots += 1
		else:
			Carrots_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Carrot_Upgrade_Iteration < 7:
				$"Library Tab/Carrots".text = str("Carrots: " + str(Carrots_Researched))
		Fruit_Examination = false
		$"Labels/Carrots Button".button_pressed = false
		
func _on_cucumbers_button_toggled(toggled_on: bool) -> void:
	$"Labels/Cucumbers Button/Interact".play()
	if toggled_on == true && $"..".Cucumbers > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Cucumber.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Oranges Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Corn Button".disabled = true
		$"..".Cucumbers -= 1
		Cucumbers_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Cucumber.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Oranges Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Corn Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Cucumbers += 1
		else:
			Cucumbers_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Cucumber_Upgrade_Iteration < 7:
				$"Library Tab/Cucumbers".text = str("Cucumbers: " + str(Cucumbers_Researched))
		Fruit_Examination = false
		$"Labels/Cucumbers Button".button_pressed = false
		
func _on_corn_button_toggled(toggled_on: bool) -> void:
	$"Labels/Corn Button/Interact".play()
	if toggled_on == true && $"..".Corn > 0:
		$Area2D/Fruit.texture = preload("res://Sprites/Crop Diagnosis/Corn.png")
		Fruit_Toggle += 1
		$"Labels/Apples Button".disabled = true
		$"Labels/Oranges Button".disabled = true
		$"Labels/Bananas Button".disabled = true
		$"Labels/Strawberries Button".disabled = true
		$"Labels/Blueberries Button".disabled = true
		$"Labels/Potatos Button".disabled = true
		$"Labels/Tomatos Button".disabled = true
		$"Labels/Carrots Button".disabled = true
		$"Labels/Cucumbers Button".disabled = true
		$"..".Corn -= 1
		Corn_Reduced = true
		Fruit_Examination = true
	elif $Area2D/Fruit.texture == preload("res://Sprites/Crop Diagnosis/Corn.png"):
		Fruit_Toggle -= 1
		$"Labels/Apples Button".disabled = false
		$"Labels/Oranges Button".disabled = false
		$"Labels/Bananas Button".disabled = false
		$"Labels/Strawberries Button".disabled = false
		$"Labels/Blueberries Button".disabled = false
		$"Labels/Potatos Button".disabled = false
		$"Labels/Tomatos Button".disabled = false
		$"Labels/Carrots Button".disabled = false
		$"Labels/Cucumbers Button".disabled = false
		$Area2D/Fruit.texture = null
		if conclusion == false:
			$"..".Corn += 1
		else:
			Corn_Researched += 1
			$"..".Crops -= 1
			if $"Library Tab".Corn_Upgrade_Iteration < 7:
				$"Library Tab/Corn".text = str("Corn: " + str(Corn_Researched))
		Fruit_Examination = false
		$"Labels/Corn Button".button_pressed = false

func _fruit():
	if $"..".Apples > 100:
		$Labels/Apples.text = "Apples: 99+"
	else:
		$Labels/Apples.text = "Apples: " + str($"..".Apples)
	if $"..".Oranges > 100:
		$Labels/Oranges.text = "Oranges: 99+"
	else:
		$Labels/Oranges.text = "Oranges: " + str($"..".Oranges)
	if $"..".Bananas > 100:
		$Labels/Bananas.text = "Bananas: 99+"
	else:
		$Labels/Bananas.text = "Bananas: " + str($"..".Bananas)
	if $"..".Strawberries > 100:
		$Labels/Strawberries.text = "Strawberries: 99+"
	else:
		$Labels/Strawberries.text = "Strawberries: " + str($"..".Strawberries)
	if $"..".Blueberries > 100:
		$Labels/Blueberries.text = "Blueberries: 99+"
	else:
		$Labels/Blueberries.text = "Blueberries: " + str($"..".Blueberries)
	if $"..".Potatos > 100:
		$Labels/Potatos.text = "Potatos: 99+"
	else:
		$Labels/Potatos.text = "Potatos: " + str($"..".Potatos)
	if $"..".Tomatos > 100:
		$Labels/Tomatos.text = "Tomatos: 99+"
	else:
		$Labels/Tomatos.text = "Tomatos: " + str($"..".Tomatos)
	if $"..".Carrots > 100:
		$Labels/Carrots.text = "Carrots: 99+"
	else:
		$Labels/Carrots.text = "Carrots: " + str($"..".Carrots)
	if $"..".Cucumbers > 100:
		$Labels/Cucumbers.text = "Cucumbers: 99+"
	else:
		$Labels/Cucumbers.text = "Cucumbers: " + str($"..".Cucumbers)
	if $"..".Corn > 100:
		$Labels/Corn.text = "Corn: 99+"
	else:
		$Labels/Corn.text = "Corn: " + str($"..".Corn)

func _timer(delta):
	Sequence_Timer_Max = Seconds_To_Sequence
	if Sequence_Time < Sequence_Timer_Max:
		if $"Examine Button".disabled == true:
			$Label/TextureProgressBar.max_value = Seconds_To_Sequence
			$Label/TextureProgressBar.value = Sequence_Time
			Sequence_Time += 1 * delta
			$Label.visible = true
	else:
		$"Research Button".disabled = false
		$Label.visible = false
		$"Cancel Button".disabled = true
		

func _examine(delta):
	_timer(delta)
	print($Area2D/PointLight2D.position.x)
	if examine == true:
		if $Area2D/PointLight2D.position.x < 140:
			$Area2D/PointLight2D.position += Vector2(100, -100) * delta
		if $Area2D/PointLight2D.position.x > 100 && $Area2D/PointLight2D.position.x < 220:
			$Area2D/PointLight2D2.position += Vector2(100, 100) * delta
		elif $Area2D/PointLight2D.position.x > 220:
			reset = true
	if reset == true:
		$Area2D/PointLight2D.position = Vector2(52, -20)
		$Area2D/PointLight2D2.position = Vector2(52, -92)
		reset = false
		examine = false

func _on_examine_button_button_down() -> void:
	$"Examine Button/Interact".play()
	#if Fruit_Examination == true:
	conclusion = true
	$"Examine Button".disabled = true
	$"Cancel Button".disabled = false
	_point_gain()
	Scan = true
	examine = true
	$Label/TextureProgressBar.value = 0
	# Do Math that calculates point earn.

func _on_cancel_button_button_down() -> void:
	$"Cancel Button/Interact".play()
	Fruit_Examination = false
	Sequence_Time = 0
	Scan = false
	$"Examine Button".disabled = false
	$Label/TextureProgressBar.value = Sequence_Time
	$Label.visible = false
	$"Cancel Button".disabled = true

func _point_gain():
	SP_Gain = randf_range(SP_Flat_Gain_Min, SP_Flat_Gain_Max + SP_Flat_Gain_Min)* float(randf_range(SP_Multiplier_Min, SP_Multiplier_Max + SP_Multiplier_Min)) / 4
	$"Conclusive Labels/Scientific Points".text = str(SP_Gain)
	GP_Gain = randf_range(GP_Flat_Gain_Min, GP_Flat_Gain_Max + GP_Flat_Gain_Min)* float(randf_range(GP_Multiplier_Min, GP_Multiplier_Max + GP_Multiplier_Min)) / 4
	$"Conclusive Labels/Genome Points".text = str(GP_Gain)
	XP_Gain = randf_range(XP_Flat_Gain_Min, XP_Flat_Gain_Max + XP_Flat_Gain_Min)* float(randf_range(XP_Multiplier_Min, XP_Multiplier_Max + XP_Multiplier_Min)) / 4
	$"Conclusive Labels/Specialized Points".text = str(XP_Gain)


func _on_research_button_button_down() -> void:
	$"Research Button/Interact".play()
	$"Research Tab".visible = true
	$"Research Tab/Scientific Points".text = str(SP_Gain)
	$"Research Tab/Genome Points".text = str(GP_Gain)
	$"Research Tab/Specialized Points".text = str(XP_Gain)
	reset = true

func _on_scientific_button_down() -> void:
	$"Research Tab/Scientific/Interact".play()
	SP_Gain *= float(SP_Multiplier_Max + SP_Multiplier_Min) / 4
	$"Research Tab/Scientific Points".text = str(SP_Gain)
	$"Research Tab/Scientific".disabled = true
	if $"Research Tab/Genome".disabled == true:
		GP_Gain /= float(GP_Multiplier_Max + GP_Multiplier_Min) / 4
		$"Research Tab/Genome".disabled = false
		$"Research Tab/Genome Points".text = str(GP_Gain)
	if $"Research Tab/Specialized".disabled == true:
		XP_Gain /= float(XP_Multiplier_Max + XP_Multiplier_Min) / 4
		$"Research Tab/Specialized".disabled = false
		$"Research Tab/Specialized Points".text = str(XP_Gain)
	if $"Research Tab/Balanced".disabled == true:
		SP_Gain /= ((float(SP_Multiplier_Min) / 4) + float(SP_Multiplier_Max) / 12)
		$"Research Tab/Scientific Points".text = str(SP_Gain)
		GP_Gain /= ((float(GP_Multiplier_Min) / 4) + float(GP_Multiplier_Max) / 12)
		$"Research Tab/Genome Points".text = str(GP_Gain)
		XP_Gain /= ((float(XP_Multiplier_Min) / 4) + float(XP_Multiplier_Max) / 12)
		$"Research Tab/Specialized Points".text = str(XP_Gain)
		$"Research Tab/Balanced".disabled = false
	$"Conclusive Labels/Scientific Points".text = str(SP_Gain)
	$"Conclusive Labels/Genome Points".text = str(GP_Gain)
	$"Conclusive Labels/Specialized Points".text = str(XP_Gain)

func _on_genome_button_down() -> void:
	$"Research Tab/Genome/Interact".play()
	GP_Gain *= float(GP_Multiplier_Max + GP_Multiplier_Min) / 4
	$"Research Tab/Genome Points".text = str(GP_Gain)
	$"Research Tab/Genome".disabled = true
	if $"Research Tab/Scientific".disabled == true:
		SP_Gain /= float(SP_Multiplier_Max + SP_Multiplier_Min) / 4
		$"Research Tab/Scientific".disabled = false
		$"Research Tab/Scientific Points".text = str(SP_Gain)
	if $"Research Tab/Specialized".disabled == true:
		XP_Gain /= float(XP_Multiplier_Max + XP_Multiplier_Min) / 4
		$"Research Tab/Specialized".disabled = false
		$"Research Tab/Specialized Points".text = str(XP_Gain)
	if $"Research Tab/Balanced".disabled == true:
		$"Research Tab/Balanced".disabled = false
		SP_Gain /= ((float(SP_Multiplier_Min) / 4) + float(SP_Multiplier_Max) / 12)
		$"Research Tab/Scientific Points".text = str(SP_Gain)
		GP_Gain /= ((float(GP_Multiplier_Min) / 4) + float(GP_Multiplier_Max) / 12)
		$"Research Tab/Genome Points".text = str(GP_Gain)
		XP_Gain /= ((float(XP_Multiplier_Min) / 4) + float(XP_Multiplier_Max) / 12)
		$"Research Tab/Specialized Points".text = str(XP_Gain)
	$"Conclusive Labels/Scientific Points".text = str(SP_Gain)
	$"Conclusive Labels/Genome Points".text = str(GP_Gain)
	$"Conclusive Labels/Specialized Points".text = str(XP_Gain)

func _on_specialized_button_down() -> void:
	$"Research Tab/Specialized/Interact".play()
	XP_Gain *= float(XP_Multiplier_Max + XP_Multiplier_Min) / 4
	$"Research Tab/Specialized Points".text = str(XP_Gain)
	$"Research Tab/Specialized".disabled = true
	if $"Research Tab/Scientific".disabled == true:
		SP_Gain /= float(SP_Multiplier_Max + SP_Multiplier_Min) / 4
		$"Research Tab/Scientific".disabled = false
		$"Research Tab/Scientific Points".text = str(SP_Gain)
	if $"Research Tab/Genome".disabled == true:
		GP_Gain /= float(GP_Multiplier_Max + GP_Multiplier_Min) / 4
		$"Research Tab/Genome".disabled = false
		$"Research Tab/Genome Points".text = str(GP_Gain)
	if $"Research Tab/Balanced".disabled == true:
		SP_Gain /= ((float(SP_Multiplier_Min) / 4) + float(SP_Multiplier_Max) / 12)
		$"Research Tab/Scientific Points".text = str(SP_Gain)
		GP_Gain /= ((float(GP_Multiplier_Min) / 4) + float(GP_Multiplier_Max) / 12)
		$"Research Tab/Genome Points".text = str(GP_Gain)
		XP_Gain /= ((float(XP_Multiplier_Min) / 4) + float(XP_Multiplier_Max) / 12)
		$"Research Tab/Specialized Points".text = str(XP_Gain)
		$"Research Tab/Balanced".disabled = false
	$"Conclusive Labels/Scientific Points".text = str(SP_Gain)
	$"Conclusive Labels/Genome Points".text = str(GP_Gain)
	$"Conclusive Labels/Specialized Points".text = str(XP_Gain)

func _on_balanced_button_down() -> void:
	$"Research Tab/Balanced/Interact".play()
	SP_Gain *= ((float(SP_Multiplier_Min) / 4) + float(SP_Multiplier_Max) / 12)
	GP_Gain *= ((float(GP_Multiplier_Min) / 4) + float(GP_Multiplier_Max) / 12)
	XP_Gain *= ((float(XP_Multiplier_Min) / 4) + float(XP_Multiplier_Max) / 12)
	$"Research Tab/Scientific Points".text = str(SP_Gain)
	$"Research Tab/Genome Points".text = str(GP_Gain)
	$"Research Tab/Specialized Points".text = str(XP_Gain)
	$"Research Tab/Balanced".disabled = true
	if $"Research Tab/Scientific".disabled == true:
		SP_Gain /= float(SP_Multiplier_Max + SP_Multiplier_Min) / 4
		$"Research Tab/Scientific".disabled = false
		$"Research Tab/Scientific Points".text = str(SP_Gain)
	if $"Research Tab/Genome".disabled == true:
		GP_Gain /= float(GP_Multiplier_Max + GP_Multiplier_Min) / 4
		$"Research Tab/Genome".disabled = false
		$"Research Tab/Genome Points".text = str(GP_Gain)
	if $"Research Tab/Specialized".disabled == true:
		XP_Gain /= float(XP_Multiplier_Max + XP_Multiplier_Min) / 4
		$"Research Tab/Specialized".disabled = false
		$"Research Tab/Specialized Points".text = str(XP_Gain)
	$"Conclusive Labels/Scientific Points".text = str(SP_Gain)
	$"Conclusive Labels/Genome Points".text = str(GP_Gain)
	$"Conclusive Labels/Specialized Points".text = str(XP_Gain)

func _on_conclusion_button_down() -> void:
	$"Research Tab/Conclusion/Interact".play()
	$"..".Scientific_Research_Points += SP_Gain
	$"..".Genome_Research_Points += GP_Gain
	$"..".Specialized_Research_Points += XP_Gain
	$"Research Tab/Scientific".disabled = false
	$"Research Tab/Genome".disabled = false
	$"Research Tab/Specialized".disabled = false
	$"Research Tab/Balanced".disabled = false
	$"Research Tab/Conclusion".disabled = true
	$"Research Tab".visible = false
	$"Research Button".disabled = true
	$"Cancel Button".disabled = true
	$"Labels/Apples Button".disabled = false
	$"Labels/Oranges Button".disabled = false
	$"Labels/Bananas Button".disabled = false
	$"Labels/Strawberries Button".disabled = false
	$"Labels/Blueberries Button".disabled = false
	$"Labels/Potatos Button".disabled = false
	$"Labels/Tomatos Button".disabled = false
	$"Labels/Carrots Button".disabled = false
	$"Labels/Cucumbers Button".disabled = false
	$"Labels/Corn Button".disabled = false
	
	$"Labels/Apples Button".button_pressed = false
	$"Labels/Oranges Button".button_pressed = false
	$"Labels/Bananas Button".button_pressed = false
	$"Labels/Strawberries Button".button_pressed = false
	$"Labels/Blueberries Button".button_pressed = false
	$"Labels/Potatos Button".button_pressed = false
	$"Labels/Tomatos Button".button_pressed = false
	$"Labels/Carrots Button".button_pressed = false
	$"Labels/Cucumbers Button".button_pressed = false
	$"Labels/Corn Button".button_pressed = false
	
	$Area2D/Fruit.texture = null
	Fruit_Examination = false
	Fruit_Toggle -= 1
	
	Sequence_Time = 0
	$Label/TextureProgressBar.value = Sequence_Time
	$"Conclusive Labels/Scientific Points".text = str("0")
	$"Conclusive Labels/Genome Points".text = str("0")
	$"Conclusive Labels/Specialized Points".text = str("0")
	Scan = false
	conclusion = false

func _on_close_button_button_down() -> void:
	
	$"Research Tab".visible = false
	$"Library Tab".visible = false
	$"Library Tab/Close Button/Close".play()

func _on_library_button_button_down() -> void:
	$"Library Tab".visible = true
	$"Library Button/Interact".play()


func _on_close_button_mouse_entered() -> void:
	$"Close Button/Hover".play()


func _on_examine_button_mouse_entered() -> void:
	if $"Examine Button".disabled == false:
		$"Examine Button/Hover".play()


func _on_cancel_button_mouse_entered() -> void:
	if $"Cancel Button".disabled == false:
		$"Cancel Button/Hover".play()


func _on_research_button_mouse_entered() -> void:
	if $"Research Button".disabled == false:
		$"Research Button/Hover".play()


func _on_library_button_mouse_entered() -> void:
	if $"Library Button".disabled == false:
		$"Library Button/Hover".play()


func _on_scientific_mouse_entered() -> void:
	if $"Research Tab".visible == true:
		$"Research Tab/Scientific/Hover".play()

func _on_genome_mouse_entered() -> void:
	if $"Research Tab".visible == true:
		$"Research Tab/Genome/Hover".play()

func _on_specialized_mouse_entered() -> void:
	if $"Research Tab".visible == true:
		$"Research Tab/Specialized/Hover".play()

func _on_balanced_mouse_entered() -> void:
	if $"Research Tab".visible == true:
		$"Research Tab/Balanced/Hover".play()

func _on_conclusion_mouse_entered() -> void:
	if $"Research Tab".visible == true:
		$"Research Tab/Conclusion/Hover".play()

func _on_apples_upgrade_mouse_entered() -> void:
	if $"Library Tab/Apples Upgrade".disabled == false:
		$"Library Tab/Apples Upgrade/Hover".play()

func _on_oranges_upgrade_mouse_entered() -> void:
	if $"Library Tab/Oranges Upgrade".disabled == false:
		$"Library Tab/Oranges Upgrade/Hover".play()

func _on_banana_upgrade_mouse_entered() -> void:
	if $"Library Tab/Banana Upgrade".disabled == false:
		$"Library Tab/Banana Upgrade/Hover".play()

func _on_strawberries_upgrade_mouse_entered() -> void:
	if $"Library Tab/Strawberries Upgrade".disabled == false:
		$"Library Tab/Strawberries Upgrade/Hover".play()

func _on_blueberries_upgrade_mouse_entered() -> void:
	if $"Library Tab/Blueberries Upgrade".disabled == false:
		$"Library Tab/Blueberries Upgrade/Hover".play()

func _on_potato_upgrade_mouse_entered() -> void:
	if $"Library Tab/Potato Upgrade".disabled == false:
		$"Library Tab/Potato Upgrade/Hover".play()

func _on_tomato_upgrade_mouse_entered() -> void:
	if $"Library Tab/Tomato Upgrade".disabled == false:
		$"Library Tab/Tomato Upgrade/Hover".play()

func _on_carrot_upgrade_mouse_entered() -> void:
	if $"Library Tab/Carrot Upgrade".disabled == false:
		$"Library Tab/Carrot Upgrade/Hover".play()


func _on_cucumber_upgrade_mouse_entered() -> void:
	if $"Library Tab/Cucumber Upgrade".disabled == false:
		$"Library Tab/Cucumber Upgrade/Hover".play()


func _on_corn_upgrade_mouse_entered() -> void:
	if $"Library Tab/Corn Upgrade".disabled == false:
		$"Library Tab/Corn Upgrade/Hover".play()


func _on_apples_button_mouse_entered() -> void:
	if $"Labels/Apples Button".disabled == false:
		$"Labels/Apples Button/Hover".play()

func _on_oranges_button_mouse_entered() -> void:
	if $"Labels/Oranges Button".disabled == false:
		$"Labels/Oranges Button/Hover".play()


func _on_bananas_button_mouse_entered() -> void:
	if $"Labels/Bananas Button".disabled == false:
		$"Labels/Bananas Button/Hover".play()

func _on_strawberries_button_mouse_entered() -> void:
	if $"Labels/Strawberries Button".disabled == false:
		$"Labels/Strawberries Button/Hover".play()

func _on_blueberries_button_mouse_entered() -> void:
	if $"Labels/Blueberries Button".disabled == false:
		$"Labels/Blueberries Button/Hover".play()

func _on_potatos_button_mouse_entered() -> void:
	if $"Labels/Potatos Button".disabled == false:
		$"Labels/Potatos Button/Hover".play()

func _on_tomatos_button_mouse_entered() -> void:
	if $"Labels/Tomatos Button".disabled == false:
		$"Labels/Tomatos Button/Hover".play()

func _on_carrots_button_mouse_entered() -> void:
	if $"Labels/Carrots Button".disabled == false:
		$"Labels/Carrots Button/Hover".play()

func _on_cucumbers_button_mouse_entered() -> void:
	if $"Labels/Cucumbers Button".disabled == false:
		$"Labels/Cucumbers Button/Hover".play()

func _on_corn_button_mouse_entered() -> void:
	if $"Labels/Corn Button".disabled == false:
		$"Labels/Corn Button/Hover".play()
