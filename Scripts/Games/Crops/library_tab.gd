extends Node2D
var Upgrade_Tier = [1, 3, 5, 10, 15, 20, 25, 30]

var Apple_Upgrade_Iteration = 0
var Orange_Upgrade_Iteration = 0
var Banana_Upgrade_Iteration = 0
var Strawberry_Upgrade_Iteration = 0
var Blueberry_Upgrade_Iteration = 0
var Potato_Upgrade_Iteration = 0
var Tomato_Upgrade_Iteration = 0
var Carrot_Upgrade_Iteration = 0
var Cucumber_Upgrade_Iteration = 0
var Corn_Upgrade_Iteration = 0

func _ready():
	$"Apples Required".text = str("Apples Required: " + str(Upgrade_Tier[Apple_Upgrade_Iteration]))
	$Apples.text = str("Apples: " + str($"..".Apples_Researched))
	$"Oranges Required".text = str("Oranges Required: " + str(Upgrade_Tier[Orange_Upgrade_Iteration]))
	$Oranges.text = str("Oranges: " + str($"..".Oranges_Researched))
	$"Bananas Required".text = str("Bananas Required: " + str(Upgrade_Tier[Banana_Upgrade_Iteration]))
	$Bananas.text = str("Bananas: " + str($"..".Bananas_Researched))
	$"Strawberries Required".text = str("Strawberries Required: " + str(Upgrade_Tier[Strawberry_Upgrade_Iteration]))
	$Strawberries.text = str("Strawberries: " + str($"..".Strawberries_Researched))
	$"Blueberries Required".text = str("Blueberries Required: " + str(Upgrade_Tier[Blueberry_Upgrade_Iteration]))
	$Blueberries.text = str("Blueberries: " + str($"..".Blueberries_Researched))
	$"Potatos Required".text = str("Potatos Required: " + str(Upgrade_Tier[Potato_Upgrade_Iteration]))
	$Potatos.text = str("Potatos: " + str($"..".Potatoes_Researched))
	$"Tomatos Required".text = str("Tomatos Required: " + str(Upgrade_Tier[Tomato_Upgrade_Iteration]))
	$Tomatos.text = str("Tomatos: " + str($"..".Tomatos_Researched))
	$"Carrots Required".text = str("Carrots Required: " + str(Upgrade_Tier[Carrot_Upgrade_Iteration]))
	$Carrots.text = str("Carrots: " + str($"..".Carrots_Researched))
	$"Cucumbers Required".text = str("Cucumbers Required: " + str(Upgrade_Tier[Cucumber_Upgrade_Iteration]))
	$Cucumbers.text = str("Cucumbers: " + str($"..".Cucumbers_Researched))
	$"Corn Required".text = str("Corn Required: " + str(Upgrade_Tier[Corn_Upgrade_Iteration]))
	$Corn.text = str("Corn: " + str($"..".Corn_Researched))

