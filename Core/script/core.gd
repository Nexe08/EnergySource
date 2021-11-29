extends StaticBody2D
#  core

onready var anim = $AnimationPlayer


func _ready() -> void:
    global.core = self


# called in animation player
# reset animation to default
func _back_to_default():
    anim.play("default")


func take_damage(damage: float, _damage_direction: Vector2 = Vector2.ZERO):
    anim.play("takking_damage")
    global.emit_signal("energy_level_changed", -damage)
