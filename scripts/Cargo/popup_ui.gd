extends Control

@onready var speed_input = %SpeedInput
@onready var amplitude_input = %AmplitudeInput
@onready var period_input = %PeriodInput
@onready var btn_start = %StartButton
@onready var label_error = %LabelError

signal start_simulation(speed: float, amplitude: float, period: float)

var _speed: float = 20
var _amplitude: float = 15
var _period: float = 40

func _ready() -> void:
	speed_input.value_changed.connect(_on_speed_input_value_changed)
	amplitude_input.value_changed.connect(_on_amplitude_input_value_changed)
	period_input.value_changed.connect(_on_period_input_value_changed)
	btn_start.pressed.connect(_on_btn_start_pressed)

func _on_speed_input_value_changed(value: float) -> void:
	_speed = value

func _on_amplitude_input_value_changed(value: float) -> void:
	_amplitude = value

func _on_period_input_value_changed(value: float) -> void:
	_period = value

func _on_btn_start_pressed() -> void:
	if is_correct_input_data():
		start_simulation.emit(_speed, _amplitude, _period)

func is_correct_input_data() -> bool:
	if _speed > 0 && _amplitude > 0 && _period > 0:
		label_error.visible = false
		return true
	label_error.visible = true
	return false
