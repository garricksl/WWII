extends KinematicBody2D

var ex
var ey
var spd = 1
var MOVE_RANGE = randf() * 500 + 100

func _ready():
	enemy_set_pos(get_pos())
	get_node("Timer").start()
	set_process(true)

func enemy_set_pos(newPos):
	set_pos(newPos)
	ex = newPos.x
	ey = newPos.y

func _process(delta):
	var curX = get_pos().x
	var curY = get_pos().y
	if (curX < ex or curX > ex + MOVE_RANGE):
		spd *= -1
	if (curY < ey or curY > ey + MOVE_RANGE):
		spd *= -1
	set_pos(Vector2(curX + spd, curY + spd))

#	var curX = get_pos().x
#	if(curX < ex or curX > ex + MOVE_RANGE):
#		spd += -1
#		set_pos(Vector2(curX + spd, get_pos().y))


func _on_Timer_timeout():
	var projectile = preload("res://Godot Space Shooter/Enemy/enemyProjectile.tscn")
	var laser = projectile.instance()
	get_parent().add_child(laser)
	laser.fire(get_pos(), Vector2(0, 1))
	