func _process(_delta):
	if $"..".Apples_Researched >= Upgrade_Tier[Apple_Upgrade_Iteration]:
		if Apple_Upgrade_Iteration < 7:
			$"Apples Upgrade".disabled = false
		else:
			$"Apples Upgrade".disabled = true
	else:
		$"Apples Upgrade".disabled = true
	
	if $"..".Oranges_Researched >= Upgrade_Tier[Orange_Upgrade_Iteration]:
		if Orange_Upgrade_Iteration < 7:
			$"Oranges Upgrade".disabled = false
		else:
			$"Oranges Upgrade".disabled = true
	else:
		$"Oranges Upgrade".disabled = true
		
	if $"..".Bananas_Researched >= Upgrade_Tier[Banana_Upgrade_Iteration]:
		if Banana_Upgrade_Iteration < 7:
			$"Banana Upgrade".disabled = false
		else:
			$"Banana Upgrade".disabled = true
	else:
		$"Banana Upgrade".disabled = true
		
	if $"..".Strawberries_Researched >= Upgrade_Tier[Strawberry_Upgrade_Iteration]:
		if Strawberry_Upgrade_Iteration < 7:
			$"Strawberries Upgrade".disabled = false
		else:
			$"Strawberries Upgrade".disabled = true
	else:
		$"Strawberries Upgrade".disabled = true
		
	if $"..".Blueberries_Researched >= Upgrade_Tier[Blueberry_Upgrade_Iteration]:
		if Blueberry_Upgrade_Iteration < 7:
			$"Blueberries Upgrade".disabled = false
		else:
			$"Blueberries Upgrade".disabled = true
	else:
		$"Blueberries Upgrade".disabled = true
		
	if $"..".Potatoes_Researched >= Upgrade_Tier[Potato_Upgrade_Iteration]:
		if Potato_Upgrade_Iteration < 7:
			$"Potato Upgrade".disabled = false
		else:
			$"Potato Upgrade".disabled = true
	else:
		$"Potato Upgrade".disabled = true
		
	if $"..".Tomatos_Researched >= Upgrade_Tier[Tomato_Upgrade_Iteration]:
		if Tomato_Upgrade_Iteration < 7:
			$"Tomato Upgrade".disabled = false
		else:
			$"Tomato Upgrade".disabled = true
	else:
		$"Tomato Upgrade".disabled = true
		
	if $"..".Carrots_Researched >= Upgrade_Tier[Carrot_Upgrade_Iteration]:
		if Orange_Upgrade_Iteration < 7:
			$"Carrot Upgrade".disabled = false
		else:
			$"Carrot Upgrade".disabled = true
	else:
		$"Carrot Upgrade".disabled = true
		
	if $"..".Cucumbers_Researched >= Upgrade_Tier[Cucumber_Upgrade_Iteration]:
		if Cucumber_Upgrade_Iteration < 7:
			$"Cucumber Upgrade".disabled = false
		else:
			$"Cucumber Upgrade".disabled = true
	else:
		$"Cucumber Upgrade".disabled = true
		
	if $"..".Corn_Researched >= Upgrade_Tier[Corn_Upgrade_Iteration]:
		if Corn_Upgrade_Iteration < 7:
			$"Corn Upgrade".disabled = false
		else:
			$"Corn Upgrade".disabled = true
	else:
		$"Corn Upgrade".disabled = true

func _on_apples_upgrade_button_down() -> void:
	$"Apples Upgrade/Interact".play()
	if Apple_Upgrade_Iteration < 7:
		if Apple_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Apple_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Apple_Upgrade_Iteration]) / 2
			
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Apple_Upgrade_Iteration]) / 4
			$"Apples Required".text = str("Apples Required: " + str(Upgrade_Tier[Apple_Upgrade_Iteration + 1]))
			$"..".Apples_Researched -= Upgrade_Tier[Apple_Upgrade_Iteration]
			$Apples.text = str("Apples: " + str($"..".Apples_Researched))
		else:
			$"Apples Required".text = str("Apples Fully Researched")
			$"Apples Upgrade".disabled = true
			$Apples.text = str("N/A")
			$"Apples Upgrade".text = str("Done")
		Apple_Upgrade_Iteration += 1
		
		$"Apples Upgrade".disabled = true

func _on_oranges_upgrade_button_down() -> void:
	$"Oranges Upgrade/Interact".play()
	if Orange_Upgrade_Iteration < 7:
		if Orange_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Orange_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Orange_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Orange_Upgrade_Iteration]) / 4
			$"Oranges Required".text = str("Oranges Required: " + str(Upgrade_Tier[Orange_Upgrade_Iteration + 1]))
			$"..".Oranges_Researched -= Upgrade_Tier[Orange_Upgrade_Iteration]
			$Oranges.text = str("Oranges: " + str($"..".Oranges_Researched))
		else:
			$"Oranges Required".text = str("Oranges Fully Researched")
			$"Oranges Upgrade".disabled = true
			$Oranges.text = str("N/A")
			$"Oranges Upgrade".text = str("Done")
		Orange_Upgrade_Iteration += 1
		
		$"Oranges Upgrade".disabled = true

