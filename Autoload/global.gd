extends Node
# global

# warning-ignore:unused_signal
# to change energy level and update ui we have to emmit this signal
signal energy_level_changed(value)

# called in energy drop
# connected with player
# warning-ignore:unused_signal
signal can_pickup_energy_drop(value)

var core
var current_camera
var main
var player

var energy_drop_path: PackedScene = preload("res://Drop/EnergyDrop.tscn")
var player_bullet_path: PackedScene = preload("res://Projectile/PlayerBullet.tscn")

func screen_shake(i, d):
    current_camera.screen_shake(i, d)


var chaser_path: PackedScene = preload("res://Enemy/Chaser.tscn")


func _ready() -> void:
    randomize()
