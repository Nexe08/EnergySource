extends Node2D
# AUTOLOAD
# transition manager


# warning-ignore:unused_signal
signal start(object, parent)
# warning-ignore:unused_signal
signal remove_object(object)


var new_object
var desire_parent
var old_object

var remove_old_object: bool = false

onready var anim = $AnimationPlayer


# called in animationplayer
func _start_transition() -> void:
    if new_object and desire_parent:
        var node_instance = new_object.instance()
        desire_parent.add_child(node_instance)
    
    if old_object != null:
        if is_instance_valid(old_object):
            old_object.queue_free()


# signal connection
func _on_TransitionManager_start(object, parent) -> void:
    new_object = object
    desire_parent = parent
    anim.play("in")


# signal connection
func _on_TransitionManager_remove_object(object) -> void:
    old_object = object
