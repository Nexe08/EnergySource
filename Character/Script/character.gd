extends RigidBody2D
# Character


var entity


func _physics_process(delta: float) -> void:
    if entity:
        if entity.has_method("_update"):
            entity._update(delta)
