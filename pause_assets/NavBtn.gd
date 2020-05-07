extends Button

func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	pass

# ON MOUSE HOVER, GRAB FOCUS
func _on_mouse_entered():
	grab_focus()
	pass
