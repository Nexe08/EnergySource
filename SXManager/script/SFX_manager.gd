extends AudioStreamPlayer
# SFX manager

export var random_pitch: bool = false

func _ready() -> void:
    if random_pitch:
        pitch_scale = rand_range(.86, 1.24)
    else:
        pitch_scale = 1

