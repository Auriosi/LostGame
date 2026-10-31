extends Node2D

var horizontal_speed = 0
var horizontal_acceleration = 0
var horizontal_acceleration_target = 0

var vertical_speed = 0
var vertical_acceleration = 0
var vertical_acceleration_target = 0

var mouse = Vector2(0,0)

var flares = 0

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
var current_Zoom = Vector2(1,1)

var Conceal = false

var Concealment = 1

var Concealment_Slowdown = 0.25

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

func _process(delta):
	_player_movement(delta)
	_player_camera()
	_player_charges(delta)
	_player_mouse()
	_player_zoom(delta)
	_Conceal(delta)
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
			flare_1_active = true
	if flares == 2:
		flare_2_position_target = Vector2(0, 75)
		Flare_2.position = flare_2_position_target
		Flare_1.visible = true
		Flare_2.visible = true
		Flare_3.visible = false
		if Conceal == false:
			flare_1_active = true
			flare_2_active = true
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
	if Input.is_action_just_pressed("Zoom Out"):
		if target_Zoom.x > 0.25:
			target_Zoom += Vector2(-0.25,-0.25)
	if Input.is_action_just_pressed("Zoom In"):
		if target_Zoom.x < 1:
			target_Zoom += Vector2(0.25,0.25)
	if current_Zoom > target_Zoom:
		current_Zoom += (target_Zoom - current_Zoom) * delta * 4
	elif current_Zoom < target_Zoom:
		current_Zoom += (target_Zoom - current_Zoom) * delta * 4
	Camera.zoom = current_Zoom
# Deals with the player's conceal mechanic
func _Conceal(delta):
	if Input.is_action_just_pressed("Conceal"):
		Conceal = true
	if Input.is_action_just_released("Conceal"):
		Conceal = false
	if Conceal == true:
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
