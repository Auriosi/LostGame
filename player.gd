extends Node2D

var horizontal_speed = 0
var horizontal_acceleration = 0
var horizontal_acceleration_target = 0

var vertical_speed = 0
var vertical_acceleration = 0
var vertical_acceleration_target = 0

var mouse = Vector2(0,0)

var flares = 3

var flare_1_position_target = 0
var flare_2_position_target = 0
var flare_3_position_target = 0

var flare_1_active = false
var flare_2_active = false
var flare_3_active = false

var flare_1_fade_in = 0
var flare_2_fade_in = 0
var flare_3_fade_in = 0

var light = 1

var target_Zoom = Vector2(1,1)
var stealth_Zoom = Vector2(1,1)
var current_Zoom = Vector2(1,1)
var Zoom_Speed = 4
var stealth_Zoom_Tension = 0.1

var Darkness = 0

var Conceal = false
var Concealment = 1
var Concealment_Slowdown = 0.25

var Summon = false
var Summon_Time = 0

var Lose_State = false

@onready var Camera = $Camera2D

@onready var Flare_1 = $"Flare Ring/Flare Charge 1"
@onready var Flare_1_Light = $"Flare Ring/Flare Charge 1/PointLight2D"
@onready var Flare_2 = $"Flare Ring/Flare Charge 2"
@onready var Flare_2_Light = $"Flare Ring/Flare Charge 2/PointLight2D"
@onready var Flare_3 = $"Flare Ring/Flare Charge 3"
@onready var Flare_3_Light = $"Flare Ring/Flare Charge 3/PointLight2D"

@onready var Player_Light = $"Player Image/Player Light"
@onready var Mouse_Light_Image = $"Mouse Light/Light Image"
@onready var Mouse_Light = $"Mouse Light/Light Image/Player Light"

@onready var Mouse = $"Mouse Light"

@onready var Mouse_Area_2D = $"Mouse Light/Mouse Area 2D"
@onready var Interaction_Area_2D = $"Interaction Area 2D"

const FLARE = preload("res://flare.tscn")

func _process(delta):
	_player_movement(delta)
	_player_camera()
	_player_charges(delta)
	_player_mouse()
	_player_zoom(delta)
	_Conceal(delta)
	_Flare_Light(delta)
	if Lose_State == true:
		get_tree().change_scene_to_file("res://Lose Game.tscn")
# Deals with the player's movement and acceleration
func _player_movement(delta):
	# To Determine the speed the player is going.
	if Input.is_key_pressed(KEY_W) && Input.is_key_pressed(KEY_A):
		vertical_speed = -2.8 * Concealment_Slowdown
		horizontal_speed = -2.8 * Concealment_Slowdown
		horizontal_acceleration_target = -2.8 * Concealment_Slowdown
		vertical_acceleration_target = -2.8 * Concealment_Slowdown
	if Input.is_key_pressed(KEY_A) && Input.is_key_pressed(KEY_S):
		horizontal_speed = -2.8 * Concealment_Slowdown
		vertical_speed = 2.8 * Concealment_Slowdown
		horizontal_acceleration_target = -2.8 * Concealment_Slowdown
		vertical_acceleration_target = 2.8 * Concealment_Slowdown
	if Input.is_key_pressed(KEY_D) && Input.is_key_pressed(KEY_W):
		horizontal_speed = 2.8 * Concealment_Slowdown
		vertical_speed = -2.8 * Concealment_Slowdown
		horizontal_acceleration_target = 2.8 * Concealment_Slowdown
		vertical_acceleration_target = -2.8 * Concealment_Slowdown
	if Input.is_key_pressed(KEY_S) && Input.is_key_pressed(KEY_D):
		vertical_speed = 2.8 * Concealment_Slowdown
		horizontal_speed = 2.8 * Concealment_Slowdown
		horizontal_acceleration_target = 2.8 * Concealment_Slowdown
		vertical_acceleration_target = 2.8 * Concealment_Slowdown
	if Input.is_key_pressed(KEY_W) && Input.is_key_pressed(KEY_A) == false && Input.is_key_pressed(KEY_S) == false && Input.is_key_pressed(KEY_D) == false:
		horizontal_speed = 0
		vertical_speed = -4 * Concealment_Slowdown
		horizontal_acceleration_target = 0
		vertical_acceleration_target = -4 * Concealment_Slowdown
	if Input.is_key_pressed(KEY_S) && Input.is_key_pressed(KEY_W) == false && Input.is_key_pressed(KEY_D) == false && Input.is_key_pressed(KEY_A) == false:
		horizontal_speed = 0
		vertical_speed = 4 * Concealment_Slowdown
		horizontal_acceleration_target = 0
		vertical_acceleration_target = 4 * Concealment_Slowdown
	if Input.is_key_pressed(KEY_A) && Input.is_key_pressed(KEY_W) == false && Input.is_key_pressed(KEY_S) == false && Input.is_key_pressed(KEY_D) == false:
		horizontal_speed = -4 * Concealment_Slowdown
		vertical_speed = 0
		horizontal_acceleration_target = -4 * Concealment_Slowdown
		vertical_acceleration_target = 0
	if Input.is_key_pressed(KEY_D) && Input.is_key_pressed(KEY_W) == false && Input.is_key_pressed(KEY_S) == false && Input.is_key_pressed(KEY_A) == false:
		horizontal_speed = 4 * Concealment_Slowdown
		vertical_speed = 0
		horizontal_acceleration_target = 4 * Concealment_Slowdown
		vertical_acceleration_target = 0
	if Input.is_key_pressed(KEY_W) == false && Input.is_key_pressed(KEY_A) == false && Input.is_key_pressed(KEY_S) == false && Input.is_key_pressed(KEY_D) == false:
		horizontal_speed = 0
		vertical_speed = 0
		horizontal_acceleration_target = 0
		vertical_acceleration_target = 0
	# To calculate the speed and acceleration the player will use.
	if horizontal_acceleration_target > 0:
		horizontal_acceleration += horizontal_speed * delta * 2 * Concealment_Slowdown
		if horizontal_acceleration > horizontal_acceleration_target:
			horizontal_acceleration -= horizontal_speed * delta * 2
	if horizontal_acceleration_target < 0:
		horizontal_acceleration += horizontal_speed * delta * 2 * Concealment_Slowdown
		if horizontal_acceleration < horizontal_acceleration_target:
			horizontal_acceleration -= horizontal_speed * delta * 2
	if horizontal_acceleration_target == 0:
		if horizontal_acceleration > 0:
			horizontal_acceleration -= horizontal_acceleration * delta * 2
		if horizontal_acceleration < 0:
			horizontal_acceleration += abs(horizontal_acceleration) * delta * 2
	if vertical_acceleration_target > 0:
		vertical_acceleration += vertical_speed * delta * 2 * Concealment_Slowdown
		if vertical_acceleration > vertical_acceleration_target:
			vertical_acceleration -= vertical_speed * delta * 2
	if vertical_acceleration_target < 0:
		vertical_acceleration += vertical_speed * delta * 2 * Concealment_Slowdown
		if vertical_acceleration < vertical_acceleration_target:
			vertical_acceleration -= vertical_speed * delta * 2
	if vertical_acceleration_target == 0:
		if vertical_acceleration > 0:
			vertical_acceleration -= vertical_acceleration * delta * 2
		if vertical_acceleration < 0:
			vertical_acceleration += abs(horizontal_acceleration) * delta * 2
	# Attaching acceleration to player position
	position.x += horizontal_acceleration
	position.y += vertical_acceleration
