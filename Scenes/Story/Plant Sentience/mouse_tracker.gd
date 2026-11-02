extends Node2D

var detected = 0

var Layer_4 = false
var Layer_5 = false
var Layer_6 = false
var Layer_7 = false
var Layer_8 = false
var Layer_9 = false
var Layer_10 = false

var value = 0

var altered_position = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(value)
	altered_position = get_global_mouse_position()
	position = altered_position + Vector2(-2,-2)
	if detected > 2:
		pass
	if Layer_10 == true:
		value = 10
	elif Layer_9 == true:
		value = 9
	elif Layer_8 == true:
		value = 8
	elif Layer_7 == true:
		value = 7
	elif Layer_6 == true:
		value = 6
	elif Layer_5 == true:
		value = 5
	elif Layer_4 == true:
		value = 4
	else:
		value = 0


func _on_layer_4_area_entered(area: Area2D) -> void:
	Layer_4 = true


func _on_layer_4_area_exited(area: Area2D) -> void:
	Layer_4 = false


func _on_layer_5_area_entered(area: Area2D) -> void:
	Layer_5 = true


func _on_layer_5_area_exited(area: Area2D) -> void:
	Layer_5 = false


func _on_layer_6_area_entered(area: Area2D) -> void:
	Layer_6 = true


func _on_layer_6_area_exited(area: Area2D) -> void:
	Layer_6 = false


func _on_layer_7_area_entered(area: Area2D) -> void:
	Layer_7 = true


func _on_layer_7_area_exited(area: Area2D) -> void:
	Layer_7 = false


func _on_layer_8_area_entered(area: Area2D) -> void:
	Layer_8 = true


func _on_layer_8_area_exited(area: Area2D) -> void:
	Layer_8 = false


func _on_layer_9_area_entered(area: Area2D) -> void:
	Layer_9 = true


func _on_layer_9_area_exited(area: Area2D) -> void:
	Layer_9 = false


func _on_layer_10_area_entered(area: Area2D) -> void:
	Layer_10 = true


func _on_layer_10_area_exited(area: Area2D) -> void:
	Layer_10 = false
