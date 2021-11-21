extends Node2D
# player attack component

export var fire_rate: float = 0.2

var can_fire: bool = true

var fire_rate_timer: Timer

onready var parent = get_parent()
onready var muzzel = $MuzzelPosition


func _ready() -> void:
    fire_rate_timer = Timer.new()
    fire_rate_timer.wait_time = fire_rate
    add_child(fire_rate_timer)
    # warning-ignore:return_value_discarded
    fire_rate_timer.connect("timeout", self, "_on_fire_rate_timer_timeout")


func _update(_delta: float) -> void:
    parent.look_at(get_global_mouse_position())
    
    if Input.is_action_pressed("lmb"):
        _shoot()


func _shoot():
    if can_fire:
        var bullet_instance = global.player_bullet_path.instance()
        bullet_instance.global_position = muzzel.global_position
        bullet_instance.global_rotation = parent.global_rotation
        bullet_instance.shoot(parent.global_rotation)
        parent.parent.add_child(bullet_instance)
        fire_rate_timer.stop()
        fire_rate_timer.start()
        can_fire = false


func _on_fire_rate_timer_timeout() -> void:
    can_fire = true
