extends Node2D

var playerWon = false
var oldPosition = null
@onready var player = $bedroom_scene/player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if oldPosition:
		print("hey")
		player.global_position = oldPosition
