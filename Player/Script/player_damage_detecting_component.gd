extends Node2D
# Player/player damage detecting component

func take_damage(damage, _damage_direction: Vector2 = Vector2.ZERO):
    global.emit_signal("energy_level_changed", -damage)
