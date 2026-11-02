extends Node2D

enum State {
	DECOY,
	HUNT,
	ATTACK
}

enum ChargeState {
	IDLE,
	TURNING,
	CHARGING,
	STOPPING
}

@export var max_speed: float = 650.0
@export var acceleration: float = 1200.0
@export var decceleration: float = 1600.0
@export var turn_speed: float = 1.5
@export var charge_prep_time: float = 1.0
@export var recharge_position_threshold: float = 500.0

@onready var Light = $Light/PointLight2D
@onready var Light_Image = $Light
@onready var Hunt_Area2D = $HuntArea2D
@onready var Decoy_Area2D = $DecoyArea2D

var current_state := State.HUNT
var current_charge_state := ChargeState.IDLE
var tracked_entities: Array[Node2D] = []
var attack_target: Node2D = null
var current_velocity := Vector2.ZERO
var is_charging := false
var last_target_position := Vector2.ZERO

func _ready() -> void:
	Hunt_Area2D.area_entered.connect(hunt_on_area_2d_area_entered)
	Hunt_Area2D.area_exited.connect(hunt_on_area_2d_area_exited)
	Decoy_Area2D.area_entered.connect(decoy_on_area_2d_area_entered)

func _physics_process(delta: float) -> void: # slower and consistent tick rate
	match current_state:
		State.DECOY:
			if (tracked_entities.is_empty()):
				current_state = State.HUNT
				Light.set_color(Color("ffa092ff"))
		State.HUNT:
			if (!tracked_entities.is_empty()):
				current_state = State.DECOY
				Light.set_color(Color("ffffffff"))
		State.ATTACK:
			match current_charge_state:
				ChargeState.CHARGING:
					var forward := Vector2.RIGHT.rotated(rotation)
					if is_instance_valid(attack_target):
						var to_target := attack_target.global_position - global_position
						if forward.dot(to_target) < 0.0: # have we overshot the target
							current_charge_state = ChargeState.STOPPING
							last_target_position = attack_target.global_position
							return
						var desired_angle := to_target.angle()
						rotation = rotate_toward(rotation, desired_angle, turn_speed * delta)
						forward = Vector2.RIGHT.rotated(rotation)
					current_velocity = current_velocity.move_toward(forward * max_speed, acceleration * delta)
					global_position += current_velocity * delta
				ChargeState.STOPPING:
					current_velocity = current_velocity.move_toward(Vector2.ZERO, decceleration * delta)
					global_position += current_velocity * delta
					if current_velocity.is_zero_approx():
						current_charge_state = ChargeState.TURNING
				ChargeState.TURNING:
					var angle_to_last_pos := (last_target_position - global_position).angle()
					rotation = rotate_toward(rotation, angle_to_last_pos, turn_speed * 2.0 * delta)
					if absf(angle_difference(rotation, angle_to_last_pos)) < 0.05:
						if is_instance_valid(attack_target) and (attack_target.get_name() != "Player" or (attack_target.get_name() == "Player" and !attack_target.is_concealed())):
							var dist := attack_target.global_position.distance_to(last_target_position)
							if dist <= recharge_position_threshold:
								current_charge_state = ChargeState.CHARGING
								current_velocity = Vector2.RIGHT.rotated(rotation) * 80.0
								return
						current_charge_state = ChargeState.IDLE # no more target or out of range
						attack_target = null
						last_target_position = Vector2.ZERO
						if (tracked_entities.is_empty()):
							current_state = State.HUNT
							Light.set_color(Color("ffa092ff"))
						else:
							current_state = State.DECOY
							Light.set_color(Color("ffffffff"))

func hunt_on_area_2d_area_entered(area: Area2D):
	tracked_entities.append(area.get_parent())

func hunt_on_area_2d_area_exited(area: Area2D):
	var index = tracked_entities.find(area.get_parent())
	if (index != -1):
		tracked_entities.remove_at(index)

func decoy_on_area_2d_area_entered(area: Area2D):
	if current_state == State.ATTACK:
		return
	if (area.get_parent() == self):
		return
	current_state = State.ATTACK
	attack_target = area.get_parent()
	current_velocity = Vector2.ZERO
	current_charge_state = ChargeState.IDLE
	last_target_position = attack_target.global_position
	var tween = create_tween()
	tween.tween_property(Light, "color", Color("9a0000ff"), charge_prep_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.finished.connect(_start_charge)

func _start_charge():
	current_charge_state = ChargeState.CHARGING
	current_velocity = Vector2.RIGHT.rotated(rotation) * 80.0
