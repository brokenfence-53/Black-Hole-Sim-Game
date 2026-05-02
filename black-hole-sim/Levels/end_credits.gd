extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.score = Global.score
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_main_menu_pressed() -> void:
	get_tree().paused = false 
	Global.restart = true
	LoadingScreen.change_scene_to("res://Levels/Main Menu/main_menu.tscn")

func _on_credits_pressed() -> void:
	LoadingScreen.change_scene_to("res://Levels/credits.tscn")

func _on_quit_pressed() -> void:
	get_tree().paused = false 
	get_tree().quit() 
