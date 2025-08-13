extends RichTextLabel

func _process(delta: float) -> void:
	var pos = $"../../Player".global_position
	text = str(Vector2(round(pos.x), round(pos.y)))
