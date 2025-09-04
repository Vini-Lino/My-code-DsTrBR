extends CharacterBody2D
class_name Player

signal player_fired_bullet(bullet, position, direction)
@export var Bullet :PackedScene
@export var movement_speed : float = 400
var character_direction : Vector2
@onready var animated_sprite = $AnimatedSprite2D
@onready var end_of_gun = $EndOfGun
@onready var gun_direction = $GunDirection
@onready var attack_cooldown = $AttackCooldown
@onready var health_stat = $Health
var is_shoot = false

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
		velocity = velocity * 3
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
		if GameManager.cargo == 0 and is_shoot == false:
			if not Input.is_action_pressed("Shift"):
				animated_sprite.play("walking")
		if GameManager.cargo >= 1 and is_shoot == false:
			if not Input.is_action_pressed("Shift"):
				animated_sprite.play("walking_cargo")
		if GameManager.cargo == 0 and is_shoot == true and attack_cooldown.is_stopped():
			if not Input.is_action_pressed("Shift"):
				animated_sprite.play("shoot_idle")
		if GameManager.cargo >= 1 and is_shoot == true and attack_cooldown.is_stopped():
			if not Input.is_action_pressed("Shift"):
				animated_sprite.play("shoot_cargo_idle")
	if not Input.is_action_pressed("move_up"):
		if not Input.is_action_pressed("move_down"):
			if not Input.is_action_pressed("move_left"):
				if not Input.is_action_pressed("move_right"):
					if not Input.is_action_pressed("Shift"):
						if GameManager.cargo == 0 and is_shoot == false:
							animated_sprite.play("idle")
						if GameManager.cargo >= 1 and is_shoot == false:
							animated_sprite.play("idle_cargo")
						if GameManager.cargo >= 1 and is_shoot == true and attack_cooldown.is_stopped():
							animated_sprite.play("shoot_cargo_idle")
	if Input.is_action_pressed("Shift") and is_shoot == false:
		if GameManager.cargo == 0:
			animated_sprite.play("motorcycle")
			if Input.is_action_just_released("Shift"):
				animated_sprite.play("idle")
		if GameManager.cargo >= 1:
			animated_sprite.play("motorcycle_cargo")
			if Input.is_action_just_released("Shift"):
				animated_sprite.play("idle_cargo")
	if Input.is_action_pressed("Shift") and is_shoot == true:
		if GameManager.cargo == 0:
			animated_sprite.play("motorcycle_shoot_idle")
			if Input.is_action_just_released("Shift"):
				animated_sprite.play("shoot_idle")
		if GameManager.cargo >= 1:
			animated_sprite.play("motorcycle_cargo_shoot_idle")
			if Input.is_action_just_released("Shift"):
				animated_sprite.play("shoot_cargo_idle")

var cargo_scene := preload("res://Scenes/carga.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Q") and GameManager.cargo > 0:
		GameManager.remove_cargo()
		drop_item()
	look_at(get_global_mouse_position())
	var joystick_x = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
	var joystick_y = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)

	var direction = Vector2(joystick_x, joystick_y)

	if direction.length() > 0:
		var angle = direction.angle()

		rotation = angle
	
func drop_item() -> void:
	var dropped_item = cargo_scene.instantiate()
	dropped_item.global_position = global_position
	get_tree().current_scene.add_child(dropped_item)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()
		if is_shoot == false:
			is_shoot = true
		else:
			is_shoot = false
	if event.is_action_pressed("MouseLeft") and is_shoot == true and attack_cooldown.is_stopped():
		if GameManager.cargo == 0:
			animated_sprite.play("shoot")
			var bullet_instance = Bullet.instantiate()
			var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
			emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)
			attack_cooldown.start()
		elif GameManager.cargo >= 1:
			animated_sprite.play("shoot_cargo")
			var bullet_instance = Bullet.instantiate()
			var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
			emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)
			attack_cooldown.start()

func shoot():
	if is_shoot == false:
		animated_sprite.play("shoot_idle")
		print("gun")
	if is_shoot == true:
		print("not gun")
	#a useful tutorial that i am going to follow later https://www.youtube.com/watch?v=ggt05fCiH7M&list=PLpwc3ughKbZexDyPexHN2MXLliKAovkpl&index=3

func handle_hit():
	health_stat.health -= 20
	print("player hit! ", health_stat)
