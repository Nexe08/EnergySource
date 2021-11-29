extends Node2D
# spawn point generaor

var spawn_positon: Vector2 = Vector2.ZERO

onready var anim = $AnimationPlayer
onready var sprite = $Sprite


func _ready() -> void:
    anim.play("RESET")


func _process(_delta: float) -> void:
    sprite.global_position = spawn_positon


# called in animation player
func _spawn():
    var enemy_instance = global.chaser_path.instance()
    enemy_instance.global_position = spawn_positon
    global.game.add_child(enemy_instance)


func set_spawn_point():
    var player = global.player
    var core = global.core
    var screen_size = get_viewport().get_visible_rect().size
    var border_margin: float = 5
    var spawn_point = Vector2(rand_range(0, screen_size.x), rand_range(0, screen_size.y))
    
    if not is_instance_valid(player) and not is_instance_valid(core):
        return
    
    var distance_from_player = spawn_point.distance_to(player.global_position)
    var distance_from_core = spawn_point.distance_to(core.global_position)
    var left_marg = border_margin
    var right_marg = screen_size.x - border_margin
    var top_marg = border_margin
    var bottom_marg = screen_size.y - border_margin
    
    if spawn_point.x > left_marg and spawn_point.y > top_marg and spawn_point.x < right_marg and spawn_point.y < bottom_marg:
        if distance_from_player > 64 and distance_from_core > 120:
            spawn_positon = spawn_point
            anim.play("default")
        else:
            spawn_point = Vector2(rand_range(0, screen_size.x), rand_range(0, screen_size.y))
    else:
        spawn_point = Vector2(rand_range(0, screen_size.x), rand_range(0, screen_size.y))
