extends Node2D

class_name Battler

export var  stats: Resource
export var ai_scene: PackedScene
export var actions: Array
export var is_party_member := false

var time_scale := 1.0 setget set_time_scale
var _readiness := 0.0 setget _set_readiness

signal ready_to_act
signal readiness_changed(new_value)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
