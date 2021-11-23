extends Area2D
# Drop

var child_entity


# called by object that is detecting drop
func pick_up():
    if child_entity:
        if child_entity.has_method("pick_up"):
            child_entity.pick_up()
