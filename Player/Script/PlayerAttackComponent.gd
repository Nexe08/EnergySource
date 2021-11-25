extends Node2D
# player attack component

export (NodePath) var player_sprite
export var fire_rate: float = 0.2

var can_fire: bool = true

var fire_rate_timer: Timer

onready var parent = get_parent()
onready var sprite = get_node(player_sprite)
onready var muzzel = $MuzzelPosition


func _ready() -> void:
    fire_rate_timer = Timer.new()
    fire_rate_timer.wait_time = fire_rate
    add_child(fire_rate_timer)
    # warning-ignore:return_value_discarded
    fire_rate_timer.connect("timeout", self, "_on_fire_rate_timer_timeout")


func _update(_delta: float) -> void:
    sprite.scale = lerp(sprite.scale, Vector2(1, 1), 0.3) # reset
    
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
        sprite.scale = Vector2(.2, .2) #Vector2(1.5, 1.5) # visual
        can_fire = false


func _on_fire_rate_timer_timeout() -> void:
    can_fire = true
