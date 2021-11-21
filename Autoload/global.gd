extends Node
# global

var main: Node2D

var player_bullet_path: PackedScene = preload("res://Projectile/PlayerBullet.tscn")

func screen_shake(i, d):
    main.screen_shake(i, d)
