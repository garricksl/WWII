extends KinematicBody2D

var ex
var spd = 4
var MOVE_RANGE = randf() * 300 + 100

func _ready():
	enemy_set_pos(get_pos())
	get_node("Timer").start()
	set_process(true)

func enemy_set_pos(newPos):
	set_pos(newPos)
	ex = newPos.x

func _process(delta):
	var curX = get_pos().x
	if (curX < ex or curX > ex + MOVE_RANGE):
		spd *= -1
	set_pos(Vector2(curX + spd, get_pos().y))

#	var curX = get_pos().x
#	if(curX < ex or curX > ex + MOVE_RANGE):
#		spd += -1
#		set_pos(Vector2(curX + spd, get_pos().y))


func _on_Timer_timeout():
	var projectile = preload("res://Godot Space Shooter/Enemy/enemyProjectile.tscn")
	var laser = projectile.instance()
	get_parent().add_child(laser)
	laser.fire(get_pos(), Vector2(0, 1))
	
