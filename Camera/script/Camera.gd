extends Camera2D
# camera

var screen_shake_intencity: float = 0
var screen_shake_duration: float = 0


func _ready() -> void:
    global.current_camera = self


func _process(delta: float) -> void:
    if screen_shake_duration <= 0:
        offset = Vector2.ZERO
        screen_shake_intencity = 0
        screen_shake_duration = 0
        return
    
    screen_shake_duration -= delta
    
    offset = Vector2(randf(), randf()) * screen_shake_intencity


func screen_shake(intencity, duration):
    if intencity > screen_shake_intencity and duration > screen_shake_duration:
        screen_shake_intencity = intencity
        screen_shake_duration = duration
