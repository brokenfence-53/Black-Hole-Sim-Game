extends Marker2D
@onready var enemynode : PackedScene = preload("res://Characters/enemy.tscn")
var enemyamt: int = 0.00
@export var point_1: Vector2 = Vector2(0,0)
@export var point_2: Vector2 = Vector2(2000,1000)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	# Replace with function body.
func _physics_process(delta: float) -> void:
	##if Input.is_action_just_pressed("mb"):
		##spawn(get_global_mouse_position())
	pass

func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x,p2.x)
	var y_value: float = randf_range(p1.y,p2.y)
	var random_point_inside: Vector2 = Vector2(x_value,y_value)
	return(random_point_inside)


func _spawn():
	var enemyinstance: Node = enemynode.instantiate()
	add_child(enemyinstance)
	var randomposition: Vector2 = get_random_point_inside(point_1,point_2)
	##var pos = instance.position 
	scale = Vector2.ONE * randf_range(0.009,0.012)
	enemyinstance.set_position(randomposition)
	


func _on_timer_timeout() -> void:
	if enemyamt<5:
		_spawn()
		enemyamt +=1
		print(enemyamt)
	else:
		pass
		
	
