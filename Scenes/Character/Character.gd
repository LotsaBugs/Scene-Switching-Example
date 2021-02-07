extends Sprite

class_name Character

func get_class() -> String:
	return G.CLASS.Character

const GODOT_ICON: StreamTexture = preload("res://icon.png")

func save_duplicate_char() -> void:
	# original node will be deleted when changing scenes, so we need to store a duplicate instead.
	var __duplicate_char_array: Array

	if find_parent(G.CLASS.Overworld):
		__duplicate_char_array = G.duplicate_overworld_chars
	elif find_parent(G.CLASS.Battle):
		__duplicate_char_array = G.duplicate_battle_chars
	else:
		assert(false, "No Battle or Overworld parent node found")

	var __duplicate := self.duplicate()

	__duplicate_char_array.append(__duplicate)


func _ready():
	texture = GODOT_ICON
	centered = false
