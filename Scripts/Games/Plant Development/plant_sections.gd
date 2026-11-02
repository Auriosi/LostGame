extends Node2D

var iteration = 0

var evolve = true
var evolve_chance = 100
var evolve_goal = 0

var healthy = true
var survival_chance = 100
var survival_goal = 0

var reset = false

var heat = 1
var cold = 1
var toxic = 1
var radioactive = 1

var plant_chance = 1

var Crop = 0

@export var stage = ["Stage 1", 0]

@export var Expansion_Level = 0

func _on_sequence_button_pressed() -> void:
	
	_SurviveChance()
	if healthy == true:
		_EvolveChance()

func _StageChange():
	if stage[0] == "Stage 1":
		$PlantStage.texture = ""
	elif stage[0] == "Stage 2":
		$PlantStage.texture = preload("res://Sprites/Plant Development/Plant Stage_1.png")
	elif stage[0] == "Stage 3":
		$PlantStage.texture = preload("res://Sprites/Plant Development/Plant Stage_2.png")
	elif stage[0] == "Stage 4":
		$PlantStage.texture = preload("res://Sprites/Plant Development/Plant Stage_3.png")
	elif stage[0] == "Stage 5":
		$PlantStage.texture = preload("res://Sprites/Plant Development/Plant Stage_4.png")
	elif stage[0] == "Stage 6":
		$PlantStage.texture = preload("res://Sprites/Plant Development/Plant Stage_5.png")

func _EvolveChance():
	if $"Soil".visible == true:
		if evolve_chance >= evolve_goal:
			evolve = true
		if evolve == true:
			if stage[0] == "Stage 1":
				stage = ["Stage 2", 0]
				_StageChange()
			elif stage[0] == "Stage 2":
				stage = ["Stage 3", 1]
				_StageChange()
			elif stage[0] == "Stage 3":
				stage = ["Stage 4", 2]
				_StageChange()
			elif stage[0] == "Stage 4":
				stage = ["Stage 5", 3]
				_StageChange()
			elif stage[0] == "Stage 5":
				stage = ["Stage 6", 4]
				_StageChange()
		evolve = false
		evolve_chance = 100 - ( (stage[1] * (50 - ($"../../Sequencing Game".Growth / 100))))
		evolve_goal = randi() % 100 + 1

func _SurviveChance():
	if $"Soil".visible == true:
		if healthy == true:
			if survival_chance >= survival_goal:
				healthy = true
				plant_chance = randi() % 100 + 1 
				_crop_Gain()
				$PlantStage.modulate = Color(1.0, 1.0, 1.0, 1.0)
				$"../..".Scientific_Research_Points += float(($"..".SP_Multiplier * stage[1]) * (1 + float($"../../Sequencing Game".Yield / 50) ) ) * float(cold) / 125
				$"../..".Scientific_Research_Points += float(iteration) / 100 * $"..".SP_Flat_Gain * float(cold) / 125
				$"../..".Scientific_Research_Points +=  $"..".SP_Flat_Gain * float(cold) / 125
				if $"..".GP_Flat_Gain > 0:
					$"../..".Genome_Research_Points += float(($"..".GP_Multiplier * stage[1]) * (1 + float($"../../Sequencing Game".Yield / 50) ) ) * float(toxic) / 250
				$"../..".Genome_Research_Points += float(iteration) / 100 * $"..".GP_Flat_Gain * float(toxic) / 250
				$"../..".Genome_Research_Points +=  $"..".GP_Flat_Gain * float(toxic) / 250
				if $"..".XP_Flat_Gain > 0:
					$"../..".Specialized_Research_Points += float(($"..".XP_Multiplier * stage[1]) * (1 + float($"../../Sequencing Game".Yield / 50) ) ) * float(radioactive) / 500
				$"../..".Specialized_Research_Points += float(iteration) / 100 * $"..".XP_Flat_Gain * float(radioactive) / 500
				$"../..".Specialized_Research_Points +=  $"..".XP_Flat_Gain * float(radioactive) / 500
			else:
				healthy = false
				$"../..".Scientific_Research_Points += float(($"..".SP_Multiplier * stage[1]) * (1 + float($"../../Sequencing Game".Yield / 50) ) ) * float(cold) / 125
				$"../..".Scientific_Research_Points += float(iteration) / 100 * $"..".SP_Flat_Gain * float(cold) / 125
				$"../..".Scientific_Research_Points +=  $"..".SP_Flat_Gain * float(cold) / 125
				if $"..".GP_Flat_Gain > 0:
					$"../..".Genome_Research_Points += float(($"..".GP_Multiplier * stage[1]) * (1 + float($"../../Sequencing Game".Yield / 50) ) ) * float(toxic) / 250
				$"../..".Genome_Research_Points += float(iteration) / 100 * $"..".GP_Flat_Gain * float(toxic) / 250
				$"../..".Genome_Research_Points +=  $"..".GP_Flat_Gain * float(toxic) / 250
				if $"..".XP_Flat_Gain > 0:
					$"../..".Specialized_Research_Points += float(($"..".XP_Multiplier * stage[1]) * (1 + float($"../../Sequencing Game".Yield / 50) ) ) * float(radioactive) / 500
				$"../..".Specialized_Research_Points += float(iteration) / 100 * $"..".XP_Flat_Gain * float(radioactive) / 500
				$"../..".Specialized_Research_Points +=  $"..".XP_Flat_Gain * float(radioactive) / 500
				
				# Add crops
				
				
				
				$PlantStage.modulate = Color(0.495, 0.274, 0.0, 1.0)
			if heat > 1:
				survival_chance = 100 - (iteration * float(25 - (($"../../Sequencing Game".Longevity / 1000) + ($"../../Sequencing Game".Survivability / 250))))
			else:
				survival_chance = 100 - (iteration * float(25 - $"../../Sequencing Game".Longevity / 200) )
			survival_goal = randi() % 100 + 1
			iteration += 1
		else:
			$PlantStage.texture = null