func _on_banana_upgrade_button_down() -> void:
	$"Banana Upgrade/Interact".play()
	if Banana_Upgrade_Iteration < 7:
		if Banana_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Banana_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Banana_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Banana_Upgrade_Iteration]) / 4
			$"Bananas Required".text = str("Bananas Required: " + str(Upgrade_Tier[Banana_Upgrade_Iteration + 1]))
			$"..".Bananas_Researched -= Upgrade_Tier[Banana_Upgrade_Iteration]
			$Bananas.text = str("Bananas: " + str($"..".Bananas_Researched))
		else:
			$"Bananas Required".text = str("Bananas Fully Researched")
			$"Banana Upgrade".disabled = true
			$Bananas.text = str("N/A")
			$"Banana Upgrade".text = str("Done")
		Banana_Upgrade_Iteration += 1
		
		$"Banana Upgrade".disabled = true

func _on_strawberries_upgrade_button_down() -> void:
	$"Strawberries Upgrade/Interact".play()
	if Strawberry_Upgrade_Iteration < 7:
		if Strawberry_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Strawberry_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Strawberry_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Strawberry_Upgrade_Iteration]) / 4
			$"Strawberries Required".text = str("Strawberries Required: " + str(Upgrade_Tier[Strawberry_Upgrade_Iteration + 1]))
			$"..".Strawberries_Researched -= Upgrade_Tier[Strawberry_Upgrade_Iteration]
			$Strawberries.text = str("Strawberries: " + str($"..".Strawberries_Researched))
		else:
			$"Strawberries Required".text = str("Strawberries Fully Researched")
			$"Strawberries Upgrade".disabled = true
			$Strawberries.text = str("N/A")
			$"Strawberries Upgrade".text = str("Done")
		Strawberry_Upgrade_Iteration += 1
		
		$"Strawberries Upgrade".disabled = true

func _on_blueberries_upgrade_button_down() -> void:
	$"Blueberries Upgrade/Interact".play()
	if Blueberry_Upgrade_Iteration < 7:
		if Blueberry_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Blueberry_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Blueberry_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Blueberry_Upgrade_Iteration]) / 4
			$"Blueberries Required".text = str("Blueberries Required: " + str(Upgrade_Tier[Blueberry_Upgrade_Iteration + 1]))
			$"..".Blueberries_Researched -= Upgrade_Tier[Blueberry_Upgrade_Iteration]
			$Blueberries.text = str("Blueberries: " + str($"..".Blueberries_Researched))
		else:
			$"Blueberries Required".text = str("Blueberries Fully Researched")
			$"Blueberries Upgrade".disabled = true
			$Blueberries.text = str("N/A")
			$"Blueberries Upgrade".text = str("Done")
		Blueberry_Upgrade_Iteration += 1
		
		$"Blueberries Upgrade".disabled = true

func _on_potato_upgrade_button_down() -> void:
	$"Potato Upgrade/Interact".play()
	if Potato_Upgrade_Iteration < 7:
		if Potato_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Potato_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Potato_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Potato_Upgrade_Iteration]) / 4
			$"Potatos Required".text = str("Potatos Required: " + str(Upgrade_Tier[Potato_Upgrade_Iteration + 1]))
			$"..".Potatoes_Researched -= Upgrade_Tier[Potato_Upgrade_Iteration]
			$Potatos.text = str("Potatos: " + str($"..".Potatoes_Researched))
		else:
			$"Potatos Required".text = str("Potatos Fully Researched")
			$"Potato Upgrade".disabled = true
			$Potatos.text = str("N/A")
			$"Potato Upgrade".text = str("Done")
		Potato_Upgrade_Iteration += 1
		
		$"Potato Upgrade".disabled = true

