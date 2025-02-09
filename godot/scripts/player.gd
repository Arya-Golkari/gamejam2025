extends CharacterBody2D

signal ready_to_leave

@export var speed = 800
@export var walking : Texture2D
@export var jumping : Texture2D

@onready var sprite : Sprite2D = $Sprite

#testing
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = walking
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("Left", "Right")
	velocity.x = speed * direction
	if direction:
		sprite.flip_h = direction < 0

	velocity += delta * get_gravity() * 10
	
	if is_on_floor():
		sprite.texture = walking

	if is_on_floor() and Input.is_action_pressed("Jump"):
		velocity.y = -2000
		sprite.texture = jumping

	move_and_slide()
	
	if global_position.x > 1350:
		var curScene = get_tree().current_scene.scene_file_path.split("/")[-1]
		var nextScene
		if curScene == "level0.tscn":
			nextScene = "res://scenes/level1.tscn"
			
		get_tree().change_scene_to_file(nextScene)
		
	if (520 < global_position.x) and (global_position.x < 760) and (not is_on_floor()):
		emit_signal("ready_to_leave")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
