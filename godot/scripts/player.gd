extends CharacterBody2D

@export var speed = 800

#testing
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("Left", "Right")
	velocity.x = speed * direction

	velocity += delta * get_gravity() * 10

	if is_on_floor() and Input.is_action_pressed("Jump"):
		velocity.y = -2000

	move_and_slide()
	
	if global_position.x > 1900:
		var curScene = get_tree().current_scene.scene_file_path.split("/")[-1]
		var nextScene
		if curScene == "level0.tscn":
			nextScene = "res://scenes/level1.tscn"
		elif curScene == "level1.tscn":
			nextScene = "res://scenes/level2.tscn"
			
		get_tree().change_scene_to_file(nextScene)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
