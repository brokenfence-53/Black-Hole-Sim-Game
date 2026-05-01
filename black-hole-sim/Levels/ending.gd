extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.died == true:
		self.text = str("You didn't survive...")
	else:
		self.text = str("YOU SURVIVED! Great job beating the time.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
