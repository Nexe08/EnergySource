extends RigidBody2D
# projectile

export var damage : float
export var speed : float


func shoot(bullet_rotation):
    global.screen_shake(2, .02)
    apply_impulse(Vector2.ZERO, Vector2(speed, 0).rotated(bullet_rotation))


func _on_VisibilityNotifier2D_screen_exited() -> void:
    queue_free()


func _on_Projectile_body_entered(body: Node) -> void:
    if body.has_method("take_damage"):
        body.take_damage(damage, global_position)
    
    sleeping = true
    $AnimationPlayer.play("death")
