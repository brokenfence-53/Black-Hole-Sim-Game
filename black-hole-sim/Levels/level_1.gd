extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Restart() # Replace with function body.

func Restart():
	if Global.restart != true:
		return
	Global.enemyamt = 0.0
	Global.score = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.restart == true:
		get_tree().reload_current_scene()
		Global.restart = false
	else: 
		return
