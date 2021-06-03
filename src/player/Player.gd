extends KinematicBody2D

export var speed = 500;
export var bullet_scene: PackedScene;

var can_shoot : bool = true; 

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
	).normalized(); # TODO - não faz sentido usar get_action_strength e depois normalizar o vetor. O que vamos manter?


# Executado a cada frame.
# É possível atirar segurando o botão do mouse.
func _process(delta):
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot(get_global_mouse_position());
		can_shoot = false;
		$ShootingRate.start();

# Instancia um projétil na cena, com posição inicial próximo do Player e direção no sentido Player-Aim
func shoot(aim: Vector2):
	var bullet := bullet_scene.instance()
	bullet.direction = (aim - position).normalized(); # Aplica a direção no sentido do jogador à região de clique do mouse.
	bullet.position = position + bullet.direction * $Sprite.texture.get_width() * bullet.scale * 1.5; # A posição de início do projétil é a uma distância de 1.5x a largura do Sprite
	# TODO - essa fórmula para posição acima deverá ser alterada em um cenário em que o Sprite não possui dimensão quadrada ou circular.
	get_parent().add_child(bullet) #TODO - O Wil disse para não fazer isso, rs

# Após o intervalo, o Player pode disparar um projétil novamente.
func _on_ShootingRate_timeout():
	can_shoot = true;
