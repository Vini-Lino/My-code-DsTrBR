extends Area2D

@onready var game_manager = %GameManager

var scene = preload("res://Assets/carga.png")

func _ready():
	add_to_group("NodesGroup")

var is_player_inside = false

func _on_body_entered(body):
	is_player_inside = true

func _on_body_exited(body: Node2D) -> void:
	is_player_inside = false

func _physics_process(delta):
	while is_player_inside == true:
		if Input.is_action_pressed("E"):
			if game_manager.cargo <= 8:
				game_manager.add_cargo()
				queue_free()
				break
			else:
				print("carga is full!")
		await get_tree().create_timer(100000000).timeout

#func _process(delta: float):
	#if Input.is_action_pressed()
#var instance = scene.instantiate()
#add_child(instance)
