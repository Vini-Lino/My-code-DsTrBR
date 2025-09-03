extends Node2D

@export var health: int = 100 : set = _set_state, get = _get_state

func _set_state(new_health):
	health = clamp(new_health, 0, 1000)

func _get_state():
	return health
