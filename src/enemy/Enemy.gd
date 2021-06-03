extends KinematicBody2D


export var speed := 300;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Atualiza a cada frame, atualizando o movimento do inimigo.
func _physics_process(delta):
	var direction = calculate_direction();
	var velocity = direction * speed;
	velocity = move_and_slide(velocity);
	

# Calcula a direção do movimento do inimigo em relação ao posição do Player.
# Dessa forma, o inimigo sempre se move na direção do jogador, perseguindo-o.
func calculate_direction():
	return (get_parent().get_node("Player").position - position).normalized();
