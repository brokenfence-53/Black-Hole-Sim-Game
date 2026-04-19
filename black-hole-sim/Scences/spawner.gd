extends Marker2D
var enemynode = preload("res://Characters/enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# Replace with function body.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("mb"):
		spawn(get_global_mouse_position())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn(pos):
	var instance = enemynode.instantiate()
	instance.position = pos
	scale = Vector2.ONE * randf_range(0.5,1.2)
	add_child(instance)
