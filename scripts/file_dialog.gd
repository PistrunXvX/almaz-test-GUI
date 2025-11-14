extends Control

@onready var file_dialog = %FileDialog

signal on_file_selected(file_path: String)

func _ready() -> void:
	self.pressed.connect(_on_btn_pressed)
	file_dialog.file_selected.connect(_on_file_dialog_file_selected)

func _on_btn_pressed() -> void:
	file_dialog.popup_centered()

func _on_file_dialog_file_selected(path: String) -> void:
	print(path)
	on_file_selected.emit(path)
