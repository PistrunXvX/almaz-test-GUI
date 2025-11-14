extends HBoxContainer

@export var plane_type: String
@export var passager_capacity: String
@export var speed: String

@onready var plane_type_label = %PlaneType 
@onready var passager_capacity_label = %PassagerCapacity
@onready var speed_label = %Speed

@onready var style_normal = load("res://assets/styles/style_box_flat_view_component_label.tres")
@onready var style_on_mouse = load("res://assets/styles/style_box_flat_view_on_mouse_component_label.tres")

func _ready() -> void:
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)
	
	plane_type_label.text = plane_type
	passager_capacity_label.text = passager_capacity
	speed_label.text = speed

func _on_mouse_entered() -> void:
	plane_type_label.add_theme_stylebox_override("normal", style_on_mouse)
	passager_capacity_label.add_theme_stylebox_override("normal", style_on_mouse)
	speed_label.add_theme_stylebox_override("normal", style_on_mouse)

func _on_mouse_exited() -> void:
	plane_type_label.add_theme_stylebox_override("normal", style_normal)
	passager_capacity_label.add_theme_stylebox_override("normal", style_normal)
	speed_label.add_theme_stylebox_override("normal", style_normal)
