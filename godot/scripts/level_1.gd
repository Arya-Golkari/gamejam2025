extends Node2D

var notes = Array()
@export var fanfare_player_path : NodePath
var fanfare_player : AudioStreamPlayer

@export var closed_door : Texture2D
@export var open_door: Texture2D

@onready var c4_player : AudioStreamPlayer = $XylophoneC4Player
@onready var e4_player : AudioStreamPlayer = $XylophoneE4Player
@onready var timer : Timer = $Timer
@onready var background : Sprite2D = $Background

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background.texture = closed_door
	fanfare_player = get_node(fanfare_player_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(notes)
	if notes.slice(-6, notes.size()+1) == ["E4", "C4", "C4", "E4", "E4", "C4"]:
		timer.start(1)
		fanfare_player.play()
		
		await timer.timeout
		background.texture = open_door


func background_music() -> void:
	timer.start(0.5)
	c4_player.play()
	
	await timer.timeout
	
	timer.start(0.5)
	e4_player.play()
	
	await timer.timeout
	
	timer.start(0.5)
	c4_player.play()
	
	await timer.timeout
	
	timer.start(0.5)
	e4_player.play()
	
	await timer.timeout
	
	c4_player.play()


func _on_xylophone_note(note: String) -> void:
	notes.append(note)


func _on_play_background() -> void:
	background_music()
