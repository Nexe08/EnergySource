extends Area2D
# drop detecting component


onready var can_pickup: bool = true


func _ready() -> void:
    # warning-ignore:return_value_discarded
    global.connect("can_pickup_energy_drop", self, "_change_pickup_flage")


func _on_drop_detection(area: Area2D) -> void:
    if not can_pickup:
        return
    
    if area.has_method("pick_up"):
        area.pick_up()


# signal call
func _change_pickup_flage(value: bool) -> void:
    can_pickup = value