func _process(_delta):
	if reset == true:
		healthy = true
		$PlantStage.texture = null
		reset = false
	
	if Expansion_Level >= 1:
		if $"..".Expansion_Level >= 1:
			$"Soil".visible = true
			$"PlantStage".visible = true
		else:
			$"Soil".visible = false
			$"PlantStage".visible = false
	if Expansion_Level >= 2:
		if $"..".Expansion_Level >= 2:
			$"Soil".visible = true
			$"PlantStage".visible = true
		else:
			$"Soil".visible = false
			$"PlantStage".visible = false
	if Expansion_Level >= 3:
		if $"..".Expansion_Level >= 3:
			$"Soil".visible = true
			$"PlantStage".visible = true
		else:
			$"Soil".visible = false
			$"PlantStage".visible = false
	if Expansion_Level >= 4:
		if $"..".Expansion_Level >= 4:
			$"Soil".visible = true
			$"PlantStage".visible = true
		else:
			$"Soil".visible = false
			$"PlantStage".visible = false
	if Expansion_Level == 5:
		if $"..".Expansion_Level == 5:
			$"Soil".visible = true
			$"PlantStage".visible = true
		else:
			$"Soil".visible = false
			$"PlantStage".visible = false

func _modulation(index):
	if index == 0:
		modulate = Color(1.0, 1.0, 1.0, 1.0)
		heat = 1
		cold = 1
		toxic = 1
		radioactive = 1
	if index == 1:
		modulate = Color(1.0, 0.795, 0.598, 1.0)
		heat = 2
		cold = 1
		toxic = 1
		radioactive = 1
	if index == 2:
		modulate = Color(0.706, 1.0, 1.0, 1.0)
		heat = 1
		cold = 1.5
		toxic = 1
		radioactive = 1
	if index == 3:
		modulate = Color(0.603, 1.0, 0.717, 1.0)
		heat = 1
		cold = 1
		toxic = 1.5
		radioactive = 1
	if index == 4:
		modulate = Color(0.99, 1.0, 0.605, 1.0)
		heat = 1
		cold = 1
		toxic = 1
		radioactive = 1.5

func _on_reset_button_pressed() -> void:
	if healthy == true:
		pass

func _crop_Gain():
	var rand_1 = randi() % 8
	if rand_1 == 0:
		_crop_Growth()
	var rand_Bonus_Crop = randi() % 32
	if rand_Bonus_Crop == 0 && heat == 2:
		_crop_Growth()

func _crop_Growth():
	#for i in range (0, Crop):
	var rand_Crop = randi() % 10
	if plant_chance < (float($"../../Sequencing Game".Yield / (float(50)))):
		$"../..".Crops += 1
		if rand_Crop == 0:
			$"../..".Apples += 1
		if rand_Crop == 1:
			$"../..".Oranges += 1
		if rand_Crop == 2:
			$"../..".Bananas += 1
		if rand_Crop == 3:
			$"../..".Strawberries += 1
		if rand_Crop == 4:
			$"../..".Blueberries += 1
		if rand_Crop == 5:
			$"../..".Potatos += 1
		if rand_Crop == 6:
			$"../..".Tomatos += 1
		if rand_Crop == 7:
			$"../..".Carrots += 1
		if rand_Crop == 8:
			$"../..".Cucumbers += 1
		if rand_Crop == 9:
			$"../..".Corn += 1
	
