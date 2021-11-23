extends Area2D
# drop detecting component



func _on_drop_detection(area: Area2D) -> void:
    if area.has_method("pick_up"):
        area.pick_up()
