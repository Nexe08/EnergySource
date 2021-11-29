extends TextureButton
# button

signal botton_pressed


onready var anim = $AnimationPlayer



func _on_Button_mouse_entered() -> void:
    anim.play("hower")


func _on_Button_mouse_exited() -> void:
    anim.play("default")


func _on_Button_pressed() -> void:
    emit_signal("botton_pressed")
    anim.play("pressed")
