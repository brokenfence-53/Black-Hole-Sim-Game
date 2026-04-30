extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect

var scene_to_load: String

var color_rect_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func change_scene_to(scene_path: String) -> void:
	if color_rect_tween:
		color_rect_tween.kill()
	scene_to_load = scene_path
	get_tree().paused = true
	
	color_rect_tween = create_tween().set_trans(Tween.TRANS_SINE)
	#transition in
	color_rect_tween.tween_property(color_rect,"modulate:a", 1.0,0.2).connect("finished", _load_new_scene)
	#transition out
	color_rect_tween.chain().tween_property(color_rect, "modulate:a", 0.0,0.4)

	
func _load_new_scene() -> void:
	get_tree().call_deferred("change_scene_to_file", scene_to_load)
	get_tree().paused = false
