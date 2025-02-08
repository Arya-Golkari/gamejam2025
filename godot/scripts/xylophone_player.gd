extends Area2D

@export var note : String
@export var audio_player_path : NodePath

signal xylophone_note(note : String)

var audio_player : AudioStreamPlayer

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("xylophone_note", note)
			audio_player.play()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player = get_node(audio_player_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
