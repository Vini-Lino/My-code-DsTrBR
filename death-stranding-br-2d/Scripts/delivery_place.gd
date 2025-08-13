extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
var is_player_inside = false
var is_delivered = false

func _on_body_entered(_body) -> void:
	is_player_inside = true

func _on_body_exited(_body) -> void:
	is_player_inside = false

func _physics_process(_delta: float) -> void:
	if is_player_inside == true and Input.is_action_just_pressed("E"):
		if GameManager.cargo >= 1 and is_delivered == false:
			GameManager.remove_cargo()
			GameManager.add_delivery()
			animated_sprite.play("delivered")
			is_delivered = true
		else:
			print("You have no cargo, or already delivered!")
