extends Node
# AUTOLOAD
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
var game
var main
var player

var dead_enemy_rotten_path: PackedScene = preload("res://Enemy/DeadEnemyRotten.tscn")
var energy_drop_path: PackedScene = preload("res://Drop/EnergyDrop.tscn")
var game_scene_path: PackedScene = preload("res://Game/game.tscn")
var main_menu_path: PackedScene = preload("res://MainMenu/MainMenu.tscn")
var player_bullet_path: PackedScene = preload("res://Projectile/PlayerBullet.tscn")

func screen_shake(i, d):
    current_camera.screen_shake(i, d)


var chaser_path: PackedScene = preload("res://Enemy/Chaser.tscn")


func _ready() -> void:
    randomize()

func back_to_mainmenu(current_node):
    TransitionManager.emit_signal("remove_object", current_node)
    TransitionManager.emit_signal("start", main_menu_path, main)
