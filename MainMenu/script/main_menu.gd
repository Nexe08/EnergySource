extends Control
# Main Menu



func _on_Play_pressed() -> void:
    TransitionManager.emit_signal("start", global.game_scene_path, global.main)
    TransitionManager.emit_signal("remove_object", self)


func _on_Exit_pressed() -> void:
    pass # Replace with function body.
