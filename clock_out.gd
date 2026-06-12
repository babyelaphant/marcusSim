extends Area2D

var player_in_area = false
@onready var player = $"../player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("pickup"):
			print("yoooo")
			

func _on_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
