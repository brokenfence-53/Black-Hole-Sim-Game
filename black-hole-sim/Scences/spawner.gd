extends Node2D
@export var enemy_prefab: PackedScene
@export var target : CharacterBody2D 
@export var enemymax: float 
@export var enemyamt: float 
@export var point_1: Vector2 = Vector2(-8000,-8000)
@export var point_2: Vector2 = Vector2(8000,8000)
@onready var area_2d: Area2D = $Area2D

var enemy_can_spawn: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	# Replace with function body.
func _process(_delta: float) -> void:
	if !Global.enemyamt<enemymax:
		return
	else:
		_spawn()

func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x,p2.x)
	var y_value: float = randf_range(p1.y,p2.y)
	var random_point_inside: Vector2 = Vector2(x_value,y_value)
	return(random_point_inside)


func _spawn():
	enemyamt += 1
	var enemyinstance  = enemy_prefab.instantiate()
	add_child(enemyinstance)
	enemyinstance.player_node = target
	var randomposition: Vector2 = get_random_point_inside(point_1,point_2)
	##var pos = enemyinstance.position 
	enemyinstance.scale = Vector2.ONE * randf_range(0.09,0.12)
	enemyinstance.set_position(randomposition)
	
	
#func _physics_process(delta: float) -> void:
	##if Input.is_action_just_pressed("mb"):
		##_spawn()
		#pass

func _on_timer_timeout() -> void:
	pass
	
	







	
