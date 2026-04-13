extends CharacterBody2D
## Video tut
const max_speed: float = 100.0
const acceleration: float = 50.0
const friction: float = 32.0

#dash
#how fash the character is going with a dash
const dash_speed: float = 5.0
#how long the dash is in sec
const dash_time: float = 0.25
#if someone is dashing
var dashing: bool = true
#how long a player has been dashing for
var dash_timer: float = 0.0
#direction the player is dashing towards
#var dash_dir: Vector2 = Vector2.ZERO
#amt of time between dash
var dash_reload_cost: float =0.5
#how long a player has not been dashing for
var dash_reload_timer: float = 0.0


func _physics_process(delta: float) -> void:
	if dash_timer == 0.0: #so player movment does not overide the dash
		var input_movement: Vector2 = Vector2(
			Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up") 
		).normalized()  ## making input return a 0/1/-1
		#creating velocity for both x,y so apply friction and accleration seperately to each axis
		#exp and the -( is a power function so it tells the each fraction of speed change
		# 1- makes it the amt applied into the amt remain
		## delta makes it so it works on lower and higher frame rates
		##lerp movment the object in a desired direction
		## lerp weight acts as a speed form point A to B
		var velocity_weight_x: float = 1.0 - exp( -(acceleration if input_movement.x else friction) * delta)
		velocity.x = lerp(velocity.x, input_movement.x * max_speed, velocity_weight_x)
		var velocity_weight_y: float = 1.0 - exp( -(acceleration if input_movement.y else friction) * delta)
		velocity.y = lerp(velocity.y, input_movement.y * max_speed, velocity_weight_y)
	_dash_logic(delta)
	move_and_slide()
func _dash_logic(delta: float) -> void:
	var dash_dir: Vector2 = Vector2 (velocity.x,velocity.y)
	if dashing and Input.is_action_just_pressed("dash"):
		dashing = false
		dash_timer = dash_time #starting dash timer
		dash_reload_timer = dash_reload_cost
		velocity = dash_dir * dash_speed
	if dash_timer > 0.0:
		dash_timer = max(0.0, dash_timer - delta)
		if is_on_wall():
			dash_timer = 0.0 #ends dash on a wall
	else: 
		if dash_reload_timer > 0.0:
			dash_reload_timer -= delta
		else:
			dashing = true
	#if input:
		#AnimationPlayer.play("walk")
	#else:
		#AnimationPlayer.play("idle")
		#this is for if I add an animation

	
