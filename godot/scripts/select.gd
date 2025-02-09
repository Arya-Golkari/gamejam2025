extends Button

@export var level = 0

func _on_pressed() -> void:
	print("skibid")
	get_tree().change_scene_to_file("res://scenes/level%s.tscn" % level)
