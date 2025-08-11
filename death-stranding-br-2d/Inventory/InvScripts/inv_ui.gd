extends Control

@onready  var game_manager = %GameManager

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

func _process(delta: float):
	if game_manager.cargo >= 1:
		slot1.visible = true
	if game_manager.cargo >= 2:
		slot2.visible = true
	if game_manager.cargo >= 3:
		slot3.visible = true
	if game_manager.cargo >= 4:
		slot4.visible = true
	if game_manager.cargo >= 5:
		slot5.visible = true
	if game_manager.cargo >= 6:
		slot6.visible = true
	if game_manager.cargo >= 7:
		slot7.visible = true
	if game_manager.cargo >= 8:
		slot8.visible = true
	if game_manager.cargo >= 9:
		slot9.visible = true
