extends Camera2D
@onready var camera_2d_player: Camera2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera_2d_player.scale =  Vector2(Global.playerscale,Global.playerscale)
