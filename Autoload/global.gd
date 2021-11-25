extends Node
# global

# warning-ignore:unused_signal
# to change energy level and update ui we have to emmit this signal
signal energy_level_changed(value)

var current_camera
var main
var player

var player_bullet_path: PackedScene = preload("res://Projectile/PlayerBullet.tscn")

func screen_shake(i, d):
    current_camera.screen_shake(i, d)
