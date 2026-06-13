extends Area2D

var player_in_area = false
@onready var player = $"../player"
@onready var main = $"../../"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("pickup"):
			print("computer time")
			Global.player_position = player.global_position
			Global.position_saved = true
			print(player.global_position)
			get_tree().change_scene_to_file("res://scenes/computer_mini_game.tscn")

func _on_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		$Label.visible = true

func _on_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		$Label.visible = false
