extends CharacterBody2D

@onready var game_manager = %GameManager
@export var movement_speed : float = 1000
var character_direction : Vector2

func _physics_process(delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	
	if character_direction and game_manager.cargo == 0 or 1:
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		
	if character_direction and game_manager.cargo >= 2:
		velocity = character_direction * movement_speed / game_manager.cargo * (game_manager.cargo / 2)
	
	move_and_slide()
