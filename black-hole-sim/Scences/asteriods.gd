extends CharacterBody2D
@onready var end_enemy_type: CharacterBody2D = $"."

var player_node: CharacterBody2D 
@export var speed: float = 0.0
var set_up: bool = true
var move_speed: int = 80
var gravity: float = 4.0
const max_gravity: float = 5.5

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
	gravity = lerp(gravity, max_gravity,12.0*delta)
	velocity.y += gravity
	move_and_slide()
	await get_tree().create_timer(7.0).timeout
	handle_death()

	
func handle_death():
	Global.endenemyamt -= 1
	self.queue_free()
	


func _on_timer_timeout() -> void:
	pass # Replace with function body.
