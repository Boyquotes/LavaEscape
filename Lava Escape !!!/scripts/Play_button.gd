extends TouchScreenButton

func _ready():
	SetTitle()
	
# Start the game
func _input(event):
	if event is InputEventMouseButton:  
		if event.pressed:  
			get_tree().change_scene("res://scenes/World.tscn")
			if Global.Etat == "MORT":
				Global.Etat = "START"
				Global.Lava_Speed = Global.Lava_Start_Speed
				Global.Level = 0
func SetTitle():
	if Global.Level > 0:
		get_node("/root/Menu/CanvasLayer/Title").set_text("Max score")
		get_node("/root/Menu/CanvasLayer/Title2").set_text(str(Global.Level))
	else:
		get_node("/root/Menu/CanvasLayer/Title").set_text("")
		get_node("/root/Menu/CanvasLayer/Title2").set_text("")