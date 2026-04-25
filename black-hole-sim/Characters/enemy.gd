extends CharacterBody2D

class_name MoonEnemy
var player_node: CharacterBody2D 
var speed: float = 200.0
var points: float = 10.0
var sshould_chase: bool = false
var dead: bool = false
var talking_damage: bool = false
var dir: Vector2
var is_roaming: bool = true



func _physics_process(delta: float) -> void:
	if sshould_chase:
		var direction = (player_node.global_position-global_position).normalized()
		velocity = lerp(velocity , direction*speed , 0.5*delta)
		move_and_slide()

func handle_death():
	self.queue_free()
	Global.score = points + Global.score
	##where we change global score

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player_node:
		print("Area2D")


@warning_ignore("unused_parameter")
func _on_enter_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == player_node:
		print("entered body")
		sshould_chase = true
		await get_tree().create_timer(2.0).timeout
		visible = false
		handle_death()


@warning_ignore("unused_parameter")
func _on_exit_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == player_node:
		sshould_chase = false
		
