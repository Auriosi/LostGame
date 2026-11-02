extends Node2D

var teaser_level = 1

var timer = 3

var Text = false
var Cinematic_Level = 1
var Visible_Characters = 1
var timer_max_amount = 5
var Fade = 255


var Child_Animation_Transition = false
var Child_Fall = false
var Child_Crawl = false
var Cinematic_13 = true
var Plant_Lounge_1 = true
var Plant_Lounge_2 = true

var target_camera_x_value
var target_camera_y_value
var target_zoom_x_value
var target_zoom_y_value
var camera_speed = 0
var camera_speed_acceleration = 50

var Sparkling_Modulation = 0
var Flower_Gift = false
var Flower_Gift_Sound = false

var Voice_1 = false
var Voice_2 = false
var Voice_3 = false
var Voice_4 = false
var Voice_5 = false
var Voice_6 = false
var Voice_7 = false
var Voice_8 = false
var Voice_9 = false


func _ready():
	$Static.play()
	$Camera2D.position.x = 990.0
	$Camera2D.position.y = 510.0
	target_camera_x_value = 1100.0
	target_camera_y_value = 510.0
	target_zoom_x_value = 1
	target_zoom_y_value = 1
	

func _process(delta):
	if teaser_level == 1:
		timer -= 1 * delta
		if timer <= 0:
			timer = 3
			teaser_level = 2
			#get_tree().change_scene_to_file("res://Scenes/Lab/lab.tscn")
	if teaser_level == 2:
		$Camera2D/Label.text = str("Status: Alive")
		$"Flower 1".visible = true
		timer -= 1 * delta
		if timer <= 0:
			timer = 3
			teaser_level = 3
	if teaser_level == 3:
		$Camera2D/Label.text = str("Status: Active")
		$"Flower 1".visible = false
		$"Flower 2".visible = true
		timer -= 1 * delta
		if timer <= 0:
			timer = 3
			teaser_level = 4
	if teaser_level == 4:
		$Camera2D/Label.text = str("Status: ")
		$"Flower 1".visible = false
		$"Flower 2".visible = false
		$Sprite2D.texture = preload("res://Sprites/Story/Teaser/Containment Unit (Overgrown).png")
		timer -= 1 * delta
		
		if timer <= 0 && Cinematic_Level < 16:
			#print(timer)
			timer = timer_max_amount
			Cinematic_Level += 1
			Visible_Characters = 0
		if Cinematic_Level == 1:
			$"Flower 3 (Phase 1)".visible = true
			$Camera2D/Label.visible = false
			$"Camera2D/Text Screen".visible = false
			
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			Visible_Characters = 0
		if Cinematic_Level == 2:
			timer_max_amount = 10 # Placed here because it will affect the next Cinematic_Level
			
			$"Camera2D/Text Screen".visible = true
			
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("The Flower stood alone.")
			Visible_Characters += 10 * delta
			if Voice_1 == false:
				$"Voice 1".play()
				Voice_1 = true
		if Cinematic_Level == 3:
			timer_max_amount = 2 
			
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("And for some time, it wait for another person to come by.")
			Visible_Characters += 12 * delta
			if Voice_2 == false:
				$"Voice 2".play()
				Voice_2 = true
		if Cinematic_Level == 4:
			timer_max_amount = 6
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("")
			Visible_Characters += 10 * delta
		if Cinematic_Level == 5:
			timer_max_amount = 5
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("Until one day, it came across a child.")
			Visible_Characters += 10 * delta
			if Voice_3 == false:
				$"Voice 3".play()
				Voice_3 = true
		if Cinematic_Level == 6:
			$Child.visible = true
			$"Camera2D/Text Screen".visible = false
		if Cinematic_Level == 7:
			$Child.visible = false
			$"Camera2D/Text Screen".visible = true
			
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("This child however, wasn't sad.")
			Visible_Characters += 10 * delta
			if Voice_4 == false:
				$"Voice 4".play()
				Voice_4 = true
		if Cinematic_Level == 8:
			timer_max_amount = 3
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("It was afraid.")
			Visible_Characters += 10 * delta
			if Voice_5 == false:
				$"Voice 5".play()
				Voice_5 = true
		if Cinematic_Level == 9:
			timer_max_amount = 4
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("")
			Visible_Characters += 10 * delta
		if Cinematic_Level == 10:
			timer_max_amount = 10
			
			$"Camera2D/Text Screen".visible = true
			$"Flower 3 (Phase 1)".visible = false
			$"Flower 3 (Phase 2)".visible = true
			$"Flower 3 (Phase 1)".visible = false
			$"Flower 3 (Phase 2)".visible = true
			
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("So...")
			Visible_Characters += 5 * delta
			if Voice_6 == false:
				$"Voice 6".play()
				Voice_6 = true
		if Cinematic_Level == 11:
			$Child.visible = true
			$"Camera2D/Text Screen".visible = false
			
			camera_speed_acceleration = 40
			target_camera_x_value = 79.27
			target_camera_y_value = 702.95
			target_zoom_x_value = 2
			target_zoom_y_value = 2
			Camera_Position(delta)
			Light_Locate()
			if Child_Fall == false:
				$"Flower Lounge".play()
				$Camera2D.apply_shake(1)
				$"Flower 3 (Phase 2)/Front".play("Lunge 1")
				$"Flower 3 (Phase 2)/Back".play("Lunge 1")
				$"Flower 3 (Phase 2)/Blub".play("Lunge 1")
				$Child.play("Falling")
				Child_Fall = true
			if timer < 9.75 && timer > 8.5:
				$"Flower 3 (Phase 2)/Front".play("Idle 2")
				$"Flower 3 (Phase 2)/Back".play("Idle 2")
				$"Flower 3 (Phase 2)/Blub".play("Idle 2")
				if timer < 9:
					$Child.play("Crawling")
			if timer < 8.5:
				$"Flower 3 (Phase 2)/Front".play("Lunge 2")
				$"Flower 3 (Phase 2)/Back".play("Lunge 2")
				$"Flower 3 (Phase 2)/Blub".play("Lunge 2")
				if Child_Animation_Transition == false:
					Child_Animation_Transition = true
					if Child_Crawl == false:
						$Camera2D.apply_shake(4)
						Child_Crawl = true
			if $"Flower 3 (Phase 2)/Front".frame == 7 && Cinematic_13 == true:
				timer = 0
				Visible_Characters = 0
				Cinematic_13 = false
				
		if Cinematic_Level == 12:
			timer_max_amount = 9
			$Child.visible = false
			$"Camera2D/Text Screen".visible = true
			
			camera_speed = 0
			camera_speed_acceleration = 0
			$Camera2D.position.x = 410
			$Camera2D.position.y = 475
			$Camera2D.zoom.x = 4
			$Camera2D.zoom.y = 4
			$Child.position.x = 950
			Camera_Position(delta)
			$Camera2D.shake_strength = 0
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("It gave the child a gift.")
			$Gift.visible = true
			if timer < 5:
				Visible_Characters += 10 * delta
				if Voice_7 == false:
					$"Voice 7".play()
					Voice_7 = true
		if Cinematic_Level == 13:
			$Camera2D.position = $Gift.position

			$"Flower 3 (Phase 2)/Sparkling Light Node".visible = true
			if timer < 8 && timer > 7:
				if Flower_Gift_Sound == false:
					Flower_Gift_Sound = true
					$"Flower Gift Jingle".play()
				
			if timer < 7 && timer > 6.5:
				Sparkling_Modulate_Increase(delta)
			if timer < 6.5:
				if Flower_Gift == false:
					Flower_Gift = true
					$Gift.freeze = false
					$Gift.visible = true
					
				Sparkling_Modulate_Reduce(delta)
			
			$Child.visible = true
			$"Camera2D/Text Screen".visible = false
		if Cinematic_Level == 14:
			timer_max_amount = 10
			$Child.visible = false
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen/Text".text = str("A gift that would give them the strength to protect themselves and protect others.")
			Visible_Characters += 15 * delta
			$"Camera2D/Text Screen".visible = true
			if Voice_8 == false:
				$"Voice 8".play()
				Voice_8 = true
		if Cinematic_Level == 15:
			Visible_Characters += 15 * delta
			$"Camera2D/Text Screen/Text".text = str("So the child wouldn't have to fear for its life or the lives of others ever again.")
			$"Camera2D/Text Screen/Text".visible_characters = Visible_Characters
			$"Camera2D/Text Screen".visible = true
			if Voice_9 == false:
				$"Voice 9".play()
				Voice_9 = true
			timer_max_amount = 5
		if Cinematic_Level == 16:
			$Sprite2D.visible = false
			$"Flower 3 (Phase 2)".visible = false
			$Gift.visible = false
			$Child.visible = false
			if Fade > 0:
				Fade -= 45 * delta
			else:
				Fade = 0
			modulate = Color.from_rgba8(255, 255, 255, Fade)
			$Static.volume_db = 3 - ( (255 - Fade) / 6)
			if Fade <= 0:
				$Static.stop()

