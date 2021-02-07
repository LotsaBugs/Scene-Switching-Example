extends Node2D

class_name Overworld

func get_class() -> String:
	return G.CLASS.Overworld

func _input(event):
	if event.is_action_pressed("ui_accept"): # [Enter]: Spawn Overworld char
		var __char = G.PACKED.Character.instance()
		add_child(__char)
		__char.owner = self
		__char.global_position = Vector2(64, 64) * G.duplicate_overworld_chars.size()
		__char.save_duplicate_char()

func _ready():
	G.assert_matching_node_name_and_class(self)
	G.show_instructions(self)

	print("\n", "Entered Overworld scene.")
	G.duplicate_overworld_chars.clear()

	print("G.duplicate_overworld_chars: ", G.duplicate_overworld_chars)
	print("G.duplicate_battle_chars: ", G.duplicate_battle_chars)
