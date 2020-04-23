extends Panel

export(Array, NodePath) var np_panels

func _ready():
	
	for np in np_panels:
		var node_panel = get_node(np)
		node_panel.set_panel(self)
	
	pass

func _on_pauseBtn_pressed():
	get_tree().paused = true
	set_visible(true)
	pass

func _continue_game():
	get_tree().paused = false
	set_visible(false)
	pass
	
func _switch_panel(np):
	var new_panel = get_node(np)
	pass

func _quit_game():
	pass
