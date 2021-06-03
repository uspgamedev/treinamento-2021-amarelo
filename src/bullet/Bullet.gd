extends KinematicBody2D


export var speed := 600; 
var direction = Vector2();


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	var velocity = direction * speed * delta;
	velocity = move_and_collide(velocity);


func _on_Hitbox_body_entered(body):
	queue_free();


func _on_Timer_timeout():
	queue_free();
