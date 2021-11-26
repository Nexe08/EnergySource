extends Node2D
# energy drop component

export var energy_level: float = 5

onready var anim = $AnimationPlayer


func _ready() -> void:
    get_parent().child_entity = self


# called by parent when player will detect it
func pick_up():
    global.emit_signal("energy_level_changed", energy_level)
    anim.play("death")


func _self_distruction():
    anim.play("death")
