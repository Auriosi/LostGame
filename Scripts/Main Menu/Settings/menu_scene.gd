extends Node2D

@onready var Start_Button = $"Start Button"
@onready var Quit_Button = $"Quit Button"
@onready var Settings_Button = $"Settings Button"
@onready var Credits_Button = $"Credits Button"

var petal = preload("res://Scenes/Main Menu/Petal.tscn").instantiate()
var petal_timer = randi() % 250 + 100
var particle_timer = randi() % 100 + 100
var start_timer = 0
var skip_timer = 0
var Waxing = true
var Waining = false
var timer_modulation = 255
var UI_animation_timer = 0
var game_start_timer = 0
var warning_blink = 0
var Game_Start = false

var Stem_Light_Modulation = 0
var Stem_Light_Build = 0
var Growth_Light_Modulation = 0
var Wind_Volume = 0
var Static_Playing = false

var Parameter_Static = 0

func _ready():
	
	$Filter/ColorRect.material.get_shader_parameter("X")
	$Filter/ColorRect.material.set_shader_parameter("X", Parameter_Static)
	$Filter/ColorRect.material.get_shader_parameter("Y")
	$Filter/ColorRect.material.set_shader_parameter("Y", Parameter_Static)

func _process(delta):
	
	if Input.is_action_pressed("Skip Menu Animation") && start_timer < 300:
		skip_timer += 100 * delta
		if skip_timer >= 100:
			start_timer = 300
			$Rose.modulate = Color(1,1,1,float(start_timer)/300)
			skip_timer = 0
	else:
		skip_timer = 0
	if start_timer < 300:
		$Rose.modulate = Color(1,1,1,float(start_timer)/300)
		$Title.modulate = Color(1,1,1,float(start_timer)/255)
		$Wind.volume_db = float(start_timer)/300 * 100 - 100
		start_timer += 50 * delta
		if timer_modulation > 0 && Waxing:
			timer_modulation -= 150 * delta
			Waining = false
		if timer_modulation < 255 && Waining:
			timer_modulation += 150 * delta
			Waxing = false
		if timer_modulation <= 0:
			Waining = true
		if timer_modulation >= 255:
			Waxing = true
		$Label.modulate = Color(1,1,1,float(timer_modulation)/255)
	elif start_timer >= 300:
		_timer(delta)
	if $"Game Menu".New_Game == true:
		Game_Start = true

func _timer(delta):
	if $Music.playing == false && Game_Start == false:
		$Music.play()
		$Wind.volume_db = float(start_timer)/300 * 100 - 100
		Start_Button.visible = true
		Quit_Button.visible = true
		Settings_Button.visible = true
		Credits_Button.visible = true
	if UI_animation_timer < 100:
		UI_animation_timer += 50 * delta
	if UI_animation_timer > 25 && UI_animation_timer < 50:
		Start_Button.text = "Sta_Online"
		Quit_Button.text = "Qui_Online"
		Settings_Button.text = "Set_Online"
		Credits_Button.text = "Cre_Online"
	elif UI_animation_timer > 50 && UI_animation_timer < 100:
		Start_Button.visible = false
		Quit_Button.visible = false
		Settings_Button.visible = false
		Credits_Button.visible = false
		Start_Button.text = ""
		Quit_Button.text = ""
		Settings_Button.text = ""
		Credits_Button.text = ""
	if UI_animation_timer >= 60:
		Start_Button.visible = true
		Start_Button.disabled = false
		Start_Button.text = "Play"
	if UI_animation_timer >= 70:
		Quit_Button.visible = true
		Quit_Button.disabled = false
		Quit_Button.text = "Quit"
	if UI_animation_timer >= 80:
		Settings_Button.visible = true
		Settings_Button.disabled = false
		Settings_Button.text = "Settings"
	if UI_animation_timer >= 90:
		UI_animation_timer = 100
		Credits_Button.visible = true
		Credits_Button.disabled = false
		Credits_Button.text = "Credits"
	if timer_modulation > 0:
		timer_modulation -= 250 * delta
		$Label.modulate = Color(1,1,1,float(timer_modulation)/255)
		$Title.modulate = Color(1,1,1,float(start_timer)/255)
	if petal_timer > 0:
		petal_timer -= 100 * delta
	else:
		petal_timer = randi() % 150 + 100
		get_tree().get_root().add_child.call_deferred(preload("res://Scenes/Main Menu/Petal.tscn").instantiate())
	if particle_timer > 0:
		particle_timer -= 100 * delta
	else:
		particle_timer = randi() % 100 + 100
		get_tree().get_root().add_child.call_deferred(preload("res://Scenes/Main Menu/Particles.tscn").instantiate())
	
	if Game_Start == true:
		NewGame_Cutscene(delta)
		#get_tree().change_scene_to_file("res://Scenes/Lab/lab.tscn")


func NewGame_Cutscene(delta):
	if Static_Playing == false:
		$"Intro Static".play()
		Static_Playing = true
	$Music.playing = false
	
	$"Start Button".visible = false
	$"Quit Button".visible = false
	$"Settings Button".visible = false
	$"Credits Button".visible = false
	$"Settings Menu".visible = false
	$"Game Menu".visible = false
	$Title.visible = false
	
	$Stem.modulate = Color(1,1,1,float(Stem_Light_Modulation)/255)
	
	if Stem_Light_Modulation < 255:
		Stem_Light_Modulation += Stem_Light_Build * delta
	if Stem_Light_Build < 500:
		Stem_Light_Build += 100 * delta
	if Wind_Volume < 24:# && $"Intro Static".playing == true:
		$Wind.volume_db = Wind_Volume
		Wind_Volume = Stem_Light_Build / 10
	#preload("res://Scenes/Main Menu/static.gdshader")
	$Filter/ColorRect.material.get_shader_parameter("X")
	$Filter/ColorRect.material.set_shader_parameter("X", Parameter_Static)
	$Filter/ColorRect.material.get_shader_parameter("Y")
	$Filter/ColorRect.material.set_shader_parameter("Y", Parameter_Static)
	Parameter_Static += 3.629898 * delta
	if Parameter_Static > 18:
		$Growth.modulate = Color(1,1,1,float(Growth_Light_Modulation)/255)
		Growth_Light_Modulation += 20 * delta
		$Growth.visible = true
	if $"Intro Static".playing == false:
		visible = false
		$Wind.playing = false
	if Parameter_Static > 23:
		get_tree().change_scene_to_file("res://Scenes/Story/Teaser Cutscene.tscn")
		#get_tree().change_scene_to_file("res://Scenes/Lab/lab.tscn")
