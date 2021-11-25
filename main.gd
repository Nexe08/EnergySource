extends Node2D
# main

func _ready() -> void:
    global.main = self


func _on_EnemySpawnTimer_timeout() -> void:
    $SpawnPointGenerator.set_spawn_point()
    pass # Replace with function body.
