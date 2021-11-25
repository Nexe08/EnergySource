extends ProgressBar
# health bar


export var always_visible: bool = false

onready var visible_timer = $VisibleTimer
onready var tween = $Tween
onready var b_progress_bar = $ProgressBar


func _ready() -> void:
    if not always_visible:
        visible = false
    else:
        visible = true


func update_value(_value: float) -> void:
    if not always_visible:
        visible = true
        visible_timer.stop()
        visible_timer.start()
    
    self.value = _value
    
    tween.interpolate_property(b_progress_bar, "value", b_progress_bar.value, _value, .4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, .4)
    tween.start()
    
    b_progress_bar.rect_size = rect_size
    b_progress_bar.max_value = max_value
