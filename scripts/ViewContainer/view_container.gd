extends Control

@export var view_component_scene: PackedScene

@onready var main_scroll_container = %MainScroll

func clear_components() -> void:
	for child in main_scroll_container.get_children():
		child.queue_free()

func load_components(data):
	clear_components()
	var rows_without_header = data.slice(1, data.size() - 1)
	for row in rows_without_header:
		var view_component = view_component_scene.instantiate()
		view_component.plane_type = row[0]
		view_component.passager_capacity = row[1]
		view_component.speed = row[2]
		main_scroll_container.add_child(view_component)
