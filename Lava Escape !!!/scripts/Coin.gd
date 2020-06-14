extends KinematicBody2D
# Coin is just moving LEFT and RIGHT
var motion = Vector2()
var collisionPlus = -25
	
func _physics_process(delta):
	motion.x = collisionPlus
	var collision = move_and_collide(motion * delta)
	if collision:
		if collision.collider.name == "SideWall2" ||collision.collider.name == "SideWall3":
			collisionPlus = 25
		elif collision.collider.name == "SideWall" || collision.collider.name == "SideWall4":
			collisionPlus = -25
		elif collision.collider.name == "Player" :
			Global.Level += 1
			Global.Lava_Speed += Global.Lava_GoFaster
			get_tree().change_scene("res://scenes/World.tscn")