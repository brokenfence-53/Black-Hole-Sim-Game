extends CharacterBody2D

@onready var sprite_2d_3: Sprite2D = $Sprite2D3
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var sprite_2d: Sprite2D = $Sprite2D

var player_node: CharacterBody2D 
@export var speed: float = 0.0
var points: float = 1.0
var sshould_chase: bool = false
var dead: bool = false
var talking_damage: bool = false
var dir: Vector2
var is_roaming: bool = true
var enemyamt: float

func _ready() -> void:
	get_node("Sprite2D2").visible = false
	get_node("Sprite2D").visible = false
	get_node("Sprite2D3").visible = false
	randomize()
	var pngs = [1, 2, 3]
	var random_png = pngs[randi_range(0,pngs.size()-1)]
	if random_png == 1:
		get_node("Sprite2D").visible = true
	if random_png == 2:
		get_node("Sprite2D2").visible = true
	if random_png == 3:
		get_node("Sprite2D3").visible = true

func _physics_process(delta: float) -> void:
	if sshould_chase:
		var direction = (player_node.global_position-global_position).normalized()
		velocity = lerp(velocity , direction*speed , 0.5*delta)
		move_and_slide()

func handle_death():
	self.queue_free()
	Global.score = points + Global.score
	Global.playerscale = Global.playerscale + 0.01
	##where we change global score

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != player_node:
		return
	await get_tree().create_timer(1.0).timeout
	if body != player_node:
		return
	visible = false
	handle_death()

@warning_ignore("unused_parameter")
func _on_enter_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == player_node:
		#print("entered body")
		sshould_chase = true

@warning_ignore("unused_parameter")
func _on_exit_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == player_node:
		sshould_chase = false
		


	
