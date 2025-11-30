extends VehicleBody3D

@export var path_follow: PathFollow3D
@export var path_speed: float = 10.0
@export var engine_power: float = 80.0

var _max_steer: float = 0.5 #максимальный угол поворота передних колёс
var _steer_sensitivity: float = 10.0 #чувствительность руля
var _steer_lerp: float = 5.0 #плавность поворота руля

func _physics_process(delta: float) -> void:
	if path_follow == null:
		printerr("Необходимо задать путь")
		return
	
	var target_pos: Vector3
	var to_target: Vector3
	var forward: Vector3
	var cross_y
	var dot
	var angle
	var target_steer
	var speed_forward
	
##	Двигаем машину по пути
	forward = global_transform.basis.z
	forward.y = 0.0
	forward = forward.normalized()
	
	speed_forward = linear_velocity.dot(forward)
	path_follow.progress += speed_forward * delta
	
#	Берем позицию цели
	target_pos = path_follow.global_transform.origin
	
#	Вектор до цели в плоскости XZ
	to_target = target_pos - global_transform.origin
	to_target.y = 0.0
	if to_target.length() < 0.1:
		return
	to_target = to_target.normalized()
	
	forward = global_transform.basis.z
	forward.y = 0.0
	forward = forward.normalized()
	
	cross_y = forward.cross(to_target).y
	dot = forward.dot(to_target)
	angle = atan2(cross_y, dot)
	
	target_steer = clamp(angle * _steer_sensitivity, -_max_steer, _max_steer)
	self.steering = lerp(self.steering, target_steer, _steer_lerp * delta)
	
	self.engine_force = engine_power
	
	
