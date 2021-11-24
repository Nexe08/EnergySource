extends Node2D
# Player/player damage detecting component

export (NodePath) var player_sprite

onready var sprite = get_node(player_sprite)


func take_damage(damage, _damage_direction: Vector2 = Vector2.ZERO):
    sprite.scale = Vector2(1.9, 1.9) # reseting in player attack component
    global.emit_signal("energy_level_changed", -damage)
