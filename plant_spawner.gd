extends Node


# Called when the node enters the scene tree for the first time

#@onready var tilemap = $"/root/TestSceneTilemap/TileMap"
@onready var tilemap = $"../GameTileMap/TileMap"

#LOAD IN PLANT IMAGE
const PLANT = preload("res://scenes/Tree.tscn")

var max_plants = 4


func _ready():
	spawn_plants()


func get_spawn_tiles(Plant_Spawn):

	var valid_tiles = []

	for cell in tilemap.get_used_cells(0):

		var data = tilemap.get_cell_tile_data(0, cell)

		if data == null:
			continue

		if data.get_custom_data("Plant_Spawn") == Plant_Spawn:
			valid_tiles.append(cell)

	return valid_tiles


func spawn_plants():

	var tiles = get_spawn_tiles("plant")

	var amount_to_spawn = min(max_plants, tiles.size())
	print("Found ", tiles.size(), " tiles matching the 'plant' custom data layer.")
	for i in range(amount_to_spawn):

		var cell = tiles.pick_random()
		var plant2 = PLANT.instantiate()
		plant2.global_position = tilemap.to_global(
			tilemap.map_to_local(cell)
		)
		add_child(plant2)

		tiles.erase(cell)
