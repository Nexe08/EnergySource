extends ProgressBar
# health bar


export var always_visible: bool = false

onready var increment: bool = false

onready var visible_timer = $VisibleTimer
onready var b_progress_bar = $ProgressBar


func _ready() -> void:
    if not always_visible:
        visible = false
    else:
        visible = true


func _process(delta: float) -> void:
    if not increment:
        b_progress_bar.value = lerp(b_progress_bar.value, value, delta * 4)
    else:
        value = lerp(value, b_progress_bar.value, delta * 4)


func update_value(_value: float) -> void:
    if not always_visible:
        visible = true
        visible_timer.stop()
        visible_timer.start()
    
    if _value < value:
        self.value = _value
        increment = false
    else:
        b_progress_bar.value = _value
        increment = true
    
    b_progress_bar.rect_size = rect_size
    b_progress_bar.max_value = max_value
