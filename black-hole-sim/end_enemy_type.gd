extends CharacterBody2D
@onready var end_enemy_type: CharacterBody2D = $"."

var player_node: CharacterBody2D 
@export var speed: float = 0.0
var set_up: bool = true
var move_speed: int = 80
var gravity: float = 4.0
const max_gravity: float = 5.5

func _ready() -> void:
	get_node("Earth").visible = false
	get_node("MOON").visible = false
	get_node("Neuron").visible = false
	get_node("I_O").visible = false
	get_node("Sun").visible = false
	randomize()
	var pngs = [1,2,3,4,5]
	var random_png = pngs[randi_range(0,pngs.size()-1)]
	if random_png == 1:
		get_node("Earth").visible = true
	if random_png == 2:
		get_node("MOON").visible = true
	if random_png == 3:
		get_node("Neuron").visible = true
	if random_png == 4:
		get_node("I_O").visible = true
	if random_png == 5:
		get_node("Sun").visible = true


func _physics_process(delta: float) -> void:
	gravity = lerp(gravity, max_gravity,12.0*delta)
	velocity.y += gravity
	move_and_slide()
	await get_tree().create_timer(7.0).timeout
	handle_death()

	
func handle_death():
	Global.endenemyamt -= 1
	self.queue_free()
	
