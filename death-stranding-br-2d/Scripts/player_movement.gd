extends CharacterBody2D

@export var movement_speed : float = 1000
var character_direction : Vector2

func _physics_process(_delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	
	if character_direction and GameManager.cargo == 0 or 1:
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		
	if character_direction and GameManager.cargo >= 2:
		velocity = character_direction * movement_speed / GameManager.cargo * 1.5
	
	move_and_slide()

var cargo_scene := preload("res://Scenes/carga.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Q") and GameManager.cargo > 0:
		GameManager.remove_cargo()
		drop_item()
	
func drop_item() -> void:
	var dropped_item = cargo_scene.instantiate()
	dropped_item.global_position = global_position
	get_tree().current_scene.add_child(dropped_item)
