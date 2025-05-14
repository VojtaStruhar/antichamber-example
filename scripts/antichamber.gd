extends Node3D

@onready var stairs_portal: Portal3D = %StairsPortal
@onready var start_portal: Portal3D = %StartPortal
@onready var blue_portal: Portal3D = %BluePortal
@onready var red_portal: Portal3D = %RedPortal

@onready var win_indicator: Node3D = %WinIndicator

var red_completed: bool = false
var blue_completed: bool = false

func _ready() -> void:
	win_indicator.visible = false

func _on_blue_portal_on_teleport(node: Node3D) -> void:
	blue_completed = true
	stairs_portal.exit_portal = blue_portal
	check_completion()

func _on_red_portal_on_teleport(node: Node3D) -> void:
	red_completed = true
	stairs_portal.exit_portal = red_portal
	check_completion()

func check_completion() -> void:
	if blue_completed and red_completed:
		stairs_portal.exit_portal = start_portal
		win_indicator.visible = true
