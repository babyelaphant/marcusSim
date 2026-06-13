extends Area2D

var player_in_area = false

func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area and Global.played_game:
		if Input.is_action_just_pressed("pickup"):
			get_tree().change_scene_to_file("res://test_scene_tilemap.tscn")

func _on_body_entered(body):
	$Label.visible = true
	player_in_area = true
	
	if Global.played_game:
		$Label.text = "leave for work"
		print("leaving for work")
	else:
		$Label.text = "must game first"
		
func _on_body_exited(body):
	player_in_area = false
	$Label.visible = false
