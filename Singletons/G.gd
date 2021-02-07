extends Node

# Singleton G.gd

const PACKED := {
	Character = preload("res://Scenes/Character/Character.tscn")
}

const CLASS := {
	Overworld = "Overworld",
	Character = "Character",
	Battle = "Battle",
}

var duplicate_overworld_chars := []
var duplicate_battle_chars := []

func assert_matching_node_name_and_class(__node: Node) -> void:
	assert(__node)
	var __node_class := __node.get_class()
	assert(CLASS.values().has(__node_class), str(__node_class, " not in CLASS dict: ", __node.get_path()))
	assert(__node.name == __node_class, "Node name and class must match.")

func show_instructions(__node: Node) -> void:
	assert(__node)
	var __instruction_label := Label.new()
	__instruction_label.rect_size = OS.window_size
	__instruction_label.valign = Label.VALIGN_TOP
	__instruction_label.align = Label.ALIGN_CENTER

	match __node.get_class():
		CLASS.Overworld:
			__instruction_label.text += str(" --- Overworld Scene --- ", "\n",
											"[Enter]: Spawn Overworld character", "\n",
											"[Home]: Reload Overworld scene", "\n",
											"[End]: Go to Battle scene", "\n")
		CLASS.Battle:
			__instruction_label.text += str(" --- Battle Scene --- ", "\n",
											"[Home]: Go to Overworld scene", "\n",
											"[End]: Reload Battle scene", "\n")
		_:
			assert(false)
	__node.add_child(__instruction_label)
	__instruction_label.owner = __node

func _input(event):
	if event.is_action_pressed("ui_home"): # [Home] -> Overworld scene
		get_tree().change_scene("res://Scenes/Overworld/Overworld.tscn")

	elif event.is_action_pressed("ui_end"): # [End] -> Battle scene
		get_tree().change_scene("res://Scenes/Battle/Battle.tscn")
