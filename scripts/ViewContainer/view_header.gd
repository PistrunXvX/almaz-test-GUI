extends HBoxContainer

@export var plane_type_header: String
@export var passager_capacity_header: String
@export var speed_header: String

@onready var plane_type_label = %PlaneTypeHeader
@onready var passager_capacity_label = %PassagerCapacityHeader
@onready var speed_label = %SpeedHeader

func _ready() -> void:
	plane_type_label.text = plane_type_header
	passager_capacity_label.text = passager_capacity_header
	speed_label.text = speed_header
