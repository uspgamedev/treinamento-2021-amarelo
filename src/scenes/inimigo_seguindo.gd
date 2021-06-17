extends KinematicBody2D

onready var player = get_node("res://Player.tscn")
onready var player2 = get_node("res://Player2.tscn")
var velocity = Vector2()
var speed = 400

func _process(delta):
	if player.position.x > position.x:
		velocity.x += speed
	if player.position.x < position.x:
		velocity.x -= speed
	if player.position.y > position.y:
		velocity.y += speed
	if player.position.y < position.y:
		velocity.y -= speed

func _physics_process(delta):
	velocity = move_and_slide(velocity * delta)
