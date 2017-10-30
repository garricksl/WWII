extends KinematicBody2D


var PROJECTILE_SPEED = 400
var shoot_dir = Vector2()
var increaseEnemyCounter = 2

func _ready():
	set_pos(Vector2(100, 100))
	pass

func fire(position, direction):
	shoot_dir = direction.normalized()
	set_pos(position)
	set_fixed_process(true)

func _fixed_process (delta):
	move(shoot_dir * PROJECTILE_SPEED * delta)


func _on_Area2D_body_enter( body ):
	if(body.is_in_group("enemy") and body.is_in_group("ship")):
		body.queue_free()
		queue_free()
		for i in range(0, increaseEnemyCounter):
			var pos = Vector2(randf()*1000 + randf() * 100, randf()*2000 + randf()*50)
			var ship = preload("res://Godot Space Shooter/Enemy/enemy.tscn")
			var obj = ship.instance()
			obj.set_pos(pos)
			get_parent().add_child(obj)
			increaseEnemyCounter += 1