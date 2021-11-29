extends Node2D
# game


func _ready() -> void:
    global.game = self


func _on_EnemySpawnTimer_timeout() -> void:
    $SpawnPointGenerator.set_spawn_point()
