extends Node2D
# Player Movement Component

export (NodePath) var root_parent = ".."
export (float) var speed = 120
export (float) var acceleration = .27

onready var parent = get_node(root_parent)


var direction := Vector2.ZERO


func _update(_delta: float) -> void:
    direction.x = int(Input.get_action_strength("d") - Input.get_action_strength("a"))
    direction.y = int(Input.get_action_strength("s") - Input.get_action_strength("w"))

    parent.linear_velocity = lerp(parent.linear_velocity, speed * direction, acceleration)
