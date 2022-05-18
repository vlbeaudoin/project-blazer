extends Node2D

#onready var level_path = "res://scenes/levels/%s.tscn" % self.name
#export var level_path: String = "res://scenes/levels/%s.tscn" % self.name
"""
String that points to a scene that acts as a game level.

example: "res://scenes/levels/level0.tscn"
"""
export(String) var level_path

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("level")
	Util.current_level = level_path

func _process(_delta):
	process_input()

func process_input():
	if Input.is_action_just_released("debug"):
		handle_debug()
	
	if Input.is_action_just_pressed("menu"):
		handle_menu()

func handle_debug():
	print("[I] Debug!")

func handle_menu():
	print("[I] Opening menu")
	Util.current_level = Util.menu_level
	Util.change_scene(Util.menu_level)
