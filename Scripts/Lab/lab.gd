# Fix Settings Menu

extends Node2D

@onready var Camera = $Camera2D
@onready var Stat_Research_tree = $"Research Tree/CanvasLayer/Stats"
@onready var Scientific_Research_Tree = $"Research Tree/Scientific Research"
@onready var Genome_Research_Tree = $"Research Tree/Genome Research"

const SPEED = 100
var SPEED_Smoothness = 0

var Button_Lock = false

var Scientific_Research_Points = 0 
var Genome_Research_Points = 0
var Specialized_Research_Points = 0
var Crops = 0

var Longevity = 0
var Growth = 0
var Yield = 0
var Survivability = 0

var Apples = 0
var Oranges = 0
var Bananas = 0
var Strawberries = 0
var Blueberries = 0
var Potatos = 0
var Tomatos = 0
var Carrots = 0
var Cucumbers = 0
var Corn = 0

var Scientific_Tree_Position_X_Max = 330
var Scientific_Tree_Position_X_Min = 330
var Scientific_Tree_Position_Y_Max = 14
var Scientific_Tree_Position_Y_Min = 14

var Genome_Tree_Position_X_Max = 500
var Genome_Tree_Position_X_Min = -500
var Genome_Tree_Position_Y_Max = 0
var Genome_Tree_Position_Y_Min = 0

var Specalized_Tree_Position_X_Max = 330
var Specalized_Tree_Position_X_Min = 330
var Specalized_Tree_Position_Y_Max = 14
var Specalized_Tree_Position_Y_Min = 14

var Stats_Clickable = false
var Scientific_Clickable = false
var Genome_Clickable = false
var Specialized_Clickable = false

var Stats_Active = true
var Scientific_Active = false
var Genome_Active = false
var Specialized_Active = false

var Scroll_Hault = false

var First_Entry = true

var Stats_Selected = false
var Scientific_Selected = false
var Genome_Selected = false
var Specialized_Selected = false

func _ready():
	$"Air Conditioning".play()
	$"User Interface/Music".play()

func _process(delta):
	if Stats_Selected == true && Stats_Active == true:
		if Input.is_action_pressed("Left Click"):
			Stats_Selected = false
			Scientific_Selected = false
			Genome_Selected = false
			Specialized_Selected = false
			$"User Interface/Research Tree UI/Stats Area2D/Click".play()

	if Scientific_Selected == true && Scientific_Active == true:
		if Input.is_action_pressed("Left Click"):
			Stats_Selected = false
			Scientific_Selected = false
			Genome_Selected = false
			Specialized_Selected = false
			$"User Interface/Research Tree UI/Scientific Area2D/Click".play()

	if Genome_Selected == true && Genome_Active == true:
		if Input.is_action_pressed("Left Click"):
			Stats_Selected = false
			Scientific_Selected = false
			Genome_Selected = false
			Specialized_Selected = false
			$"User Interface/Research Tree UI/Genome Area2D/Click".play()

	if Specialized_Selected == true && Specialized_Active == true:
		if Input.is_action_pressed("Left Click"):
			Stats_Selected = false
			Scientific_Selected = false
			Genome_Selected = false
			Specialized_Selected = false
			$"User Interface/Research Tree UI/Specialized Area2D/Click".play()
	
	if Input.is_action_just_pressed("Open Menu") && Button_Lock == false:
		if $"User Interface/Menu UI/Node2D/Settings Menu".visible == false && $"User Interface/Menu UI/Node2D/Load Menu".visible == false:
			if $"User Interface/Menu UI/Node2D/Menu".visible == false:
				$"User Interface/Menu UI".visible = true
				$"User Interface/Menu UI/Node2D/Menu".visible = true
				Scroll_Hault = false
			elif $"User Interface/Menu UI/Node2D/Menu".visible == true:
				$"User Interface/Menu UI".visible = false
				$"User Interface/Menu UI/Node2D/Menu".visible = false
				Scroll_Hault = true
		else:
			$"User Interface/Menu UI/Node2D/Settings Menu".visible = false
			$"User Interface/Menu UI/Node2D/Load Menu".visible = false
			$"User Interface/Menu UI".visible = true
			$"User Interface/Menu UI/Node2D/Menu".visible = true
			
			Scroll_Hault = false
	
	$"User Interface/Research Tree UI/Scientific Points".text = str(Scientific_Research_Points)
	$"User Interface/Research Tree UI/Genome Points".text = str(Genome_Research_Points)
	$"User Interface/Research Tree UI/Specialized Points".text = str(Specialized_Research_Points)
	
	$"User Interface/Basic UI/Bottom Left/Scientific Points".text = str(Scientific_Research_Points)
	$"User Interface/Basic UI/Bottom Left/Genome Points".text = str(Genome_Research_Points)
	$"User Interface/Basic UI/Bottom Left/Specialized Points".text = str(Specialized_Research_Points)
	$"User Interface/Basic UI/Bottom Left/Crops".text = str(Crops)
	$"User Interface/Basic UI/Bottom Right/Completed Sequences".text = str($"Sequencing Game".Completed_Sequences)
	_Camera_Movement(delta)
	_Center_UI()
	if $"Sequencing Game".visible == true or $"Plant Development Game".visible == true or $"Crop Diagnosis".visible or $"Research Tree".visible == true or $"User Interface/Basic UI/Tutorial Tab/Node2D".visible == true:
		Button_Lock = true
		
	else:
		Button_Lock = false

