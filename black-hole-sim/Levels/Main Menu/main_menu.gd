extends CanvasLayer
@onready var main_menu: CanvasLayer = $"."
@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
@onready var exlpoding_sun: VideoStreamPlayer = $"Exlpoding sun"
var fade_out: bool = false
@onready var margin_container: MarginContainer = $MarginContainer
@onready var your_a_black_hole: Label = $"MarginContainer/HBoxContainer/VBoxContainer/Your a Black Hole"
@onready var new_game: Button = $"MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/New Game"
@onready var credits: Button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Credits
@onready var quit: Button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Quit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"VideoStreamPlayer".play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fade_out != true:
		return
	your_a_black_hole.modulate.a -= 0.04
	new_game.modulate.a -= 0.04
	credits.modulate.a -= 0.04
	quit.modulate.a -= 0.04


func _on_continue_pressed() -> void:
	pass

func _on_video_stream_player_finished() -> void:
	fade_out = true
	exlpoding_sun.play()
	
func _on_new_game_pressed() -> void:
	Global.restart = true
	video_stream_player.loop = false
	

	



func _on_credits_pressed() -> void:
	Global.restart = true
	LoadingScreen.change_scene_to("res://Levels/credits.tscn")


func _on_quit_pressed() -> void:
	get_tree().paused = false 
	get_tree().quit() 


func _on_exlpoding_sun_finished() -> void:
	LoadingScreen.change_scene_to("res://Levels/level_1.tscn")
