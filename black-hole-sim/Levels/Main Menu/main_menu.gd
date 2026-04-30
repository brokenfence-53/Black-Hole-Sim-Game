extends CanvasLayer
@onready var main_menu: CanvasLayer = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer/AnimationPlayer.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_continue_pressed() -> void:
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://Levels/level_1.tscn") 


func _on_new_game_pressed() -> void:
	get_tree().paused = false 
	Global.restart = true
	Global.transition_out = true 
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")



func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().paused = false 
	get_tree().quit() 