func _on_tomato_upgrade_button_down() -> void:
	$"Tomato Upgrade/Interact".play()
	if Tomato_Upgrade_Iteration < 7:
		if Tomato_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Tomato_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Tomato_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Tomato_Upgrade_Iteration]) / 4
			$"Tomatos Required".text = str("Tomatos Required: " + str(Upgrade_Tier[Tomato_Upgrade_Iteration + 1]))
			$"..".Tomatos_Researched -= Upgrade_Tier[Tomato_Upgrade_Iteration]
			$Tomatos.text = str("Tomatos: " + str($"..".Tomatos_Researched))
		else:
			$"Tomato Required".text = str("Tomatos Fully Researched")
			$"Tomato Upgrade".disabled = true
			$Tomatos.text = str("N/A")
			$"Tomato Upgrade".text = str("Done")
		Tomato_Upgrade_Iteration += 1
		
		$"Tomato Upgrade".disabled = true

func _on_carrot_upgrade_button_down() -> void:
	$"Carrot Upgrade/Interact".play()
	if Carrot_Upgrade_Iteration < 7:
		if Carrot_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Carrot_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Carrot_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Carrot_Upgrade_Iteration]) / 4
			$"Carrots Required".text = str("Carrots Required: " + str(Upgrade_Tier[Carrot_Upgrade_Iteration + 1]))
			$"..".Carrots_Researched -= Upgrade_Tier[Carrot_Upgrade_Iteration]
			$Carrots.text = str("Carrots: " + str($"..".Carrots_Researched))
		else:
			$"Carrots Required".text = str("Carrots Fully Researched")
			$"Carrot Upgrade".disabled = true
			$Carrots.text = str("N/A")
			$"Carrot Upgrade".text = str("Done")
		Carrot_Upgrade_Iteration += 1
		
		$"Carrot Upgrade".disabled = true

func _on_cucumber_upgrade_button_down() -> void:
	$"Cucumber Upgrade/Interact".play()
	if Cucumber_Upgrade_Iteration < 7:
		if Cucumber_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Cucumber_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Cucumber_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Cucumber_Upgrade_Iteration]) / 4
			$"Cucumbers Required".text = str("Cucumbers Required: " + str(Upgrade_Tier[Cucumber_Upgrade_Iteration + 1]))
			$"..".Cucumbers_Researched -= Upgrade_Tier[Cucumber_Upgrade_Iteration]
			$Cucumbers.text = str("Cucumbers: " + str($"..".Cucumbers_Researched))
		else:
			$"Cucumbers Required".text = str("Cucumbers Fully Researched")
			$"Cucumber Upgrade".disabled = true
			$Cucumbers.text = str("N/A")
			$"Cucumber Upgrade".text = str("Done")
		Cucumber_Upgrade_Iteration += 1
		
		$"Cucumber Upgrade".disabled = true

func _on_corn_upgrade_button_down() -> void:
	$"Corn Upgrade/Interact".play()
	if Corn_Upgrade_Iteration < 7:
		if Corn_Upgrade_Iteration < 6:
			$"../..".Scientific_Research_Points += float(Upgrade_Tier[Corn_Upgrade_Iteration])
			$"../..".Genome_Research_Points += float(Upgrade_Tier[Corn_Upgrade_Iteration]) / 2
			$"../..".Specialized_Research_Points += float(Upgrade_Tier[Corn_Upgrade_Iteration]) / 4
			$"Corn Required".text = str("Corn Required: " + str(Upgrade_Tier[Corn_Upgrade_Iteration + 1]))
			$"..".Corn_Researched -= Upgrade_Tier[Corn_Upgrade_Iteration]
			$Corn.text = str("Corn: " + str($"..".Cucumbers_Researched))
		else:
			$"Corn Required".text = str("Corn Fully Researched")
			$"Corn Upgrade".disabled = true
			$Corn.text = str("N/A")
			$"Corn Upgrade".text = str("Done")
		Corn_Upgrade_Iteration += 1
		
		$"Corn Upgrade".disabled = true
