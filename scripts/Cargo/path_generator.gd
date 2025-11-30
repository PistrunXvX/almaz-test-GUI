extends Path3D

@export var mesh_width_x: float = 40.0
@export var mesh_length_z: float = 100.0
@export var points_count: int = 150

signal on_path_generate

var _amplitude: float = 10.0
var _period: float = 20.0
var _center_x: float = 0.0
var _y_height: float = 0.0

func set_data(amplitude: float, period: float) -> void:
	_amplitude = amplitude
	_period = period
	generate_path()

func generate_path() -> void:
	var c = Curve3D.new()
	var half_width = mesh_width_x * 0.5
	var safe_amplitude = min(abs(_amplitude), half_width)
	
	if abs(_amplitude) > half_width:
		push_warning("Амплитуда слишком большая для ширины меша")
	
	for i in range(points_count + 1):
		var t = float(i) / float(points_count)
		var z = t * mesh_length_z
		var x = _center_x + safe_amplitude * sin(2.0 * PI * z / _period)
		var y = _y_height
		
		c.add_point(Vector3(x, y, z))
	
	c.closed = true
	c.bake_interval = 1.0
	self.curve = c
	on_path_generate.emit()
