extends Node2D

class_name Battle

func get_class() -> String:
	return G.CLASS.Battle

func _ready():
	G.assert_matching_node_name_and_class(self)
	G.show_instructions(self)
	modulate = Color.red # Battle scene is red

	print("\n", "Entered Battle scene.")
	G.duplicate_battle_chars.clear()

	for __i in G.duplicate_overworld_chars.size():

		var __duplicate_overworld_char: Character = G.duplicate_overworld_chars[__i]
		assert(__duplicate_overworld_char)

		var __battle_char: Character = __duplicate_overworld_char.duplicate()
		assert(__battle_char)

		add_child(__battle_char)
		__battle_char.owner = self

		__battle_char.save_duplicate_char()


	print("G.duplicate_overworld_chars: ", G.duplicate_overworld_chars)
	print("G.duplicate_battle_chars: ", G.duplicate_battle_chars)
