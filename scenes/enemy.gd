extends Area2D

@export var speed: float = 400.0

func _process(delta: float) -> void:

	position.x -= speed * delta
	
	if position.x < -1300:
		queue_free()


func _on_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/bedroom_scene.tscn")
	print("dead")