func Light_Locate():
	if $"Flower 3 (Phase 2)/Front".animation == "Idle 1":
		$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -18.25
		$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -46.14
		$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = 5.528
		$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -78.584
		$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = 35.083
		$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -61.696
		
	if $"Flower 3 (Phase 2)/Front".animation == "Lunge 1":
		if $"Flower 3 (Phase 2)/Front".frame == 0:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -18.25
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -46.14
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = 5.528
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -78.584
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = 35.083
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -61.696
		if $"Flower 3 (Phase 2)/Front".frame == 1 or $"Flower 3 (Phase 2)/Front".frame == 2 or $"Flower 3 (Phase 2)/Front".frame == 3:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -32.25
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -51.473
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -19.806
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -82.362
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = 20.861
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -69.918
		if $"Flower 3 (Phase 2)/Front".frame == 4 or $"Flower 3 (Phase 2)/Front".frame == 5:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -53.361
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -56.584
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -46.694
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -87.696
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -5.583
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -85.918
		if $"Flower 3 (Phase 2)/Front".frame == 6:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -72.25
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -57.251
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -72.028
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -85.029
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -33.583
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -95.029
	if $"Flower 3 (Phase 2)/Front".animation == "Idle 2":
		if $"Flower 3 (Phase 2)/Front".frame == 0 or $"Flower 3 (Phase 2)/Front".frame == 2:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -72.25
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -56.251
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -72.028
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -84.029
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -33.583
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -94.029
		if $"Flower 3 (Phase 2)/Front".frame == 1:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -72.25
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -55.251
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -72.028
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -83.029
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -33.583
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -93.029
		if $"Flower 3 (Phase 2)/Front".frame == 3:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -72.25
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -57.251
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -72.028
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -85.029
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -33.583
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -95.029
	if $"Flower 3 (Phase 2)/Front".animation == "Lunge 2":
		if $"Flower 3 (Phase 2)/Front".frame == 0 or $"Flower 3 (Phase 2)/Front".frame == 1:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -87.139
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -58.584
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -96.807
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -83.918
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -50.472
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -96.807
		if $"Flower 3 (Phase 2)/Front".frame == 2 or $"Flower 3 (Phase 2)/Front".frame == 3:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -99.583
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -52.362
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -112.028
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -83.918
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -76.028
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -105.029
		if $"Flower 3 (Phase 2)/Front".frame == 4 or $"Flower 3 (Phase 2)/Front".frame == 5:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -113.583
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -51.918
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -128.25
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -81.029
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -98.472
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -109.473
		if $"Flower 3 (Phase 2)/Front".frame == 6:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -128.472
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -43.251
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -142.028
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -77.918
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -116.472
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -111.696
		if $"Flower 3 (Phase 2)/Front".frame == 7:
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.x = -128.472
			$"Flower 3 (Phase 2)/Blub/Left Bulb".position.y = -43.251
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.x = -155.806
			$"Flower 3 (Phase 2)/Front/Middle Bulb".position.y = -63.473
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.x = -141.139
			$"Flower 3 (Phase 2)/Front/Right Bulb".position.y = -109.029

