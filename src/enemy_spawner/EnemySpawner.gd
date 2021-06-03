extends Position2D

export var enemy_scene : PackedScene

export var wait_time_min : float = 2.0
export var wait_time_max : float = 10.0


# Called when the node enters the scene tree for the first time.
func _ready():
	setup_timer()
	$Timer.start()


# Adiciona uma nova instância do inimigo selecionado na cena principal após o final do ciclo do Timer.
func _on_Timer_timeout():
	var enemy = enemy_scene.instance()
	enemy.position = position
	get_parent().add_child(enemy) # TODO - Wil disse para não fazer isso.
	setup_timer()
	

# Seleciona um valor aleatório dentro do intervalo para o novo ciclo do Timer.
func setup_timer():
	$Timer.wait_time = rand_range(wait_time_min, wait_time_max)
