extends TextureProgressBar

@onready var stamina = $"."
var can_regen = false
var time_to_wait = 1.5
var s_timer = 0
var can_start_stimer = true
var staminaDown = false

func _ready():
	stamina.value = stamina.max_value

func _process(delta):
	if can_regen == false && stamina.value != 100 or stamina.value == 0:
		can_start_stimer = true
		if can_start_stimer:
			s_timer += delta
			if s_timer >= time_to_wait:
				can_regen = true
				can_start_stimer = false
				s_timer = 0
	if stamina.value == 0:
		staminaDown = true

	if  stamina.value == 100:
		can_regen = false

	if can_regen == true:
		stamina.value += 0.5
		can_start_stimer = false
		s_timer = 0

	if Input.is_action_pressed("Shift") and stamina.value != 0:
		stamina.value -= 1
		can_regen = false
		s_timer = 0
		staminaDown = false
