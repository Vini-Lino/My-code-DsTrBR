extends Area2D

var scene = preload("res://Assets/carga.png")

#func _ready():
#	add_to_group("NodesGroup")

var is_player_inside = false

func _on_body_entered(_body):
	is_player_inside = true

func _on_body_exited(_body: Node2D) -> void:
	is_player_inside = false

func _physics_process(_delta):
	if is_player_inside == true and Input.is_action_just_pressed("E"):
		if GameManager.cargo < 9:
			GameManager.add_cargo()
			queue_free()
		else:
			print("carga is full!")

#func _process(delta: float):
	#if Input.is_action_pressed()
#var instance = scene.instantiate()
#add_child(instance)
