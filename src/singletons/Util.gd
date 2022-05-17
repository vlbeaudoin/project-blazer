extends Node

const DEBUG = true
var game_mode: int = GameModes.BUILD

const menu_level: String = "res://scenes/menu.tscn"
var current_level: String = menu_level

enum GameModes {
	BUILD,
	WAVE
}

func _process(delta):
	process_input()

func process_input():
	if Input.is_action_just_pressed("restart"):
		handle_restart()
		
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func handle_restart():
	if Util.current_level != Util.menu_level:
		print("[I] Restarting level")
		Util.change_scene(Util.current_level)

func change_scene(scene_path: String):
	print("[I] Changing scene to: %s" % scene_path)
	var _err = get_tree().change_scene(scene_path)

func enter_state(new_game_mode: int):
	if not new_game_mode == game_mode:
		match new_game_mode:
			GameModes.BUILD:
				game_mode = GameModes.BUILD
				#astar_nav.shimmer = true
				#for chicken in chickens:
				#	chicken.eggs_timer.stop()
				#MusicPlayer.fade_music(0)
			GameModes.WAVE:
				game_mode = GameModes.WAVE
				#astar_nav.shimmer = false
				#MusicPlayer.fade_music(1)
