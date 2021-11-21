extends RigidBody2D
# Character


onready var entity_components = get_children()
onready var parent = get_parent()


func _physics_process(delta: float) -> void:
    for component in entity_components:
        if component.has_method("_update"):
            component._update(delta)
