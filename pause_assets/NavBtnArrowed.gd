extends ToolButton

var icon_normal
export(Texture) var icon_hover

func _ready():
	icon_normal = get_button_icon()
	pass

func _on_NavBtn_focus_entered():
	set_button_icon(icon_hover)
	pass


func _on_NavBtn_focus_exited():
	set_button_icon(icon_normal)
	pass

func _on_mouse_entered():
	grab_focus()
	pass # Replace with function body.


func _on_mouse_exited():
	set_button_icon(icon_normal)
	pass # Replace with function body.
