extends PanelContainer

var pause_bg

var first_to_focus

export(Dictionary) var button_effects

func _ready():
	connect("visibility_changed", self, "_on_visibility_changed")
	pass

func _on_visibility_changed():
	if visible:
		first_to_focus.grab_focus()
	pass

func set_panel(nd):
	pause_bg = nd
	
	for i in button_effects.keys().size():
		var key = button_effects.keys()[i]
		var value = button_effects[key]
		var key_btn = get_node(key)
		if value is NodePath:
			var val_panel = get_node(value)
			key_btn.connect("pressed", pause_bg, "_switch_panel", [val_panel])
		else:
			key_btn.connect("pressed", pause_bg, value)
		
		# THE FIRST ITEM OF THE LIST SHOULD BE THE FIRST TO BE FOCUSED WHEN
		#	THIS PANEL BECOMES VISIBLE	
		match i:
			0:
				first_to_focus = key_btn
	pass
