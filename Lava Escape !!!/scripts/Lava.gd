extends KinematicBody2D
var StartSpeed = -100
var GoFaster = 0
# Lava is just going UP
var motion = Vector2()
func _physics_process(delta):
	motion.y = Global.Lava_Speed
	move_and_slide(motion)