func Camera_Position(delta):
	camera_speed += camera_speed_acceleration * delta
	$Camera2D.scale = ($Camera2D.zoom / ($Camera2D.zoom * $Camera2D.zoom))
	if $Camera2D.position.x > target_camera_x_value:
		$Camera2D.position.x -= ( (($Camera2D.position.x - target_camera_x_value) * delta) * (camera_speed / 100) )
	if $Camera2D.position.x < target_camera_x_value:
		$Camera2D.position.x += ( ((target_camera_x_value - $Camera2D.position.x) * delta) * (camera_speed / 100) )

	if $Camera2D.position.y > target_camera_y_value:
		$Camera2D.position.y -= ( (($Camera2D.position.y - target_camera_y_value) * delta) * (camera_speed / 100) )
	if $Camera2D.position.y < target_camera_y_value:
		$Camera2D.position.y += ( ((target_camera_y_value - $Camera2D.position.y) * delta) * (camera_speed / 100) )
	# 1 2   3    4    5
	# 1 0.5 0.33 0.25 0.2
	# Scale = Zoom / (Zoom * Zoom)
	if $Camera2D.zoom.x > target_zoom_x_value:
		$Camera2D.zoom.x -= ( (($Camera2D.zoom.x - target_zoom_x_value) * delta) * (camera_speed / 100) )
	if $Camera2D.zoom.x < target_zoom_x_value:
		$Camera2D.zoom.x += ( ((target_zoom_x_value - $Camera2D.zoom.x) * delta) * (camera_speed / 100) )

	if $Camera2D.zoom.y > target_zoom_y_value:
		$Camera2D.zoom.y -= ( (($Camera2D.zoom.y - target_zoom_y_value) * delta) * (camera_speed / 100) )
	if $Camera2D.zoom.y < target_zoom_y_value:
		$Camera2D.zoom.y += ( ((target_zoom_y_value - $Camera2D.zoom.y) * delta) * (camera_speed / 100) )

