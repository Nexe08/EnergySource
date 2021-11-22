extends Node2D
# Player Movement Component

export (float) var speed = 120
export (float) var acceleration = .27

onready var parent = get_parent()


var direction := Vector2.ZERO


func _ready() -> void:
    global.player = parent


func _update(_delta: float) -> void:
    direction.x = int(Input.get_action_strength("d") - Input.get_action_strength("a"))
    direction.y = int(Input.get_action_strength("s") - Input.get_action_strength("w"))

    parent.linear_velocity = lerp(parent.linear_velocity, speed * direction, acceleration)
