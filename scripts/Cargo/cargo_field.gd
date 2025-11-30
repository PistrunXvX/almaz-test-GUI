extends Node3D

@onready var popup_UI = %PopupUi
@onready var path3d = %Path3D
@onready var cargo = %Cargo

func _ready() -> void:
	get_tree().paused = true
	popup_UI.start_simulation.connect(_on_start_simulation)
	path3d.on_path_generate.connect(_on_path_generate)

func _on_start_simulation(_speed: float, _amplitude: float, _period: float) -> void:
	cargo.engine_power = _speed
	path3d.set_data(_amplitude, _period)

func _on_path_generate() -> void:
	get_tree().paused = false
	popup_UI.visible = false
