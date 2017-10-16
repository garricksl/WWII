extends KinematicBody2D
# class variables
var PROJECTILE_SPEED = 300
var shoot_dir = Vector2()
func _ready():
	set_pos(Vector2(100, 100))
	pass
func fire(position, direction):
	shoot_dir = direction.normalized()
	set_pos(position)
	set_fixed_process(true)
func _fixed_process(delta):
	move(shoot_dir * PROJECTILE_SPEED * delta)

func _on_Area2D_body_enter( body ):
	if(body.is_in_group("friendly") and body.is_in_group("ship")):
		body.queue_free()
		queue_free()