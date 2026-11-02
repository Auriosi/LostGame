extends Node2D

var Gameover = false
var Jumpscare = false
var Loading = true
var Gameended = false

var Fresh_Activation = true

var label_timer = 0
var label_toggle = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Open Menu"):
		visible = false
	
	if visible == true:
		scale = scale.lerp(Vector2(1.5,1.5),2 * delta)
		$"Fade Out".modulate = Color(225,225,225,(scale.x - 1) * 1.8)
	else:
		scale = Vector2(1,1)
	
	if scale.x >= 1.45 && $"../AudioVisualizer".Static_Playing == false:
		Loading = false
		$ColorRect.visible = true
		$Label.visible = false
		
	else:
		Loading = true
		$ColorRect.visible = false
		if scale.x >= 1.45:
			$Label.visible = true
		else:
			$Label.visible = false
		
		label_timer += delta
		if label_timer >= 0.5:
			label_toggle = false
			if $Label.text == str("Repositioning") && label_toggle == false:
				$Label.text = str("Repositioning.")
				label_timer = 0
				label_toggle = true
			if $Label.text == str("Repositioning.") && label_toggle == false:
				$Label.text = str("Repositioning..")
				label_timer = 0
				label_toggle = true
			if $Label.text == str("Repositioning..") && label_toggle == false:
				$Label.text = str("Repositioning...")
				label_timer = 0
				label_toggle = true
			if $Label.text == str("Repositioning...") && label_toggle == false:
				$Label.text = str("Repositioning")
				label_timer = 0
				label_toggle = true

	if Loading == false:
		$Ungliation.visible = true
		if Gameover == true && $".".visible == true:
			if Jumpscare == false:
				$Ungliation.play("Jumpscare")
				$Jumpscare.play()
				Jumpscare = true
			if $Ungliation.frame <= 8 && $Ungliation.animation == str("Jumpscare"):
				$ColorRect.modulate = Color("ff0000")
			else:
				$ColorRect.modulate = Color("191919ff")
		if Jumpscare == true:
			pass
		else:
			$ColorRect.modulate = Color("54320fff")

			$Ungliation.play("Ungliation")
	else:
		$ColorRect.modulate = Color("54320fff")
		$Ungliation.visible = false
