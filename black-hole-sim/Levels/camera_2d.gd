extends Camera2D
@onready var camera_2d_player: Camera2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	camera_2d_player.zoom =  Vector2(1/Global.playerscale,1/Global.playerscale)
