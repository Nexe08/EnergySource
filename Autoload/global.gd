extends Node
# global

# warning-ignore:unused_signal
# emmited by object that can effect energy level
# connected in prgress bar that show energy (energy bar component)
signal energy_level_changed(value)

var current_camera
var main
var player

var player_bullet_path: PackedScene = preload("res://Projectile/PlayerBullet.tscn")

func screen_shake(i, d):
    current_camera.screen_shake(i, d)
