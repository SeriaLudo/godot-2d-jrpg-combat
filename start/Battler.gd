# Character or monster that's participating in combat.
# Any battler can be given an AI and turn into a computer-controlled ally or a foe.
extends Node2D
class_name Battler

signal ready_to_act
signal readiness_changed(new_value)
signal selection_toggled(value)

export var stats: Resource
export var ai_scene: PackedScene
export var actions: Array
export var is_party_member := false

var time_scale := 1.0 setget set_time_scale
var is_active: bool = true setget set_is_active
var is_selected: bool = false setget set_is_selected
var is_selectable: bool = true setget set_is_selectable

var _readiness := 0.0 setget _set_readiness


func _process(delta: float) -> void:
	_set_readiness(_readiness + stats.speed * delta * time_scale)


func is_player_controlled() -> bool:
	return ai_scene == null


func set_time_scale(value) -> void:
	time_scale = value


func set_is_active(value) -> void:
	is_active = value
	set_process(is_active)


func set_is_selected(value) -> void:
	if value:
		assert(is_selectable)

	is_selected = value
	emit_signal("selection_toggled", is_selected)


func set_is_selectable(value) -> void:
	is_selectable = value
	if not is_selectable:
		set_is_selected(false)


func _set_readiness(value: float) -> void:
	_readiness = value
	emit_signal("readiness_changed", _readiness)
	if _readiness >= 100.0:
		emit_signal("ready_to_act")
		set_process(false)
