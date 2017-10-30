extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var next_scene
onready var anim_player = get_node("anim_palyer")
func _ready():
	set_process_input(true)
