extends Button

var activated = false
var in_range = false
var upgradable = false
var upgraded = false
var function = null

func _on_pressed() -> void:
	if disabled == false && upgradable == true:
		disabled = true

func _on_mouse_entered() -> void:
	in_range = true
	if $"..".visible == true:
		$Hover.play()


func _on_mouse_exited() -> void:
	in_range = false

func _Play_Click_Sound():
	$Click.play()

func _Play_Fail_Sound():
	$Fail.play()
