extends KinematicBody2D
#Main File
const MOVE_SPEED = 8

func _ready():
	#play("background_music")
	set_process(true)
	set_process_input(true)
	pass

func _process(delta):
	var newPos = get_pos()
	var spaceship = get_node("spaceship")

	#move_left
	if (Input.is_action_pressed("player_move_left")):
		newPos = Vector2(get_pos().x - MOVE_SPEED, get_pos().y)
		if (get_viewport_rect().has_point(newPos)):
			set_pos(newPos)
	#move_right
	elif (Input.is_action_pressed("player_move_right")):
		newPos = Vector2(get_pos().x + MOVE_SPEED, get_pos().y)
		if (get_viewport_rect().has_point(newPos)):
			set_pos(newPos)
	
	#move_up
	elif (Input.is_action_pressed("player_move_up")):
		newPos = Vector2(get_pos().x, get_pos().y - MOVE_SPEED)
		if (get_viewport_rect().has_point(newPos)):
			set_pos(newPos)
			
	elif (Input.is_action_pressed("player_move_down")):
		newPos = Vector2(get_pos().x, get_pos().y + MOVE_SPEED)
		if (get_viewport_rect().has_point(newPos)):
			set_pos(newPos)


func _input(event): #shooting
	var projectile = preload("res://Godot Space Shooter/Laser/friendlyProjectile.tscn")
	if(event.is_action_pressed("player_shoot")):
		var laser = projectile.instance()
		get_parent().add_child(laser)
		laser.fire(get_pos(), Vector2(0, -1))
		
