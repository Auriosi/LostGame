extends Node2D

@onready var Target_Value = 0

@onready var Genome = 0

@onready var Buttons_Active = 0
@onready var Button_1 = 0
@onready var Button_2 = 0
@onready var Button_3 = 0
@onready var Button_4 = 0
@onready var Button_5 = 0
@onready var Warning_Text_Blink = 0.5

@onready var Main = $"../.."
@onready var Audio_Visualizer = $AudioVisualizer
@onready var Static_1 = $AudioVisualizer/Static1
@onready var Static_2 = $AudioVisualizer/Static2
@onready var Static_3 = $AudioVisualizer/Static3
@onready var Static_4 = $AudioVisualizer/Static4
@onready var Static_5 = $AudioVisualizer/Static5
@onready var Static_1_Button = $Button1
@onready var Static_2_Button = $Button2
@onready var Static_3_Button = $Button3
@onready var Static_4_Button = $Button4
@onready var Static_5_Button = $Button5

@onready var Waring_Text = $"Warning Text"
@onready var Camera = $Camera
@onready var Camera_Button_Area_2D = $CameraButton/Area2D
@onready var Camera_Animation = $Camera/Ungliation

func _ready() -> void:
	Target_Value = randi() % 4 + 2

func _process(delta):
	if Buttons_Active > 1:
		Warning_Text_Blink += 0.5 * delta
		Audio_Visualizer.visible = false
		if Warning_Text_Blink > 0.5 && Warning_Text_Blink < 1:
			Waring_Text.visible = true
		elif Warning_Text_Blink > 1:
			Waring_Text.visible = false
			Warning_Text_Blink = 0
		
	Buttons_Active = Button_1 + Button_2 + Button_3 + Button_4 + Button_5
	if Main.Week == 4 or Main.Week == 5:
		if Target_Value == Camera_Button_Area_2D.Value:
			Camera_Animation.speed_scale = 2
			Genome = 100
		elif abs(Target_Value - Camera_Button_Area_2D.Value) == 1:
			Camera_Animation.speed_scale = 1.7
			Genome = 75
		elif abs(Target_Value - Camera_Button_Area_2D.Value) == 2:
			Camera_Animation.speed_scale = 1.4
			Genome = 50
		elif abs(Target_Value - Camera_Button_Area_2D.Value) == 3:
			Camera_Animation.speed_scale = 1.2
			Genome = 25
		else:
			Camera_Animation.speed_scale = 1
			Genome = 0
	else:
		if Target_Value == Camera_Button_Area_2D.Value:
			Camera.Gameover = true
		elif abs(Target_Value - Camera_Button_Area_2D.Value) == 1 && Camera.Jumpscare == false:
			Camera.Gameover = false
			Camera_Animation.speed_scale = 2
			Genome = 100
		elif abs(Target_Value - Camera_Button_Area_2D.Value) == 2 && Camera.Jumpscare == false:
			Camera_Animation.speed_scale = 1.5
			Camera.Gameover = false
			Genome = 50
		elif abs(Target_Value - Camera_Button_Area_2D.Value) == 3 && Camera.Jumpscare == false:
			Camera_Animation.speed_scale = 1.25
			Camera.Gameover = false
			Genome = 25
		elif abs(Target_Value - Camera_Button_Area_2D.Value) > 3 && Camera.Jumpscare == false:
			Camera_Animation.speed_scale = 1
			Camera.Gameover = false
			Genome = 0
	
	if Input.is_action_just_pressed("Open Menu") && Camera.visible == false:
		visible = false
	
	if Static_1_Button.active == true:
		Button_1 = 1
		Audio_Visualizer.Static1 = true
	elif Static_1_Button.active == false:
		Button_1 = 0
		Audio_Visualizer.Static1 = false
		Static_1.stop()
	
	if Static_2_Button.active == true:
		Button_2 = 1
		Audio_Visualizer.Static2 = true
	elif Static_2_Button.active == false:
		Button_2 = 0
		Audio_Visualizer.Static2 = false
		Static_2.stop()
	
	if Static_3_Button.active == true:
		Button_3 = 1
		Audio_Visualizer.Static3 = true
	elif Static_3_Button.active == false:
		Button_3 = 0
		Audio_Visualizer.Static3 = false
		Static_3.stop()
	
	if Static_4_Button.active == true:
		Button_4 = 1
		Audio_Visualizer.Static4 = true
	elif Static_4_Button.active == false:
		Button_4 = 0
		Audio_Visualizer.Static4 = false
		Static_4.stop()
	
	if Static_5_Button.active == true:
		Button_5 = 1
		Audio_Visualizer.Static5 = true
	elif Static_5_Button.active == false:
		Button_5 = 0
		Audio_Visualizer.Static5 = false
		Static_5.stop()
		#if $AudioVisualizer/Static2.playing == false:
		#	$AudioVisualizer.Static1 = false

func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.

func _on_area_2d_mouse_exited() -> void:
	pass # Replace with function body.
