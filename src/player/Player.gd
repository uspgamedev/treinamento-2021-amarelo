extends KinematicBody2D

export var speed = 500;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Atualiza a cada frame.
# No momento processa somente o movimento do jogador.
func _physics_process(delta):
	var direction = calculate_direction();
	var velocity = direction * speed;
	velocity = move_and_slide(velocity);

# Calcula a direção do movimento do jogador em relação aos inputs pressionados no momento.
# Devolve um vetor normalizado (assim o jogador não se move mais rápido na diagonal).
func calculate_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 	# eixo x
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")		# eixo y
	).normalized();
