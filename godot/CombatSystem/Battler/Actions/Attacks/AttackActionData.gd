# Data container used to construct [AttackAction] objects.
class_name AttackActionData
extends ActionData

export var damage_multiplier := 1.0
export var hit_chance := 100.0
export var hits := []

export var status_effect: Resource
