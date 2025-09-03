extends Node2D

#@export var Bullet :PackedScene
#@onready var end_of_gun = $EndOfGun
#@onready var gun_direction = $GunDirection
#@onready var attack_cooldown = $AttackCooldown
#@onready var animated_sprite = $"../AnimatedSprite2D"
#var is_shoot = false

#func shoot():
#	var bullet_instance = Bullet.instantiate()
#	var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
#	emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)

#func _unhandled_input(event: InputEvent) -> void:
#	if event.is_action_released("shoot"):
#		shoot()
#		if is_shoot == false:
#			is_shoot = true
#		else:
#			is_shoot = false
#	if event.is_action_pressed("MouseLeft") and is_shoot == true and attack_cooldown.is_stopped():
#		animated_sprite.play("shoot")
#		var bullet_instance = Bullet.instantiate()
#		var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
#		emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, direction)
#		attack_cooldown.start()

#func shoot_a():
#	if is_shoot == false:
#		animated_sprite.play("shoot_idle")
#		print("gun")
#	if is_shoot == true:
#		print("not gun")
