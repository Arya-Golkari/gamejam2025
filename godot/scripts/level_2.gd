extends Node2D

var notes = Array()
@export var fanfare_player_path : NodePath
var fanfare_player : AudioStreamPlayer

var done : bool = false
var fanfare_done : bool = false

@export var closed_door : Texture2D
@export var open_door: Texture2D

@onready var c4_player : AudioStreamPlayer = $XylophoneC4Player
@onready var e4_player : AudioStreamPlayer = $XylophoneE4Player
@onready var g4_player : AudioStreamPlayer = $XylophoneG4Player
@onready var timer : Timer = $Timer
@onready var background : Sprite2D = $Background
@onready var player : Node2D = $Player
@onready var wall_left : Node2D = $WallLeft

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background.texture = closed_door
	fanfare_player = get_node(fanfare_player_path)
	
	var position_x = -245
	player.position = Vector2(position_x, 530)
	wall_left.position = Vector2(position_x + 40, 390)
	
	timer.start(1)
	await timer.timeout
	
	while position_x < -30:
		position_x += 2
		await get_tree().create_timer(0.01).timeout
		player.position = Vector2(position_x, player.position.y)
		wall_left.position = Vector2(position_x + 40, wall_left.position.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (notes.slice(-7, notes.size()+1) == ["C4", "E4", "G4", "E4", "G4", "E4", "C4"]) and (not fanfare_done):
		done = true
		
	if done and (not fanfare_done):
		fanfare_done = true
		timer.start(1)
		fanfare_player.play()
		
		await timer.timeout
		background.texture = open_door
		
		done = false


func fanfare() -> void:
	timer.start(1)
	fanfare_player.play()
	
	await timer.timeout
	background.texture = open_door


func play_random(db) -> void:
	var random_int = randi_range(0, 2)
	if random_int == 0:
		c4_player.volume_db = db
		c4_player.play()
	elif random_int == 1:
		e4_player.volume_db = db
		e4_player.play()
	else:
		g4_player.volume_db = db
		g4_player.play()


func background_music() -> void:
	var random_time : float
	var max_time : float = 0.2
	var db : float = 0
	
	for i in range(10):
		random_time = randf_range(0.1, max_time)
		timer.start(random_time)
		play_random(db)
		
		max_time += 0.05
		db -= 4
		
		await timer.timeout
		
	c4_player.volume_db = 0
	e4_player.volume_db = 0
	g4_player.volume_db = 0


func _on_xylophone_note(note: String) -> void:
	notes.append(note)


func _on_play_background() -> void:
	if not fanfare_done:
		background_music()


func _on_player_ready_to_leave() -> void:
	if fanfare_done:
		get_tree().change_scene_to_file("res://scenes/level3.tscn")
