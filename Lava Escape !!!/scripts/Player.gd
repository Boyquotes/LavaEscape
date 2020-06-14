extends KinematicBody2D

const UP = Vector2(0,-1)
var motion = Vector2()
var gravity = 10
var jump_force = -450
var speed = 500
var velocity = Vector2()
var QuartCercle = -1.5708
var DemiCercle = -3.14159

func _physics_process(delta):
	# look for collision
	Look_for_collision(delta)
	# Create gravity
	velocity.y += gravity
	# Set player velocity
	velocity = move_and_slide(velocity, UP)
	


func Look_for_collision(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		if collision.collider.name == "Coin":
			Global.Level += 1
			Global.Lava_Speed += Global.Lava_GoFaster
			print(Global.Lava_Speed)
			get_tree().change_scene("res://scenes/Menu.tscn")
		elif collision.collider.name == "Lava":
			Global.Etat = "MORT"
			get_tree().change_scene("res://scenes/Menu.tscn")

func _input(event):
	if event.is_pressed():
			var angle = get_angle_to(event.position)
			var Position = get_node("Box1").get_global_position()
			if QuartCercle <= angle && angle < 0:
				var m = speed / QuartCercle
				velocity.y = (jump_force * angle) / QuartCercle
				velocity.x = (-m * angle) + speed
			elif angle < QuartCercle:
				var m = -speed / DemiCercle
				velocity.y = (jump_force * QuartCercle) / angle
				velocity.x = (-m * angle) - speed