extends PanelContainer

var pause_bg

export(NodePath) var np_first_to_focus
var first_to_focus

export(Dictionary) var button_effects

func _ready():
	first_to_focus = get_node(np_first_to_focus)
	connect("visibility_changed", self, "_on_visibility_changed")
	pass

func _on_visibility_changed():
	if visible:
		first_to_focus.grab_focus()
	pass

func set_panel(nd):
	pause_bg = nd
	
	for key in button_effects:
		var value = button_effects[key]
		var node = get_node(key)
		if value is NodePath:
			node.connect("pressed", pause_bg, "_switch_panel", value)
		else:
			node.connect("pressed", pause_bg, value)
	pass
