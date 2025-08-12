#extends Control
#
#@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
#
#var is_open = false

#func _ready():
#	close()

#func _process(delta):
#	if Input.is_action_just_pressed("inventory_open_close"):
#		if is_open:
#			close()
#		else:
#			open()

#func open():
#	self.visible = true
#	is_open = true

#func close():
#	visible = false
#	is_open = false