# Deals with the player's camera
func _player_camera():
	mouse = get_global_mouse_position()
	Camera.position.x = ( (mouse.x - position.x) / 2)
	Camera.position.y = ( (mouse.y - position.y) / 2)
# Deals with the light charge animation
func _player_charges(delta):
	$"Flare Ring".rotation_degrees += 30 * delta
	if flares == 1:
		Flare_1.visible = true
		Flare_2.visible = false
		Flare_3.visible = false
		if Conceal == false:
			if Summon_Time >= 1:
				flare_1_active = false
				Summon_Time = 0
			elif Summon == false:
				flare_1_active = true
		else:
			flare_1_active = false
	if flares == 2:
		flare_2_position_target = Vector2(0, 75)
		if Flare_2.position != flare_2_position_target:
			Flare_2.position -= ( (Flare_2.position - flare_2_position_target) ) * delta
		Flare_1.visible = true
		Flare_2.visible = true
		Flare_3.visible = false
		if Conceal == false:
			flare_1_active = true
			if Summon_Time >= 1:
				flare_2_active = false
				Summon_Time = 0
			elif Summon == false:
				flare_2_active = true
		else:
			flare_2_active = false
	if flares == 3:
		flare_2_position_target = Vector2(-65, 37.5)
		flare_3_position_target = Vector2(65, 37.5)
		if Flare_2.position != flare_2_position_target:
			Flare_2.position -= ( (Flare_2.position - flare_2_position_target) ) * delta
		Flare_1.visible = true
		Flare_2.visible = true
		Flare_3.visible = true
		if Conceal == false:
			flare_1_active = true
			flare_2_active = true
			if Summon_Time >= 1:
				flare_3_active = false
				Summon_Time = 0
			elif Summon == false:
				flare_3_active = true
	if flare_1_active == true:
		if flare_1_fade_in < 1:
			Flare_1.modulate = Color(1,1,1,flare_1_fade_in)
			Flare_1_Light.color = Color(1,1,1,flare_1_fade_in)
			flare_1_fade_in += 1 * delta
	elif flare_1_active == false:
		if flare_1_fade_in > 0:
			Flare_1.modulate = Color(1,1,1,flare_1_fade_in)
			Flare_1_Light.color = Color(1,1,1,flare_1_fade_in)
			flare_1_fade_in -= 5 * delta
			if Summon == true && flare_1_fade_in <= 0:
				Summon = false
				flares -= 1
				_Spawn_Flare()
	if flare_2_active == true:
		if flare_2_fade_in < 1:
			Flare_2.modulate = Color(1,1,1,flare_2_fade_in)
			Flare_2_Light.color = Color(1,1,1,flare_2_fade_in)
			flare_2_fade_in += 1 * delta
	elif flare_2_active == false:
		if flare_2_fade_in > 0:
			Flare_2.modulate = Color(1,1,1,flare_2_fade_in)
			Flare_2_Light.color = Color(1,1,1,flare_2_fade_in)
			flare_2_fade_in -= 5 * delta
			if Summon == true && flare_2_fade_in <= 0:
				Summon = false
				flares -= 1
				_Spawn_Flare()
	if flare_3_active == true:
		if flare_3_fade_in < 1:
			Flare_3.modulate = Color(1,1,1,flare_3_fade_in)
			Flare_3_Light.color = Color(1,1,1,flare_3_fade_in)
			flare_3_fade_in += 1 * delta
	elif flare_3_active == false:
		if flare_3_fade_in > 0:
			Flare_3.modulate = Color(1,1,1,flare_3_fade_in)
			Flare_3_Light.color = Color(1,1,1,flare_3_fade_in)
			flare_3_fade_in -= 5 * delta
			if Summon == true && flare_3_fade_in <= 0:
				Summon = false
				flares -= 1
				_Spawn_Flare()
