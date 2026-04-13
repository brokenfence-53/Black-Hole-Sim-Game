extends CharacterBody2D
@export var movement_speed : float = 200.0

func _physics_process(delta: float) -> void:
	var input_movement = Vector2 (
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up") 
	).normalized() 
	
	velocity = input_movement * movement_speed
	move_and_slide()
	
