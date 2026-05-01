extends Node2D
@onready var exlpoding_sun: VideoStreamPlayer = $"Exlpoding sun"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	 # Replace with function body.

func Restart():
	if Global.restart != true:
		return
	Global.enemyamt = 0.0
	Global.score = 0.0
	Global.playerscale = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.restart == true:
		get_tree().reload_current_scene()
		Global.restart = false
	else: 
		return

func _on_exlpoding_sun_finished() -> void:
	Restart()
