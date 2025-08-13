extends CharacterBody2D

@export var movement_speed : float = 1000
var character_direction : Vector2
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(_delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	
	if character_direction and GameManager.cargo == 0 or 1:
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		
	if character_direction and GameManager.cargo >= 2:
		velocity = character_direction * movement_speed * 2 / ((GameManager.cargo + 1) / 1.5)
		
	if Input.is_action_pressed("Shift") and StaminaSc.staminaDown == false: #and StaminaSc.stamina.value != 0:
#		StaminaSc.stamina.value -= 10
#		StaminaSc.can_regen = false
#		StaminaSc.s_timer = 0
		velocity = velocity * 2
		print(velocity)
		
	#else:
	#	if character_direction and GameManager.cargo == 0 or 1:
	#		velocity = character_direction * movement_speed
	#	else:
	#		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
	#	
	#	if character_direction and GameManager.cargo >= 2:
	#		velocity = character_direction * movement_speed / GameManager.cargo * 1.5
	
	move_and_slide()
	
	if Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		if GameManager.cargo == 0:
			if not Input.is_action_pressed("Shift"):
				animated_sprite.play("walking")
		if GameManager.cargo >= 1:
			if not Input.is_action_pressed("Shift"):
				animated_sprite.play("walking_cargo")
	if not Input.is_action_pressed("move_up"):
		if not Input.is_action_pressed("move_down"):
			if not Input.is_action_pressed("move_left"):
				if not Input.is_action_pressed("move_right"):
					if not Input.is_action_pressed("Shift"):
						if GameManager.cargo == 0:
							animated_sprite.play("idle")
						if GameManager.cargo >= 1:
							animated_sprite.play("idle_cargo")
	if Input.is_action_pressed("Shift"):
		if GameManager.cargo == 0:
			animated_sprite.play("motorcycle")
		if GameManager.cargo >= 1:
			animated_sprite.play("motorcycle_cargo")

var cargo_scene := preload("res://Scenes/carga.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Q") and GameManager.cargo > 0:
		GameManager.remove_cargo()
		drop_item()
	look_at(get_global_mouse_position())
	var joystick_x = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)  # Right thumbstick horizontal
	var joystick_y = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)  # Right thumbstick vertical

	# Create a direction vector from the joystick input
	var direction = Vector2(joystick_x, joystick_y)

	# Check if the direction vector has a significant length
	if direction.length() > 0:
		# Calculate the angle in radians
		var angle = direction.angle()

		# Rotate the player to face the direction of the thumbstick
		rotation = angle
	
func drop_item() -> void:
	var dropped_item = cargo_scene.instantiate()
	dropped_item.global_position = global_position
	get_tree().current_scene.add_child(dropped_item)
