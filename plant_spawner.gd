extends Node


# Called when the node enters the scene tree for the first time

@onready var tilemap = $"../TileMap"


const PLANT = preload("res://Tree.tscn")

var max_plants = 4


func _ready():
	spawn_plants()


func get_spawn_tiles(spawn_type):

	var valid_tiles = []

	for cell in tilemap.get_used_cells(0):

		var data = tilemap.get_cell_tile_data(0, cell)

		if data == null:
			continue

		if data.get_custom_data("spawn_type") == spawn_type:
			valid_tiles.append(cell)

	return valid_tiles


func spawn_plants():

	var tiles = get_spawn_tiles("tree")

	var amount_to_spawn = min(max_plants, tiles.size())

	for i in range(amount_to_spawn):

		var cell = tiles.pick_random()

		var plant = PLANT.instantiate()

		plant.global_position = tilemap.to_global(
			tilemap.map_to_local(cell)
		)

		add_child(plant)

		tiles.erase(cell)
