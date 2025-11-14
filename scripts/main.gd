extends Control

@onready var view_container = %ViewContainer
@onready var file_dialog_btn = %FileDialog

func _ready() -> void:
	file_dialog_btn.on_file_selected.connect(_on_parse_file)

func parse_csv(path: String):
	var res = []
	var f = FileAccess.open(path, FileAccess.READ)
	while !f.eof_reached():
		var row = f.get_line().split(',')
		res.append(row)
	return res

func _on_parse_file(path) -> void:
	var data = parse_csv(path)
	view_container.load_components(data)
