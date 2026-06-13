extends Node2D

var playerWon = false
var oldPosition = null
@onready var player = $bedroom_scene/player
@onready var camera = $bedroom_scene/player/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.position_saved:
		if Global.game_won:
			$Label.text = "YAY YOU WON"
			print("dang you won")
		if not Global.game_won:
			$Label.text = "yo you lost..."
			print("wow you lost")
		player.global_position = Global.player_position
		Global.position_saved = false
