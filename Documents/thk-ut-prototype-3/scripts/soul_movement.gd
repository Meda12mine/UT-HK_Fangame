extends CharacterBody2D


var SPEED = 80.0


func _physics_process(delta: float) -> void:
	var Direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = Direction * SPEED
	move_and_slide()
func Damage(Object:Node2D):
	if Object.is_in_group("Damagable"):
		print("got hit")
	pass
