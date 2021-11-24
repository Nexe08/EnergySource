extends RigidBody2D
# Character


onready var entity_components = get_children()
onready var parent = get_parent()


func _physics_process(delta: float) -> void:
    for component in entity_components:
        if is_instance_valid(component):
            if component.has_method("_update"):
                component._update(delta)


# called by bullet which can give damage
func take_damage(takken_damage: float, damage_direction: Vector2 = Vector2.ZERO):
    for component in entity_components:
        if is_instance_valid(component):
            if component.has_method("take_damage"):
                component.take_damage(takken_damage, damage_direction)
