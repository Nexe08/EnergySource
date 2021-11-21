extends Node2D
# main

var screen_shake_intencity: float = 0
var screen_shake_duration: float = 0


func _ready() -> void:
    randomize()
    global.main = self


func _process(delta: float) -> void:
    print(screen_shake_duration)
    if screen_shake_duration <= 0:
        global_position = Vector2.ZERO
        screen_shake_intencity = 0
        screen_shake_duration = 0
        return
    
    screen_shake_duration -= delta
    
    global_position = Vector2(randf(), randf()) * screen_shake_intencity
    
#    global_position = Vector2(sin(OS.get_ticks_msec() * .03). sin(OS.get_ticks_msec() * .07)) * screen_shake_intencity * .5


func screen_shake(intencity, duration):
    if intencity > screen_shake_intencity and duration > screen_shake_duration:
        screen_shake_intencity = intencity
        screen_shake_duration = duration
