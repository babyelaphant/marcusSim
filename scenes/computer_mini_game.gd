extends Node2D

var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Points: " + str(points)
	Global.played_game = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_point_area_entered(area):
	points += 1
	print(points)
	if points > 10:
		Global.game_won = true
		get_tree().change_scene_to_file("res://scenes/bedroom_global.tscn")
	$Label.text = "Points: " + str(points)
