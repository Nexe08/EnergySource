extends Node2D

# slow mover component

export var life: float = 2
export var speed: float = 30
export var damage: float = 1

onready var parent = get_parent()
onready var target = global.player

onready var anim = $AnimationPlayer
onready var damage_cooldown_timer = $AttackArea/DamageCooldownTimer
onready var sprite = $Sprite


func _ready() -> void:
    parent.sleeping = false


func _update(_delta:float) -> void:
    sprite.scale = lerp(sprite.scale, Vector2(1, 1), .27)
    _handel_target_following_logic()


func _handel_target_following_logic():
    var target_direction = parent.global_position.direction_to(target.global_position)
    parent.linear_velocity = speed * target_direction
    parent.look_at(target.global_position)


# if target is in attack range
func _on_AttackArea_body_entered(body: Node) -> void:
    if body == target:
        damage_cooldown_timer.stop()
        damage_cooldown_timer.start()


# if target isn't in attack range
func _on_AttackArea_body_exited(body: Node) -> void:
    if body == target:
        damage_cooldown_timer.stop()


func _on_DamageCooldownTimer_timeout() -> void:
    damage_cooldown_timer.stop()
    damage_cooldown_timer.start()
    target.take_damage(damage, parent.global_position)


# called in character class
func take_damage(takken_damage: float, _damage_direction: Vector2 = Vector2.ZERO):
    if life > 0:
        life -= takken_damage
        sprite.scale = Vector2(1.5, 1.5)
    else:
        parent.sleeping = true
        anim.play("death")
