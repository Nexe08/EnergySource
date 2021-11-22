extends Node
# global

var current_camera
var main
var player

var player_bullet_path: PackedScene = preload("res://Projectile/PlayerBullet.tscn")

func screen_shake(i, d):
    current_camera.screen_shake(i, d)
