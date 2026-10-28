extends Node2D

var horizontal_speed = 0
var horizontal_acceleration = 0
var horizontal_acceleration_target = 0

var vertical_speed = 0
var vertical_acceleration = 0
var vertical_acceleration_target = 0

var Mouse = Vector2(0,0)

var charges = 3

var Light = 1

@onready var Camera = $Camera2D

@onready var Flare_1 = $"Flare Ring/Flare Charge 1"
@onready var Flare_2 = $"Flare Ring/Flare Charge 2"
@onready var Flare_3 = $"Flare Ring/Flare Charge 3"

@onready var Mouse_Light = $"Mouse Light"

func _process(delta):
	_player_movement(delta)
	_player_camera()
	_player_charges(delta)
	_player_mouse()
# Deals with the player's movement and acceleration
func _player_movement(delta):
	# To Determine the speed the player is going.
	if Input.is_key_pressed(KEY_W) && Input.is_key_pressed(KEY_A):
		vertical_speed = -2.8
		horizontal_speed = -2.8
		horizontal_acceleration_target = -2.8
		vertical_acceleration_target = -2.8
	if Input.is_key_pressed(KEY_A) && Input.is_key_pressed(KEY_S):
		horizontal_speed = -2.8
		vertical_speed = 2.8
		horizontal_acceleration_target = -2.8
		vertical_acceleration_target = 2.8
	if Input.is_key_pressed(KEY_D) && Input.is_key_pressed(KEY_W):
		horizontal_speed = 2.8
		vertical_speed = -2.8
		horizontal_acceleration_target = 2.8
		vertical_acceleration_target = -2.8
	if Input.is_key_pressed(KEY_S) && Input.is_key_pressed(KEY_D):
		vertical_speed = 2.8
		horizontal_speed = 2.8
		horizontal_acceleration_target = 2.8
		vertical_acceleration_target = 2.8
	if Input.is_key_pressed(KEY_W) && Input.is_key_pressed(KEY_A) == false && Input.is_key_pressed(KEY_S) == false && Input.is_key_pressed(KEY_D) == false:
		horizontal_speed = 0
		vertical_speed = -4
		horizontal_acceleration_target = 0
		vertical_acceleration_target = -4
	if Input.is_key_pressed(KEY_S) && Input.is_key_pressed(KEY_W) == false && Input.is_key_pressed(KEY_D) == false && Input.is_key_pressed(KEY_A) == false:
		horizontal_speed = 0
		vertical_speed = 4
		horizontal_acceleration_target = 0
		vertical_acceleration_target = 4
	if Input.is_key_pressed(KEY_A) && Input.is_key_pressed(KEY_W) == false && Input.is_key_pressed(KEY_S) == false && Input.is_key_pressed(KEY_D) == false:
		horizontal_speed = -4
		vertical_speed = 0
		horizontal_acceleration_target = -4
		vertical_acceleration_target = 0
	if Input.is_key_pressed(KEY_D) && Input.is_key_pressed(KEY_W) == false && Input.is_key_pressed(KEY_S) == false && Input.is_key_pressed(KEY_A) == false:
		horizontal_speed = 4
		vertical_speed = 0
		horizontal_acceleration_target = 4
		vertical_acceleration_target = 0
	if Input.is_key_pressed(KEY_W) == false && Input.is_key_pressed(KEY_A) == false && Input.is_key_pressed(KEY_S) == false && Input.is_key_pressed(KEY_D) == false:
		horizontal_speed = 0
		vertical_speed = 0
		horizontal_acceleration_target = 0
		vertical_acceleration_target = 0
	# To calculate the speed and acceleration the player will use.
	if horizontal_acceleration_target > 0:
		horizontal_acceleration += horizontal_speed * delta * 2
		if horizontal_acceleration > horizontal_acceleration_target:
			horizontal_acceleration -= horizontal_speed * delta * 2
	if horizontal_acceleration_target < 0:
		horizontal_acceleration += horizontal_speed * delta * 2
		if horizontal_acceleration < horizontal_acceleration_target:
			horizontal_acceleration -= horizontal_speed * delta * 2
	if horizontal_acceleration_target == 0:
		if horizontal_acceleration > 0:
			horizontal_acceleration -= horizontal_acceleration * delta
		if horizontal_acceleration < 0:
			horizontal_acceleration += abs(horizontal_acceleration) * delta
	if vertical_acceleration_target > 0:
		vertical_acceleration += vertical_speed * delta * 2
		if vertical_acceleration > vertical_acceleration_target:
			vertical_acceleration -= vertical_speed * delta * 2
	if vertical_acceleration_target < 0:
		vertical_acceleration += vertical_speed * delta * 2
		if vertical_acceleration < vertical_acceleration_target:
			vertical_acceleration -= vertical_speed * delta * 2
	if vertical_acceleration_target == 0:
		if vertical_acceleration > 0:
			vertical_acceleration -= vertical_acceleration * delta
		if vertical_acceleration < 0:
			vertical_acceleration += abs(horizontal_acceleration) * delta
	# Attaching acceleration to player position
	position.x += horizontal_acceleration
	position.y += vertical_acceleration
# Deals with the player's camera
func _player_camera():
	Mouse = get_global_mouse_position()
	Camera.position.x = ( (Mouse.x - position.x) / 2)
	Camera.position.y = ( (Mouse.y - position.y) / 2)
# Deals with the light charge animation
func _player_charges(delta):
	$"Flare Ring".rotation_degrees += 10 * delta
	if charges == 1:
		Flare_1.visible = true
		Flare_2.visible = false
		Flare_3.visible = false
	if charges == 2:
		Flare_1.visible = true
		Flare_2.visible = true
		Flare_3.visible = false
	if charges == 3:
		Flare_1.visible = true
		Flare_2.visible = true
		Flare_3.visible = true
# Deals with the player's mouse light
func _player_mouse():
	print(1000 / abs(Mouse.x - position.x))
	Light = 500 / abs(Mouse.x - position.x)
	if Light > 1:
		Mouse_Light.modulate = Color(1,1,1,1)
	else:
		Mouse_Light.modulate = Color(1,1,1,Light)
	Mouse_Light.position = get_global_mouse_position() - position
