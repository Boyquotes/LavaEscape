extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
		Spawn_Random_Walls(608, 288)
		Spawn_Random_Walls(608, 448)
		Spawn_Random_Walls(400, 608)
		Spawn_Random_Walls(400, 768)
		Spawn_Random_Walls(400, 928)
		Spawn_Random_Walls(400, 1088)
		Spawn_Random_Walls(400, 1248)

func Spawn_Random_Walls(var maxX ,var y):
	randomize()
	var position = Vector2()
	position.x = rand_range(64, maxX)
	position.y = y
	var scene = load("res://scenes/LittleWall.tscn")
	var scene_instance = scene.instance()
	scene_instance.position = position
	scene_instance.set_name("scene")
	add_child(scene_instance)