func Sparkling_Modulate_Reduce(delta):
	$"Flower 3 (Phase 2)/Sparkling Light Node/PointLight Horizontal".color = Color(1,1,1,Sparkling_Modulation)
	$"Flower 3 (Phase 2)/Sparkling Light Node/PointLight Vertical".color = Color(1,1,1,Sparkling_Modulation)
	
	if Sparkling_Modulation > 0:
		Sparkling_Modulation -= 0.3 * delta
	else:
		if Sparkling_Modulation != 0:
			Sparkling_Modulation = 0

func Sparkling_Modulate_Increase(delta):
	$"Flower 3 (Phase 2)/Sparkling Light Node/PointLight Horizontal".color = Color(1,1,1,Sparkling_Modulation)
	$"Flower 3 (Phase 2)/Sparkling Light Node/PointLight Vertical".color = Color(1,1,1,Sparkling_Modulation)
	$"Gift/CollisionPolygon2D/Gift/Gift Light".color = Color(1,1,1,Sparkling_Modulation)
	if Sparkling_Modulation < 1:
		Sparkling_Modulation += 3.5 * delta
	elif Sparkling_Modulation > 1:
		Sparkling_Modulation = 1
	#else:
		#if Sparkling_Modulation != 0:
			#Sparkling_Modulation = 0
