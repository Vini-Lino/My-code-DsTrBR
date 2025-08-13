extends Panel

func _process(delta: float) -> void:
	$RichTextLabel.text = str(GameManager.deliveries) + "/30"
