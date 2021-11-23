extends Node2D
# energy drop component

onready var anim = $AnimationPlayer


func _ready() -> void:
    get_parent().child_entity = self


# called by parent when player will detect it
func pick_up():
    global.emit_signal("energy_level_changed", 1)
    anim.play("death")
