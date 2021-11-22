extends Node2D
# ProgressBar/script/energy_bar_component

export var current_energy_level: float = 25
export var max_energy_level: float = 25

onready var energy_bar = $EnergyBar


func _ready() -> void:
    # warning-ignore:return_value_discarded
    global.connect("energy_level_changed", self, "_change_energy_level")
    energy_bar.max_value = max_energy_level


func _process(_delta: float) -> void:
    energy_bar.rect_scale = lerp(energy_bar.rect_scale, Vector2(1, 1), .5)
    energy_bar.modulate = energy_bar.modulate.linear_interpolate(Color.white, .2)


# signal connection
func _change_energy_level(value):
    current_energy_level += value
    
    if value < 0:
        energy_bar.modulate = "#ff0000"
    else:
        energy_bar.modulate = "#15eacb"
    energy_bar.rect_scale = Vector2(1.05, 1.1)
    energy_bar.emit_signal("value_changed", current_energy_level)
