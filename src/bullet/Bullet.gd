extends KinematicBody2D


export var speed := 600; 
var direction = Vector2();


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	var velocity = direction * speed * delta;
	velocity = move_and_collide(velocity);
