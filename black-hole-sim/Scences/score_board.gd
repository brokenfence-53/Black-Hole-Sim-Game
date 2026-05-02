extends CanvasLayer

@export var minutes: int = 0
@export var seconds: int = 0
var dsec = 0

@onready var min: RichTextLabel = $CenterContainer/VBoxContainer/HBoxContainer3/Min
@onready var sec: RichTextLabel = $CenterContainer/VBoxContainer/HBoxContainer3/Sec
@onready var millisec: RichTextLabel = $CenterContainer/VBoxContainer/HBoxContainer3/Millisec

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


#trying to make is dissapaear on main menu
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if seconds > 0 and dsec <= 0:
		seconds -= 1
		dsec = 10
	if minutes > 0 and seconds <= 0:
		minutes -= 1
		seconds = 60
		
	if seconds >= 10:
		$CenterContainer/VBoxContainer/HBoxContainer3/Sec.text = str(seconds)
	else: 
		$CenterContainer/VBoxContainer/HBoxContainer3/Sec.text = str("0"+str(seconds))
	if dsec >= 10:
		$CenterContainer/VBoxContainer/HBoxContainer3/Millisec.text = str(dsec)
	else: 
		$CenterContainer/VBoxContainer/HBoxContainer3/Millisec.text = str("0"+str(dsec))
	if minutes >= 10:
		$CenterContainer/VBoxContainer/HBoxContainer3/Min.text = str(minutes)
	else: 
		$CenterContainer/VBoxContainer/HBoxContainer3/Min.text = str("0"+str(minutes))
	if minutes == 0 and seconds == 0 and dsec == 0:
		LoadingScreen.change_scene_to("res://Levels/end_credits.tscn")
	
func _on_timer_timeout() -> void:
	dsec -= 1
	Global.millisecond += 1
	
	
func _on_time_late_timeout() -> void:
	pass # Replace with function body.
