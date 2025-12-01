extends Camera3D

@export var speed: float = 5.0

var _edge_size: float = 20.0

func _process(delta: float) -> void:
	var input_dir = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		input_dir.z -= 1
	if Input.is_action_pressed("move_down"):
		input_dir.z += 1
	if Input.is_action_pressed("move_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("move_right"):
		input_dir.x += 1
	
	var mouse = get_viewport().get_mouse_position()
	var screen = get_viewport().get_visible_rect().size
	
	if mouse.x <= _edge_size:
		input_dir.x -= 1
	elif mouse.x >= screen.x - _edge_size:
		input_dir.x += 1
	
	if mouse.y <= _edge_size:
		input_dir.z -= 1
	elif mouse.y >= screen.y - _edge_size:
		input_dir.z += 1
	
	input_dir = input_dir.normalized()
	
	global_transform.origin += input_dir * speed * delta
