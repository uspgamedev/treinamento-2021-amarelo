extends KinematicBody2D


export var speed := 600; 
var direction = Vector2();


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	var velocity = direction * speed * delta;
	velocity = move_and_collide(velocity);

# Destrói o projétil em caso de colisão
# Se colidir com um inimigo, destrói o inimigo também.
func _on_Hitbox_body_entered(body):
	if body != null and body.is_in_group("enemies"):
		body.queue_free();
	queue_free();


# Destrói o projétil após o tempo determinado no Timer.
func _on_Timer_timeout():
	queue_free();
