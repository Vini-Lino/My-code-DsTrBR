extends Panel

var max_point = 10

func _process(delta: float) -> void:
	if GameManager.deliveries < max_point:
		$RichTextLabel.text = str(GameManager.deliveries) + "/" + str(max_point)
	else:
		$RichTextLabel.text = "Jogo Completo!"