func _Camera_Movement(delta):
	if $"Research Tree".visible == false:
		$"User Interface/Research Node UI".visible = false
	if $"Research Tree".visible == false && Button_Lock == false && $"User Interface/Menu UI".visible == false:
		$"User Interface/Research Tree UI".visible = false
		$"User Interface/Basic UI".visible = true
		
		$Camera2D.zoom = Vector2(6.8,6.8)
		SPEED_Smoothness = (Camera.position.x - get_global_mouse_position().x) / 80
		if (Camera.position.x - get_global_mouse_position().x) < -100:
			if Camera.position.x < 100:
				Camera.position.x -= SPEED * delta * SPEED_Smoothness
				$"Hallway Node".position.x -= float(SPEED/1.5) * delta * SPEED_Smoothness
			else:
				Camera.position.x = 100
		if (Camera.position.x - get_global_mouse_position().x) > 100:
			if Camera.position.x > -100:
				Camera.position.x -= SPEED * delta * SPEED_Smoothness
				$"Hallway Node".position.x -= float(SPEED/1.5) * delta * SPEED_Smoothness
			else:
				Camera.position.x = -100
	if $"Research Tree".visible == true:
		$"User Interface/Research Tree UI".visible = true
		$"User Interface/Basic UI".visible = false
		
		
	if Scientific_Active == true:
		if $"Research Tree".visible == true:
			$"User Interface/Research Node UI".visible = true
		if Input.is_action_just_released("Zoom In") && Scroll_Hault == false:
			if $Camera2D.zoom < Vector2(8,8):
				$Camera2D.zoom += Vector2(0.25,0.25)
		if Input.is_action_just_released("Zoom Out") && Scroll_Hault == false:
			if $Camera2D.zoom > Vector2(4,4):
				$Camera2D.zoom -= Vector2(0.25,0.25)
		#var SPEED_Smoothness_x = (Camera.position.x - get_global_mouse_position().x) / 200
		#var SPEED_Smoothness_y = (Camera.position.y - get_global_mouse_position().y) / 200
		
		#if get_global_mouse_position().x - Camera.position.x > 100 && Scientific_Research_Tree.position.x > Scientific_Tree_Position_X_Min:
			#Scientific_Research_Tree.position.x += 2 * SPEED * delta * SPEED_Smoothness_x
#
		#if get_global_mouse_position().x - Camera.position.x < -100 && Scientific_Research_Tree.position.x < Scientific_Tree_Position_X_Max:
			#Scientific_Research_Tree.position.x += 2 * SPEED * delta * SPEED_Smoothness_x
#
		#if get_global_mouse_position().y - Camera.position.y > 50 && Scientific_Research_Tree.position.y > Scientific_Tree_Position_Y_Min:
			#Scientific_Research_Tree.position.y += 2 * SPEED * delta * SPEED_Smoothness_y
