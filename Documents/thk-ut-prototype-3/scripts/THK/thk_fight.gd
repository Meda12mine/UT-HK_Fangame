extends Node2D

const LUNGE = preload("res://scenes/Attacks/lunge.tscn")
@onready var fight_box: NinePatchRect = $Control/Fight_box

func _ready() -> void:
	$Control/Fight_box.change_dimension(35.0, 162, 50.0)
	var lunge = LUNGE.instantiate()
	fight_box.add_child(lunge)
	lunge.global_position = fight_box.global_position
