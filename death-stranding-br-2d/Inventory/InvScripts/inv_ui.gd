extends Control

@onready var slot1 = $NinePatchRect/GridContainer/inv_UI_slot/Sprite2D2
@onready var slot2 = $NinePatchRect/GridContainer/inv_UI_slot2/Sprite2D2
@onready var slot3 = $NinePatchRect/GridContainer/inv_UI_slot3/Sprite2D2
@onready var slot4 = $NinePatchRect/GridContainer/inv_UI_slot4/Sprite2D2
@onready var slot5 = $NinePatchRect/GridContainer/inv_UI_slot5/Sprite2D2
@onready var slot6 = $NinePatchRect/GridContainer/inv_UI_slot6/Sprite2D2
@onready var slot7 = $NinePatchRect/GridContainer/inv_UI_slot7/Sprite2D2
@onready var slot8 = $NinePatchRect/GridContainer/inv_UI_slot8/Sprite2D2
@onready var slot9 = $NinePatchRect/GridContainer/inv_UI_slot9/Sprite2D2
@onready var settings = $NinePatchRect/GridContainer/settings_ui_slot

func _process(_delta: float):
	if GameManager.cargo >= 1:
		slot1.visible = true
	else:
		slot1.visible = false
	if GameManager.cargo >= 2:
		slot2.visible = true
	else:
		slot2.visible = false
	if GameManager.cargo >= 3:
		slot3.visible = true
	else:
		slot3.visible = false
	if GameManager.cargo >= 4:
		slot4.visible = true
	else:
		slot4.visible = false
	if GameManager.cargo >= 5:
		slot5.visible = true
	else:
		slot5.visible = false
	if GameManager.cargo >= 6:
		slot6.visible = true
	else:
		slot6.visible = false
	if GameManager.cargo >= 7:
		slot7.visible = true
	else:
		slot7.visible = false
	if GameManager.cargo >= 8:
		slot8.visible = true
	else:
		slot8.visible = false
	if GameManager.cargo >= 9:
		slot9.visible = true
	else:
		slot9.visible = false
