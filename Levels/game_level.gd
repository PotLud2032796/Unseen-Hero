extends Node2D

var current_stage = 1

func _on_level_finished():
	get_tree().change_scene_to_file("res://Objects/Scene/Level/Levels/level_" + str(int(current_stage + 1)) + ".tscn")
