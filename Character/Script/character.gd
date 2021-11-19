extends RigidBody2D
# Character


onready var Velocity = get_linear_velocity()


func _integrate_forces(state: Physics2DDirectBodyState) -> void:
    pass
