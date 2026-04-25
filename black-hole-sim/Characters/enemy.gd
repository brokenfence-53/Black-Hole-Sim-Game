extends CharacterBody2D

class_name MoonEnemy
var player_node: CharacterBody2D 
@export var speed: float = 0.0
var points: float = 10.0
var sshould_chase: bool = false
var dead: bool = false
var talking_damage: bool = false
var dir: Vector2
var is_roaming: bool = true
var enemyamt: float


func _physics_process(delta: float) -> void:
	if sshould_chase:
		var direction = (player_node.global_position-global_position).normalized()
		velocity = lerp(velocity , direction*speed , 0.5*delta)
		move_and_slide()

func handle_death():
	self.queue_free()
	Global.score = points + Global.score
	enemyamt -= 1
	##where we change global score

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player_node:
		##start()
		pass


@warning_ignore("unused_parameter")
func _on_enter_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == player_node:
		print("entered body")
		sshould_chase = true


@warning_ignore("unused_parameter")
func _on_exit_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == player_node:
		sshould_chase = false
		


func _on_timer_timeout(body: Node2D) -> void:
	if body == player_node:
		visible = false
		handle_death()