#
		#if get_global_mouse_position().y - Camera.position.y < -50 && Scientific_Research_Tree.position.y < Scientific_Tree_Position_Y_Max:
			#Scientific_Research_Tree.position.y += 2 * SPEED * delta * SPEED_Smoothness_y

		if Input.is_action_pressed("Move Right"):
			Scientific_Research_Tree.position.x -= 2 * SPEED * delta
		
		if Input.is_action_pressed("Move Left"):
			Scientific_Research_Tree.position.x += 2 * SPEED * delta
		
		if Input.is_action_pressed("Move Up"):
			Scientific_Research_Tree.position.y += 2 * SPEED * delta
		
		if Input.is_action_pressed("Move Down"):
			Scientific_Research_Tree.position.y -= 2 * SPEED * delta

		if Scientific_Research_Tree.position.x > Scientific_Tree_Position_X_Max:
			Scientific_Research_Tree.position.x = Scientific_Tree_Position_X_Max
		if Scientific_Research_Tree.position.x < Scientific_Tree_Position_X_Min:
			Scientific_Research_Tree.position.x = Scientific_Tree_Position_X_Min
		if Scientific_Research_Tree.position.y > Scientific_Tree_Position_Y_Max:
			Scientific_Research_Tree.position.y = Scientific_Tree_Position_Y_Max
		if Scientific_Research_Tree.position.y < Scientific_Tree_Position_Y_Min:
			Scientific_Research_Tree.position.y = Scientific_Tree_Position_Y_Min

	if Genome_Active == true:
		if $"Research Tree".visible == true:
			$"User Interface/Research Node UI".visible = true
		if Input.is_action_just_released("Zoom In") && Scroll_Hault == false:
			if $Camera2D.zoom < Vector2(8,8):
				$Camera2D.zoom += Vector2(0.25,0.25)
		if Input.is_action_just_released("Zoom Out") && Scroll_Hault == false:
			if $Camera2D.zoom > Vector2(4,4):
				$Camera2D.zoom -= Vector2(0.25,0.25)
		#var SPEED_Smoothness_x = (Camera.position.x - get_global_mouse_position().x) / 200
		#var SPEED_Smoothness_y = (Camera.position.y - get_global_mouse_position().y) / 200

		#if get_global_mouse_position().x - Camera.position.x > 100 && Genome_Research_Tree.position.x > Genome_Tree_Position_X_Min:
			#Genome_Research_Tree.position.x += 2 * SPEED * delta * SPEED_Smoothness_x
#
		#if get_global_mouse_position().x - Camera.position.x < -100 && Genome_Research_Tree.position.x < Genome_Tree_Position_X_Max:
			#Genome_Research_Tree.position.x += 2 * SPEED * delta * SPEED_Smoothness_x
#
		#if get_global_mouse_position().y - Camera.position.y > 50 && Genome_Research_Tree.position.y > Genome_Tree_Position_Y_Min:
			#Genome_Research_Tree.position.y += 2 * SPEED * delta * SPEED_Smoothness_y
