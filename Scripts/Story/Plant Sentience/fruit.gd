extends Node2D

var fruit = 0

var index = 0

var fruit_close = false

var Selectable = true

var Collision_Layer = 0

var Mouse_In = false

var growth = 1
var fade = 0.5

@onready var Main = $".."
#const X_Ray = preload($"User Interface/X_Ray")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fruit = randi() % 3
	if fruit == 0:
		$"Fruit Image".texture = load("res://Sprites/Story/Plant Sentience/Harvest Game/Plant Sentience Apple.png")
		$Apple_Area2D.visible = true
		$Orange_Area2D.queue_free()
		$Banana_Area2D.queue_free()
	if fruit == 1:
		$"Fruit Image".texture = load("res://Sprites/Story/Plant Sentience/Harvest Game/Plant Sentience Orange.png")
		$Orange_Area2D.visible = true
		$Apple_Area2D.queue_free()
		$Banana_Area2D.queue_free()
	if fruit == 2:
		$"Fruit Image".texture = load("res://Sprites/Story/Plant Sentience/Harvest Game/Plant Sentience Banana.png")
		$Banana_Area2D.visible = true
		$Apple_Area2D.queue_free()
		$Orange_Area2D.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	#if $"User Interface/X_Ray".visible == true:
	#	visible = false
	#else: 
	#	visible = true
	if fruit == 0:
		if $Apple_Area2D.get_collision_layer_value(4) == true:
			Collision_Layer = 4
		if $Apple_Area2D.get_collision_layer_value(5) == true:
			Collision_Layer = 5
		if $Apple_Area2D.get_collision_layer_value(6) == true:
			Collision_Layer = 6
		if $Apple_Area2D.get_collision_layer_value(7) == true:
			Collision_Layer = 7
		if $Apple_Area2D.get_collision_layer_value(8) == true:
			Collision_Layer = 8
		if $Apple_Area2D.get_collision_layer_value(9) == true:
			Collision_Layer = 9
		if $Apple_Area2D.get_collision_layer_value(10) == true:
			Collision_Layer = 10
		$Apple_Area2D.set_collision_mask_value(index, true)
		$Apple_Area2D.set_collision_layer_value(index, true)
		if $"../Mouse Tracker".value == Collision_Layer:
			Selectable = true
		else:
			Selectable = false
		if Mouse_In && Selectable && Main.Button_Lock == false:
			$"Apple Outline".visible = true
			if Input.is_action_just_pressed("Left Click"):
				$"..".Apples_Clicked += 1
				$"Fruit Image".visible = false
			if $"Fruit Image".visible == false:
				$"Apple Outline".scale = Vector2(growth,growth)
				growth += 1 * delta
				fade -= 4 * delta
				$"Apple Outline".modulate = Color(1,1,1,fade/1)
		else:
			$"Apple Outline".visible = false
		if fade <= 0:
			queue_free()
	if fruit == 1:
		if $Orange_Area2D.get_collision_layer_value(4) == true:
			Collision_Layer = 4
		if $Orange_Area2D.get_collision_layer_value(5) == true:
			Collision_Layer = 5
		if $Orange_Area2D.get_collision_layer_value(6) == true:
			Collision_Layer = 6
		if $Orange_Area2D.get_collision_layer_value(7) == true:
			Collision_Layer = 7
		if $Orange_Area2D.get_collision_layer_value(8) == true:
			Collision_Layer = 8
		if $Orange_Area2D.get_collision_layer_value(9) == true:
			Collision_Layer = 9
		if $Orange_Area2D.get_collision_layer_value(10) == true:
			Collision_Layer = 10
		$Orange_Area2D.set_collision_mask_value(index, true) 
		$Orange_Area2D.set_collision_layer_value(index, true)
		
		if $"../Mouse Tracker".value == Collision_Layer:
			Selectable = true
		else:
			Selectable = false
		if Mouse_In && Selectable && Main.Button_Lock == false:
			$"Orange Outline".visible = true
			if Input.is_action_just_pressed("Left Click"):
				$"..".Oranges_Clicked += 1
				$"Fruit Image".visible = false
			if $"Fruit Image".visible == false:
				$"Orange Outline".scale = Vector2(growth,growth)
				growth += 1 * delta
				fade -= 4 * delta
				$"Orange Outline".modulate = Color(1,1,1,fade/1)
		else:
			$"Orange Outline".visible = false
		if fade <= 0:
			queue_free()
	if fruit == 2:
		if $Banana_Area2D.get_collision_layer_value(4) == true:
			Collision_Layer = 4
		if $Banana_Area2D.get_collision_layer_value(5) == true:
			Collision_Layer = 5
		if $Banana_Area2D.get_collision_layer_value(6) == true:
			Collision_Layer = 6
		if $Banana_Area2D.get_collision_layer_value(7) == true:
			Collision_Layer = 7
		if $Banana_Area2D.get_collision_layer_value(8) == true:
			Collision_Layer = 8
		if $Banana_Area2D.get_collision_layer_value(9) == true:
			Collision_Layer = 9
		if $Banana_Area2D.get_collision_layer_value(10) == true:
			Collision_Layer = 10
		$Banana_Area2D.set_collision_mask_value(index, true)
		$Banana_Area2D.set_collision_layer_value(index, true)
		if $"../Mouse Tracker".value == Collision_Layer:
			Selectable = true
		else:
			Selectable = false
		if Mouse_In && Selectable && Main.Button_Lock == false:
			$"Banana Outline".visible = true
			if Input.is_action_just_pressed("Left Click"):
				$"..".Bananas_Clicked += 1
				$"Fruit Image".visible = false
			if $"Fruit Image".visible == false:
				$"Banana Outline".scale = Vector2(growth,growth)
				growth += 1 * delta
				fade -= 4 * delta
				$"Banana Outline".modulate = Color(1,1,1,fade/1)
		else:
			$"Banana Outline".visible = false
		if fade <= 0:
			queue_free()
func _on_apple_area_2d_mouse_entered() -> void:
	Mouse_In = true

func _on_apple_area_2d_mouse_exited() -> void:
	$"Apple Outline".visible = false

func _on_orange_area_2d_mouse_entered() -> void:
	Mouse_In = true

func _on_orange_area_2d_mouse_exited() -> void:
	$"Orange Outline".visible = false

func _on_banana_area_2d_mouse_entered() -> void:
	Mouse_In = true

func _on_banana_area_2d_mouse_exited() -> void:
	$"Banana Outline".visible = false
