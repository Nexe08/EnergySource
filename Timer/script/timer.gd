extends Node2D
# timer

var time: float = 0
var time_on: bool = false


onready var label = $Label


func _process(delta: float) -> void:
    if time_on:
        time += delta
    
    var secs = fmod(time, 60)
    var mins = fmod(time, 60 * 60) / 60
    label.text = String(int(mins)) + " : " +String(int(secs))