# Deals with the player's mouse light
func _player_mouse(): 
	light = 500 / (abs(mouse.x - position.x) + abs(mouse.y - position.y) )
	if light > 1:
		Mouse.modulate = Color(1,1,1,1)
	else:
		Mouse.modulate = Color(1,1,1,light)
	Mouse.position = get_global_mouse_position() - position
# Deals with the player's zoom mechanic
func _player_zoom(delta):
	if Input.is_action_just_pressed("Zoom Out") && Conceal == false:
		if target_Zoom.x > 0.25:
			target_Zoom += Vector2(-16,-16) * delta
	if Input.is_action_just_pressed("Zoom In") && Conceal == false:
		if target_Zoom.x < 1:
			target_Zoom += Vector2(16,16) * delta
	#if Conceal == true:
		#if stealth_Zoom.x < 1:
			#stealth_Zoom += Vector2(16,16) * delta
	if Conceal == true:
		stealth_Zoom += Vector2(stealth_Zoom_Tension,stealth_Zoom_Tension) * delta
		stealth_Zoom_Tension -= 0.001 * delta
		if current_Zoom > stealth_Zoom:
			current_Zoom += (stealth_Zoom - current_Zoom) * delta * Zoom_Speed
		elif current_Zoom < stealth_Zoom:
			current_Zoom += (stealth_Zoom - current_Zoom) * delta * Zoom_Speed
		Camera.zoom = current_Zoom
	else:
		stealth_Zoom = Vector2(1,1)
		if current_Zoom > target_Zoom:
			current_Zoom += (target_Zoom - current_Zoom) * delta * Zoom_Speed
		elif current_Zoom < target_Zoom:
			current_Zoom += (target_Zoom - current_Zoom) * delta * Zoom_Speed
		Camera.zoom = current_Zoom
# Deals with the player's conceal mechanic
func _Conceal(delta):
	if Darkness > 30:
		Lose_State = true
	if Input.is_action_just_pressed("Conceal"):
		Conceal = true
	if Input.is_action_just_released("Conceal"):
		Conceal = false
		Darkness = 0
	if Conceal == true:
		Darkness += 1 * delta
		if Concealment_Slowdown > 0.125:
			Concealment_Slowdown -= 1 * delta
		else:
			Concealment_Slowdown = 0.125
		if Concealment > 0:
			Concealment -= 5 * delta
			Mouse_Light_Image.modulate = Color(1,1,1,Concealment)
			Mouse_Light.color = Color(1,1,1,Concealment) 
			Player_Light.color = Color(1,1,1,Concealment + 0.05)
		else:
			Concealment = 0
		flare_1_active = false
		flare_2_active = false
		flare_3_active = false
	if Conceal == false:
		if Concealment_Slowdown < 1:
			Concealment_Slowdown += 1 * delta
		else:
			Concealment_Slowdown = 1
		if Concealment < 1:
			Concealment += 0.25 * delta
			Mouse_Light_Image.modulate = Color(1,1,1,Concealment)
			Mouse_Light.color = Color(1,1,1,Concealment) 
			Player_Light.color = Color(1,1,1,Concealment + 0.05)
# Deals with summoning a flare
func _Flare_Light(delta):
	if Input.is_action_just_pressed("Summon"):
		Summon = true
	if Input.is_action_just_released("Summon"):
		Summon = false
		Summon_Time = 0
	if Input.is_action_pressed("Summon"):
		if Summon == true:
			Summon_Time += 1 * delta
# Spawns the flare entity in the current scene
func _Spawn_Flare():
	var flare = FLARE.instantiate()
	flare.global_position = get_global_mouse_position()
	get_tree().current_scene.add_child(flare)
