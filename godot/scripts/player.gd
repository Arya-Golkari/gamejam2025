extends CharacterBody2D

@export var speed = 200

func get_input():
	var direction = Input.get_vector("Left", "Right", "None", "None")
	velocity = speed * direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