#
		#if get_global_mouse_position().y - Camera.position.y < -50 && Genome_Research_Tree.position.y < Genome_Tree_Position_Y_Max:
		#	Genome_Research_Tree.position.y += 2 * SPEED * delta * SPEED_Smoothness_y

		if Input.is_action_pressed("Move Right"):
			Genome_Research_Tree.position.x -= 2 * SPEED * delta
		
		if Input.is_action_pressed("Move Left"):
			Genome_Research_Tree.position.x += 2 * SPEED * delta
		
		if Input.is_action_pressed("Move Up"):
			Genome_Research_Tree.position.y += 2 * SPEED * delta
		
		if Input.is_action_pressed("Move Down"):
			Genome_Research_Tree.position.y -= 2 * SPEED * delta

		if Genome_Research_Tree.position.x > Genome_Tree_Position_X_Max:
			Genome_Research_Tree.position.x = Genome_Tree_Position_X_Max
		if Genome_Research_Tree.position.x < Genome_Tree_Position_X_Min:
			Genome_Research_Tree.position.x = Genome_Tree_Position_X_Min
		if Genome_Research_Tree.position.y > Genome_Tree_Position_Y_Max:
			Genome_Research_Tree.position.y = Genome_Tree_Position_Y_Max
		if Genome_Research_Tree.position.y < Genome_Tree_Position_Y_Min:
			Genome_Research_Tree.position.y = Genome_Tree_Position_Y_Min

	if Stats_Active == true:
		$"User Interface/Research Node UI".visible = false
		$"Research Tree/Scientific Research".visible = false
		
	if Stats_Clickable == true:
		if Input.is_action_just_pressed("Left Click"):
			Stats_Active = true
			Scientific_Active = false
			Genome_Active = false
			Specialized_Active = false
			$"Research Tree/Scientific Research".visible = false
			$"Research Tree/CanvasLayer".visible = true
			$"Research Tree/Genome Research".visible = false
			$"User Interface/Research Tree UI/Stats Tab".texture = preload("res://Sprites/Reserach Tree/Stats Tab (Selected).png")
			$"User Interface/Research Tree UI/Scientific Research Tab".texture = preload("res://Sprites/Reserach Tree/Scientific Research Tree Tab.png")
			$"User Interface/Research Tree UI/Genome Research Tab".texture = preload("res://Sprites/Reserach Tree/Genome Research Tree Tab.png")
			$"User Interface/Research Tree UI/Specialized Research Tab".texture = preload("res://Sprites/Reserach Tree/Specialized Research Tree Tab.png")
	if Scientific_Clickable == true:
		if Input.is_action_just_pressed("Left Click"):
			Stats_Active = false
			Scientific_Active = true
			Genome_Active = false
			Specialized_Active = false
			$"Research Tree/Scientific Research".visible = true
			$"Research Tree/Genome Research".visible = false
			$"Research Tree/CanvasLayer".visible = false
			$"User Interface/Research Tree UI/Stats Tab".texture = preload("res://Sprites/Reserach Tree/Stats Tab.png")
			$"User Interface/Research Tree UI/Scientific Research Tab".texture = preload("res://Sprites/Reserach Tree/Scientific Research Tree Tab (Selected).png")
			$"User Interface/Research Tree UI/Genome Research Tab".texture = preload("res://Sprites/Reserach Tree/Genome Research Tree Tab.png")
			$"User Interface/Research Tree UI/Specialized Research Tab".texture = preload("res://Sprites/Reserach Tree/Specialized Research Tree Tab.png")
	if Genome_Clickable == true:
		if Input.is_action_just_pressed("Left Click"):
			Stats_Active = false
			Scientific_Active = false
			Genome_Active = true
			Specialized_Active = false
			$"Research Tree/Scientific Research".visible = false
			$"Research Tree/Genome Research".visible = true
			$"Research Tree/CanvasLayer".visible = false
			$"User Interface/Research Tree UI/Stats Tab".texture = preload("res://Sprites/Reserach Tree/Stats Tab.png")
			$"User Interface/Research Tree UI/Scientific Research Tab".texture = preload("res://Sprites/Reserach Tree/Scientific Research Tree Tab.png")
			$"User Interface/Research Tree UI/Genome Research Tab".texture = preload("res://Sprites/Reserach Tree/Genome Research Tree Tab (Selected).png")
			$"User Interface/Research Tree UI/Specialized Research Tab".texture = preload("res://Sprites/Reserach Tree/Specialized Research Tree Tab.png")
	if Specialized_Clickable == true:
		if Input.is_action_just_pressed("Left Click"):
			Stats_Active = false
			Scientific_Active = false
			Genome_Active = false
			Specialized_Active = true
			$"Research Tree/Scientific Research".visible = false
			$"Research Tree/CanvasLayer".visible = false
			$"Research Tree/Genome Research".visible = false
			$"User Interface/Research Tree UI/Stats Tab".texture = preload("res://Sprites/Reserach Tree/Stats Tab.png")
			$"User Interface/Research Tree UI/Scientific Research Tab".texture = preload("res://Sprites/Reserach Tree/Scientific Research Tree Tab.png")
			$"User Interface/Research Tree UI/Genome Research Tab".texture = preload("res://Sprites/Reserach Tree/Genome Research Tree Tab.png")
			$"User Interface/Research Tree UI/Specialized Research Tab".texture = preload("res://Sprites/Reserach Tree/Specialized Research Tree Tab Selected.png")
			
func _Center_UI():
	$"Sequencing Game".position = Camera.position + Vector2(-2,0)
	$"Plant Development Game".position = Camera.position
	$"Research Tree".position = Camera.position
	$"Crop Diagnosis".position = Camera.position

	


func _on_stats_area_2d_mouse_entered() -> void:
	Stats_Selected = true
	Stats_Clickable = true

func _on_stats_area_2d_mouse_exited() -> void:
	Stats_Clickable = false


func _on_scientific_area_2d_mouse_entered() -> void:
	Scientific_Selected = true
	Scientific_Clickable = true

func _on_scientific_area_2d_mouse_exited() -> void:
	Scientific_Clickable = false

func _on_genome_area_2d_mouse_entered() -> void:
	Genome_Selected = true
	Genome_Clickable = true

func _on_genome_area_2d_mouse_exited() -> void:
	Genome_Clickable = false

func _on_specialized_area_2d_mouse_entered() -> void:
	Specialized_Selected = true
	Specialized_Clickable = true

func _on_specialized_area_2d_mouse_exited() -> void:
	Specialized_Clickable = false


func _on_close_button_sequencing_button_down() -> void:
	$"Research Tree".visible = false
	$"Research Tree/CanvasLayer".visible = false
	$"User Interface/Research Tree UI/Close Button Sequencing/Research Tree Close Sound".play()

func _on_research_node_ui_mouse_entered() -> void:
	Scroll_Hault = true


func _on_research_node_ui_mouse_exited() -> void:
	Scroll_Hault = false


func _on_close_button_sequencing_mouse_entered() -> void:
	$"User Interface/Research Tree UI/Close Button Sequencing/Hover".play()


func _on_tutorial_button_mouse_entered() -> void:
	$"User Interface/Research Tree UI/Tutorial Button/Hover".play()
