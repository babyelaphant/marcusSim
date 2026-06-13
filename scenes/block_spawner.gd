extends Node2D

@export var block_scene: PackedScene # Drag your saved Block scene here in the Inspector
@export var min_spawn_time: float = 1.0 # Minimum seconds between spawns
@export var max_spawn_time: float = 2.5 # Maximum seconds between spawns

var timer: Timer

func _ready() -> void:
	# Randomize Godot's random number generator so it's different every time you play
	randomize() 
	
	# Create a timer in code to handle the spawning delays
	timer = Timer.new()
	add_child(timer)
	
	# Connect the timer's timeout signal to our spawn function
	timer.timeout.connect(_on_timer_timeout)
	
	# Start the first spawn cycle
	_start_timer()

func _start_timer() -> void:
	# Pick a random time between your min and max
	var wait_time = randf_range(min_spawn_time, max_spawn_time)
	timer.start(wait_time)

func _on_timer_timeout() -> void:
	spawn_block()
	_start_timer() # Start the timer again for the next block

func spawn_block() -> void:
	if block_scene != null:
		# Create a new instance of your block
		var new_block = block_scene.instantiate()
		
		# Add the block to the game
		add_child(new_block)
		
		# Set the block's position to exactly where your Spawner node is located
		new_block.global_position = global_position
	else:
		print("Error: No block scene assigned to the spawner!")
