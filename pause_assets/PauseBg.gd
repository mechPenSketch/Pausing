extends Panel

export(Array, NodePath) var np_panels
var current_panel
var main_panel

func _ready():
	for i in np_panels.size():
		var node_panel = get_node(np_panels[i])
		node_panel.set_panel(self)
		
		# THE FIRST PANEL OF THE LIST SHOULD BE THE APPEARING WHEN
		#	THE PAUSE BG BECOMES VISIBLE
		match i:
			0:
				main_panel = node_panel
	
	pass

func _pause_game():
	get_tree().paused = true
	set_visible(true)
	_switch_panel(main_panel)
	pass

func _continue_game():
	get_tree().paused = false
	set_visible(false)
	pass
	
func _switch_panel(new_panel:PanelContainer):
	# THE CURRENT PANEL COULD BE NULL, SO IT SHOULDN'T
	#	(THIS HAPPENS WHEN THE GAME IS PAUSED THE FIRST TIME)
	if current_panel:
		current_panel.set_visible(false)
	
	current_panel = new_panel
	current_panel.set_visible(true)
	pass

func _quit_game():
	get_tree().quit()
	pass
