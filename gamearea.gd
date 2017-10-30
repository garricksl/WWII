extends Node

export (PackedScene) var next_scene
var next_scene_instance = null
var screen_size = OS.get_screen_size()
var window_size = OS.get_window_size()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
#	OS.set_window_maximized(true)
	OS.set_window_position(screen_size*0.2 - window_size*0.2)
#	OS.set_window_fullscreen(true)

	splash_screen()
	

func splash_screen():
	print("Loading screen")
	next_scene_instance = next_scene.instance()
	add_child(next_scene_instance)
	