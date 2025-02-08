extends Area2D

signal play_background
var original_scale = Vector2(1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	scale = 2 * original_scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("play_background")


#func _on_mouse_entered() -> void:
	#print("mouse entered")
	#scale = original_scale * 2
#
#
#func _on_mouse_exited() -> void:
	#print("mouse exited")
	#scale = original_scale
