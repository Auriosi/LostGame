extends Node2D

const FRUIT = preload("res://Scripts/Story/Plant Sentience/fruit.tscn")

var X_ray = false
var Button_Lock = false
var X_Ray_Toggle_Active = false
var Week = 9

var Fruit_Index = 4

var Apples_Clicked = 0
var Oranges_Clicked = 0
var Bananas_Clicked = 0

@onready var X_Ray = $"User Interface/X_Ray"
@onready var Sound_Machine = $"User Interface/Sound Machine Game"
@onready var Harvest = $"User Interface/Harvest"
@onready var Audio_Visualizer = $"User Interface/Sound Machine Game/AudioVisualizer"

@onready var Week_4 = $"Week 4 Flower"
@onready var Week_5 = $"Week 5 Flower"
@onready var Week_6 = $"Week 6 Flower"
@onready var Week_8 = $"Week 8 Flower"
@onready var Week_9 = $"Week 9 Flower"
@onready var Week_10 = $"Week 10 Flower"

@onready var Material_Table = $"User Interface/X_Ray/Mat Answers Table/MatAnswerTable".texture
@onready var Chitin_Answers_Visible = $"User Interface/X_Ray/Mat Answers Table/Chi_Ans".visible
@onready var Chitin_Label_Visible = $"User Interface/X_Ray/Mat Answers Table/Chi_Label".visible
@onready var Chitin_Approximation_Visible = $"User Interface/X_Ray/Mat Answers Table/Chi_Approx".visible
@onready var Hydroxyapatite_Answers_Visible = $"User Interface/X_Ray/Mat Answers Table/Hyd_Ans".visible
@onready var Hydroxyapatite_Label_Visible = $"User Interface/X_Ray/Mat Answers Table/Hyd_Label".visible
@onready var Hydroxyapatite_Approximation_Visible = $"User Interface/X_Ray/Mat Answers Table/Hyd_Approx".visible
@onready var Insulin_Answers_Visible = $"User Interface/X_Ray/Mat Answers Table/Ins_Ans".visible
@onready var Insulin_Label_Visible = $"User Interface/X_Ray/Mat Answers Table/Ins_Label".visible
@onready var Insulin_Approximation_Visible = $"User Interface/X_Ray/Mat Answers Table/Ins_Approx".visible
@onready var Hemoglobin_Answers_Visible = $"User Interface/X_Ray/Mat Answers Table/Hem_Ans".visible
@onready var Hemoglobin_Label_Visible = $"User Interface/X_Ray/Mat Answers Table/Hem_Label".visible
@onready var Hemoglobin_Approximation_Visible = $"User Interface/X_Ray/Mat Answers Table/Hem_Approx".visible

func _ready():
	Week_4.visible = false
	Week_5.visible = false
	Week_6.visible = false
	Week_8.visible = false
	Week_9.visible = false
	Week_10.visible = false
	if Week == 4:
		Week_4.visible = true
		X_Ray.Material_Percentage = [1602, 260, 1095, 550, 234, 112, 0, 0, 0, 0]
		X_Ray.Mat_Per_Label()
		Audio_Visualizer.Level = 1
	if Week == 5:
		Week_5.visible = true
		X_Ray.Material_Percentage = [3313, 631, 1782, 986, 256, 112, 0, 0, 0, 0]
		X_Ray.Mat_Per_Label()
		Audio_Visualizer.Level = 2
		Fruit_Spawn(1)
	if Week == 6:
		Week_6.visible = true
		X_Ray.Material_Percentage = [3714, 829, 3012, 2701, 643, 301, 0, 0, 0, 0]
		X_Ray.Mat_Per_Label()
		Audio_Visualizer.Level = 3
		Fruit_Spawn(2)
	if Week == 8:
		Week_8.visible = true
		X_Ray.Material_Percentage = [4403, 1002, 1346, 1699, 421, 293, 501, 0, 0, 0]
		Material_Table = load("res://Sprites/Story/Plant Sentience/Mat_Answer_Table_2.png")
		Chitin_Answers_Visible = true
		Chitin_Label_Visible = true
		Chitin_Approximation_Visible = true
		X_Ray.Mat_Per_Label()
		Audio_Visualizer.Level = 4
		Fruit_Spawn(2)
	if Week == 9:
		Week_9.visible = true
		X_Ray.Material_Percentage = [4312, 1014, 1451, 2795, 402, 238, 834, 192, 263, 0]
		Material_Table = load("res://Sprites/Story/Plant Sentience/Mat_Answer_Table_2.png")
		Chitin_Answers_Visible = true
		Chitin_Label_Visible = true
		Chitin_Approximation_Visible = true
		Hydroxyapatite_Answers_Visible = true
		Hydroxyapatite_Label_Visible = true
		Hydroxyapatite_Approximation_Visible = true
		Insulin_Answers_Visible = true
		Insulin_Label_Visible = true
		Insulin_Approximation_Visible = true
		X_Ray.Mat_Per_Label()
		Audio_Visualizer.Level = 5
		Fruit_Spawn(3)
	if Week == 10:
		Week_10.visible = true
		X_Ray.Material_Percentage = [5781, 132, 1782, 8401, 679, 324, 1205, 1703, 2910, 3704]
		Material_Table = load("res://Sprites/Story/Plant Sentience/Mat_Answer_Table_2.png")
		Chitin_Answers_Visible = true
		Chitin_Label_Visible = true
		Chitin_Approximation_Visible = true
		Hydroxyapatite_Answers_Visible = true
		Hydroxyapatite_Label_Visible = true
		Hydroxyapatite_Approximation_Visible = true
		Insulin_Answers_Visible = true
		Insulin_Label_Visible = true
		Insulin_Approximation_Visible = true
		Hemoglobin_Answers_Visible = true
		Hemoglobin_Label_Visible = true
		Hemoglobin_Approximation_Visible = true
		X_Ray.Mat_Per_Label()
		Audio_Visualizer.Level = 6
		Fruit_Spawn(5)
	X_Ray.Mat_Per_Math_Start()

func _process(delta):
	if X_Ray.visible == true or Sound_Machine.visible == true or Harvest.visible == true:
		Button_Lock = true
	else:
		Button_Lock = false
	X_Ray.Mat_Per_Math(delta)

func _on_area_2d_mouse_entered() -> void:
	X_Ray_Toggle_Active = true

func _on_area_2d_mouse_exited() -> void:
	X_Ray_Toggle_Active = false
# Spawns fruit in a random set area.
func Fruit_Spawn(Fruit_Amount):
	for i in range(Fruit_Amount):
		var fruit = FRUIT.instantiate()
		var Fruit_Y = randi() % 20 + 681
		var Fruit_X = randi() % 350 + 815
		get_tree().current_scene.add_child(fruit)
		fruit.index = Fruit_Index
		#fruit.position = Vector2(814,700)
		#fruit.position = Vector2(1164,680)
		fruit.position = Vector2(Fruit_X, Fruit_Y)
		fruit.rotation_degrees = randi() % 360
		fruit.z_index = 0
		i += 1
		Fruit_Index += 1
		
