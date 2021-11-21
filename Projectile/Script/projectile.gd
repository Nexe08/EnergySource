extends RigidBody2D
# projectile

export var damage : float
export var speed : float

func shoot(bullet_rotation):
    apply_impulse(Vector2.ZERO, Vector2(speed, 0).rotated(bullet_rotation))


func _on_VisibilityNotifier2D_screen_exited() -> void:
    queue_free()
