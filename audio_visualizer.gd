extends Control

var Static1 = false
var Static2 = false
var Static3 = false
var Static4 = false
var Static5 = false
var Static_Played = false
var Static_Playing = false

var Level = 1

@onready var spectrum = AudioServer.get_bus_effect_instance(5,0)

@onready var pitch: AudioEffectPitchShift = AudioServer.get_bus_effect(5, 1)

@onready var bottomRightArray = $CircleBase/Right/Bottom.get_children()

@onready var topRightArray = $CircleBase/Right/Top.get_children()

@onready var static_length = 0

const VU_COUNT = 76
const HEIGHT = 75
const FREQ_MAX = 11050.0

const MIN_DB = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	topRightArray.reverse()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Level == 1:
		pitch.pitch_scale = 1
	if Level == 2:
		pitch.pitch_scale = 0.95
	if Level == 3:
		pitch.pitch_scale = 0.9
	if Level == 4:
		pitch.pitch_scale = 0.8
	if Level == 5:
		pitch.pitch_scale = 0.7
	if Level == 6:
		pitch.pitch_scale = 0.6
	
	if Static1 == true:
		Static_Playing = true
		_PlayStatic1(delta)
		if $Static1.playing == false:
			Static_Playing = false
		$Static2.stop()
		$Static3.stop()
		$Static4.stop()
		$Static5.stop()
	if Static2 == true:
		Static_Playing = true
		_PlayStatic2(delta)
		if $Static2.playing == false:
			Static_Playing = false
		$Static1.stop()
		$Static3.stop()
		$Static4.stop()
		$Static5.stop()
	if Static3 == true:
		Static_Playing = true
		_PlayStatic3(delta)
		if $Static3.playing == false:
			Static_Playing = false
		$Static1.stop()
		$Static2.stop()
		$Static4.stop()
		$Static5.stop()
	if Static4 == true:
		Static_Playing = true
		_PlayStatic4(delta)
		if $Static4.playing == false:
			Static_Playing = false
		$Static1.stop()
		$Static2.stop()
		$Static3.stop()
		$Static5.stop()
	if Static5 == true:
		Static_Playing = true
		_PlayStatic5(delta)
		if $Static5.playing == false:
			Static_Playing = false
		$Static1.stop()
		$Static2.stop()
		$Static3.stop()
		$Static4.stop()

	var prev_hz = 0
	for i in range(1,VU_COUNT+1):
		var hz = (i * FREQ_MAX) / VU_COUNT;
		var f = spectrum.get_magnitude_for_frequency_range(prev_hz,hz)
		var energy = clamp((MIN_DB + linear_to_db(f.length()))/MIN_DB,0,1)
		var height = energy * HEIGHT
		prev_hz = hz
		
		
		var bottomRightRect = bottomRightArray[i - 1]
		var topRightRect = topRightArray[i - 1]
		
		var tween = get_tree().create_tween()
		tween.tween_property(bottomRightRect, "size", Vector2(bottomRightRect.size.x, height), 0.05)
		tween.tween_property(topRightRect, "size", Vector2(topRightRect.size.x, height), 0.05)

func _PlayStatic1(delta):
	if $Static1.playing == false && Static_Played == true:
		$Static1.play()
		static_length = $Static1.stream.get_length() - 3
		Static_Played = false
	if $Static1.playing == true:
		static_length -= 1 * delta

func _PlayStatic2(delta):
	if $Static2.playing == false && Static_Played == true:
		$Static2.play()
		Static_Played = false
		static_length = $Static2.stream.get_length() - 3
		Static_Played = false
	if $Static2.playing == true:
		static_length -= 1 * delta

func _PlayStatic3(delta):
	if $Static3.playing == false && Static_Played == true:
		$Static3.play()
		Static_Played = false
		static_length = $Static3.stream.get_length() - 3
		Static_Played = false
	if $Static3.playing == true:
		static_length -= 1 * delta

func _PlayStatic4(delta):
	if $Static4.playing == false && Static_Played == true:
		$Static4.play()
		Static_Played = false
		static_length = $Static4.stream.get_length() - 3
		Static_Played = false
	if $Static4.playing == true:
		static_length -= 1 * delta

func _PlayStatic5(delta):
	if $Static5.playing == false && Static_Played == true:
		$Static5.play()
		Static_Played = false
		static_length = $Static5.stream.get_length() - 3
		Static_Played = false

	if $Static5.playing == true:
		static_length -= 1 * delta
