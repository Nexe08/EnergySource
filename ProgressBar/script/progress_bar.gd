extends ProgressBar
# health bar


export var always_visible: bool = false

onready var visible_timer = $VisibleTimer


func _ready() -> void:
    if not always_visible:
        visible = false
    else:
        visible = true


func _on_value_changed(value: float) -> void:
    if not always_visible:
        visible = true
        visible_timer.stop()
        visible_timer.start()
    
    self.value = value
